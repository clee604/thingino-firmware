#!/bin/haserl
<%in _common.cgi %>
<%
page_title="Video Recorder"
params="device_path duration enabled filename limit mount videofmt"

# constants
MOUNTS=$(awk '/cif|fat|nfs|smb/{print $2}' /etc/mtab)
RECORD_CTL="/etc/init.d/S96record"
RECORD_FILENAME_FB="%Y%m%d/%Y%m%dT%H%M%S"
config_file="/etc/webui/record.conf"
include $config_file

# defaults
defaults() {
	default_for record_enabled "false"
	default_for record_device_path "$(hostname)/records"
	default_for record_filename "$RECORD_FILENAME_FB"
	[ "/" = "${record_filename:0-1}" ] && record_filename="$RECORD_FILENAME_FB"
	default_for $record_videofmt "mp4"
	default_for record_duration 60
	default_for record_led $(fw_printenv | awk -F= '/^gpio_led/{print $1;exit}')
}

if [ "POST" = "$REQUEST_METHOD" ]; then
	read_from_post "record" "$params"
	defaults

	# normalize
	[ "/" = "${record_filename:0:1}" ] && record_filename="${record_filename:1}"

	# validate
	error_if_empty "$record_mount" "Record mount cannot be empty."
	error_if_empty "$record_filename" "Record filename cannot be empty."

	if [ -z "$error" ]; then
		tmp_file=$(mktemp -u)
		[ -f "$config_file" ] && cp "$config_file" "$tmp_file"
		for p in $params; do
			sed -i -r "/^record_$p=/d" "$tmp_file"
			echo "record_$p=\"$(eval echo \$record_$p)\"" >> "$tmp_file"
		done
		mv $tmp_file $config_file

		if [ -f "$RECORD_CTL" ]; then
			if [ "true" = "$record_enabled" ]; then
				$RECORD_CTL start > /dev/null
			else
				$RECORD_CTL stop > /dev/null
			fi
		fi
		update_caminfo
	fi
	redirect_to $SCRIPT_NAME
fi

defaults
%>
<%in _header.cgi %>

<form action="<%= $SCRIPT_NAME %>" method="post" class="mb-4">
<% field_switch "record_enabled" "Enable Recorder" %>
<div class="row row-cols-1 row-cols-md-2">

<div class="col">

<% field_select "record_mount" "Storage mount" "$MOUNTS" "SD card or a network share" %>
<div class="row g-1">
<div class="col-8"><% field_text "record_device_path" "Device-specific path" "Helps to deal with multiple devices" %></div>
<div class="col-4"><% field_number "record_limit" "Storage limit" "" "gigabytes" %></div>
</div>
<a href="tool-file-manager.cgi?cd=/mnt" id="link-fm">Open in File Manager</a>

<div class="row g-1">
<div class="col-8"><% field_text "record_filename" "File name template" "$STR_SUPPORTS_STRFTIME" %></div>
<div class="col-2"><% field_number "record_duration" "Duration" "" "seconds" %></div>
<div class="col-2"><% field_select "record_videofmt" "Format" "mov, mp4" "also extension" %></div>
</div>
</div>
<div class="col">
<% if pidof record > /dev/null; then %>
<h3 class="alert alert-info">Recording in progress.</h3>
<% else %>
<div class="alert alert-danger">
<h3>Recording stopped.</h3>
<p class="mb-0">Please note. The last active recording will continue until the end of the recording time!</p>
</div>
<% fi %>
</div>
</div>
<% button_submit %>
</form>

<div class="alert alert-dark ui-debug d-none">
<h4 class="mb-3">Debug info</h4>
<% ex "cat $config_file" %>
<% ex "fw_printenv | grep ^record_" %>
</div>

<script>
$('#link-fm').addEventListener('click', ev => {
	ev.target.href = 'tool-file-manager.cgi?cd=' + $('#record_mount').value
})
</script>

<%in _footer.cgi %>
