THEOS_DEVICE_IP=192.168.1.103

include theos/makefiles/common.mk

TWEAK_NAME = Respring
Respring_FILES = Tweak.xm
Respring_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
