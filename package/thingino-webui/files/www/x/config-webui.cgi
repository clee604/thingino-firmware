#!/bin/haserl
<%in _common.cgi %>
<%
page_title="Web Interface"

# read values from configs
. $WEB_CONFIG_FILE

if [ "POST" = "$REQUEST_METHOD" ]; then
	error=""

	read_from_post "webui" "paranoid theme ws_token"

	if [ -z "$error" ]; then
		save2config "
webui_paranoid=$webui_paranoid
webui_theme=$webui_theme
webui_ws_token=$webui_ws_token
"
		new_password="$POST_ui_password_new"
		[ -n "$new_password" ] && echo "root:$new_password" | chpasswd -c sha512 >/dev/null

		redirect_back "success" "Data updated"
	fi
fi

# data for form fields
ui_username="$USER"
%>
<%in _header.cgi %>

<form action="<%= $SCRIPT_NAME %>" method="post" class="mb-4">
<div class="row row-cols-1 row-cols-md-2 row-cols-xl-3">
<div class="col">
<div class="string mb-2">
<label for="ui_username" class="form-label">Web UI username</label>
<input type="text" id="ui_username" name="ui_username" value="<%= $ui_username %>" class="form-control" autocomplete="username" disabled>
</div>
<% field_password "ui_password_new" "Password" %>
<% field_select "webui_theme" "Theme" "light,dark,auto" %>
<% field_switch "webui_paranoid" "Paranoid mode" "Isolated from internet by air gap, firewall, VLAN etc." %>
</div>
<div class="col">
</div>
<div class="col">
<% field_password "ws_token" "Websockets security token" "FIXME: a stub" %>
</div>
</div>
<% button_submit %>
</form>

<div class="alert alert-dark ui-debug d-none">
<h4 class="mb-3">Debug info</h4>
<% ex "grep ^webui_ $WEB_CONFIG_FILE" %>
<% ex "cat /etc/httpd.conf" %>
</div>

<%in _footer.cgi %>
