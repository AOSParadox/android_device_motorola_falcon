#!/bin/bash

export VENDOR=motorola
export DEVICE=falcon
# Comment these out if there is no common device tree for this device
export COMMON_DEVICE=falcon
export BOARD_VENDOR=motorola-qcom
export TARGET_BOARD_PLATFORM=msm8226

../$COMMON_DEVICE/setup-makefiles.sh $@
