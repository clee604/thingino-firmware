$(info --- FILE: external.mk ---)

SOC_VENDOR := ingenic

ifeq ($(BR2_SOC_INGENIC_DUMMY),y)
SOC_MODEL := t31x
BR2_SOC_INGENIC_T31=y
else ifeq ($(BR2_SOC_INGENIC_T10L),y)
SOC_MODEL := t10l
BR2_SOC_INGENIC_T10=y
else ifeq ($(BR2_SOC_INGENIC_T10N),y)
SOC_MODEL := t10n
BR2_SOC_INGENIC_T10=y
else ifeq ($(BR2_SOC_INGENIC_T10A),y)
SOC_MODEL := t10a
BR2_SOC_INGENIC_T10=y
else ifeq ($(BR2_SOC_INGENIC_T20L),y)
SOC_MODEL := t20l
BR2_SOC_INGENIC_T20=y
else ifeq ($(BR2_SOC_INGENIC_T20N),y)
SOC_MODEL := t20n
BR2_SOC_INGENIC_T20=y
else ifeq ($(BR2_SOC_INGENIC_T20X),y)
SOC_MODEL := t20x
BR2_SOC_INGENIC_T20=y
else ifeq ($(BR2_SOC_INGENIC_T21L),y)
SOC_MODEL := t21l
BR2_SOC_INGENIC_T21=y
else ifeq ($(BR2_SOC_INGENIC_T21N),y)
SOC_MODEL := t21n
BR2_SOC_INGENIC_T21=y
else ifeq ($(BR2_SOC_INGENIC_T21X),y)
SOC_MODEL := t21x
BR2_SOC_INGENIC_T21=y
else ifeq ($(BR2_SOC_INGENIC_T21Z),y)
SOC_MODEL := t21z
BR2_SOC_INGENIC_T21=y
else ifeq ($(BR2_SOC_INGENIC_T21ZL),y)
SOC_MODEL := t21zl
BR2_SOC_INGENIC_T21=y
else ifeq ($(BR2_SOC_INGENIC_T23N),y)
SOC_MODEL := t23n
BR2_SOC_INGENIC_T23=y
else ifeq ($(BR2_SOC_INGENIC_T23ZN),y)
SOC_MODEL := t23zn
BR2_SOC_INGENIC_T23=y
else ifeq ($(BR2_SOC_INGENIC_T30L),y)
SOC_MODEL := t30l
BR2_SOC_INGENIC_T30=y
else ifeq ($(BR2_SOC_INGENIC_T30N),y)
SOC_MODEL := t30n
BR2_SOC_INGENIC_T30=y
else ifeq ($(BR2_SOC_INGENIC_T30X),y)
SOC_MODEL := t30x
BR2_SOC_INGENIC_T30=y
else ifeq ($(BR2_SOC_INGENIC_T30A),y)
SOC_MODEL := t30a
BR2_SOC_INGENIC_T30=y
else ifeq ($(BR2_SOC_INGENIC_T31L),y)
SOC_MODEL := t31l
BR2_SOC_INGENIC_T31=y
else ifeq ($(BR2_SOC_INGENIC_T31N),y)
SOC_MODEL := t31n
BR2_SOC_INGENIC_T31=y
else ifeq ($(BR2_SOC_INGENIC_T31X),y)
SOC_MODEL := t31x
BR2_SOC_INGENIC_T31=y
else ifeq ($(BR2_SOC_INGENIC_T31A),y)
SOC_MODEL := t31a
BR2_SOC_INGENIC_T31=y
else ifeq ($(BR2_SOC_INGENIC_T31AL),y)
SOC_MODEL := t31al
BR2_SOC_INGENIC_T31=y
else ifeq ($(BR2_SOC_INGENIC_T31ZL),y)
SOC_MODEL := t31zl
BR2_SOC_INGENIC_T31=y
else ifeq ($(BR2_SOC_INGENIC_T31ZX),y)
SOC_MODEL := t31zx
BR2_SOC_INGENIC_T31=y
else ifeq ($(BR2_SOC_INGENIC_T31XL),y)
SOC_MODEL := t31xl
BR2_SOC_INGENIC_T31=y
else ifeq ($(BR2_SOC_INGENIC_T40N),y)
SOC_MODEL := t40n
BR2_SOC_INGENIC_T40=y
else ifeq ($(BR2_SOC_INGENIC_T40XP),y)
SOC_MODEL := t40xp
BR2_SOC_INGENIC_T40=y
else ifeq ($(BR2_SOC_INGENIC_T40A),y)
SOC_MODEL := t40a
BR2_SOC_INGENIC_T40=y
else ifeq ($(BR2_SOC_INGENIC_T41LQ),y)
SOC_MODEL := t41lq
BR2_SOC_INGENIC_T41=y
else ifeq ($(BR2_SOC_INGENIC_T41NQ),y)
SOC_MODEL := t41nq
BR2_SOC_INGENIC_T41=y
else ifeq ($(BR2_SOC_INGENIC_T41ZL),y)
SOC_MODEL := t41zl
BR2_SOC_INGENIC_T41=y
else ifeq ($(BR2_SOC_INGENIC_T41ZN),y)
SOC_MODEL := t41zn
BR2_SOC_INGENIC_T41=y
else ifeq ($(BR2_SOC_INGENIC_T41ZX),y)
SOC_MODEL := t41zx
BR2_SOC_INGENIC_T41=y
else ifeq ($(BR2_SOC_INGENIC_T41A),y)
SOC_MODEL := t41a
BR2_SOC_INGENIC_T41=y
endif

ifeq ($(BR2_SOC_INGENIC_T10),y)
SOC_FAMILY := t10
KERNEL_BRANCH := $(SOC_VENDOR)-t31
else ifeq ($(BR2_SOC_INGENIC_T20),y)
SOC_FAMILY := t20
KERNEL_BRANCH := $(SOC_VENDOR)-t31
else ifeq ($(BR2_SOC_INGENIC_T21),y)
SOC_FAMILY := t21
KERNEL_BRANCH := $(SOC_VENDOR)-t31
else ifeq ($(BR2_SOC_INGENIC_T23),y)
SOC_FAMILY := t23
KERNEL_BRANCH := $(SOC_VENDOR)-t31
else ifeq ($(BR2_SOC_INGENIC_T30),y)
SOC_FAMILY := t30
KERNEL_BRANCH := $(SOC_VENDOR)-t31
else ifeq ($(BR2_SOC_INGENIC_T31),y)
SOC_FAMILY := t31
KERNEL_BRANCH := $(SOC_VENDOR)-t31
else ifeq ($(BR2_SOC_INGENIC_T40),y)
SOC_FAMILY := t40
KERNEL_BRANCH := $(SOC_VENDOR)-t40
else ifeq ($(BR2_SOC_INGENIC_T41),y)
SOC_FAMILY := t41
KERNEL_BRANCH := $(SOC_VENDOR)-t41
endif

KERNEL_SITE = https://github.com/gtxaspec/openipc_linux
KERNEL_HASH = $(shell git ls-remote $(KERNEL_SITE) $(KERNEL_BRANCH) | head -1 | cut -f1)
THINGINO_KERNEL = https://github.com/gtxaspec/openipc_linux/archive/$(KERNEL_HASH).tar.gz
THINGINO_TOOLCHAIN = https://github.com/themactep/thingino-firmware/releases/download/toolchain/thingino-toolchain_xburst1_musl_gcc13-linux-mipsel.tar.gz

SOC_MODEL_LESS_Z = $(subst z,,$(SOC_MODEL))

export SOC_VENDOR
export SOC_FAMILY
export SOC_MODEL
export SOC_MODEL_LESS_Z
export THINGINO_KERNEL
export THINGINO_TOOLCHAIN

ifneq ($(BR2_SOC_INGENIC_DUMMY),y)
# include makefiles from packages
include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
endif
