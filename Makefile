export THEOS=/var/theos
ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
IGNORE_WARNINGS=0
MOBILE_THEOS=1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ThienNhanDev

PROJ_COMMON_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText

ThienNhanDev_CFLAGS = -fobjc-arc -I$(THEOS_PROJECT_DIR)/imgui
ThienNhanDev_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG

ThienNhanDev_FILES = \
    main.mm \
    FPSDisplay.m \
    $(wildcard SCLAlertView/*.m) \
    imgui/imgui.cpp \
    imgui/imgui_draw.cpp \
    imgui/imgui_widgets.cpp \
    imgui/imgui_tables.cpp \
    imgui/imgui_demo.cpp

ThienNhanDev_LIBRARIES += substrate
ThienNhanDev_FRAMEWORKS = $(PROJ_COMMON_FRAMEWORKS)

ThienNhanDev_LDFLAGS += API/libTKAPIKey.a

include $(THEOS_MAKE_PATH)/tweak.mk