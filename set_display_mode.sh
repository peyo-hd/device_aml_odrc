#!/system/bin/sh

if [ "$(getprop persist.sys.outputx)" = "" ] ; then
    outputx=0
else outputx=$(getprop persist.sys.outputx)
fi
if [ "$(getprop persist.sys.outputy)" = "" ] ; then
    outputy=0
else outputy=$(getprop persist.sys.outputy)
fi
if [ "$(getprop persist.sys.outputwidth)" = "" ] ; then
    outputwidth=1920
else outputwidth=$(getprop persist.sys.outputwidth)
fi
if [ "$(getprop persist.sys.outputheight)" = "" ] ; then
    outputheight=1080
else outputheight=$(getprop persist.sys.outputheight)
fi
if [ "$(getprop persist.sys.outputmode)" = "" ] ; then
    outputmode=1080p
else outputmode=$(getprop persist.sys.outputmode)
fi

echo $outputmode > /sys/class/display/mode
echo 0 0 $(($outputwidth - 1)) $(($outputheight - 1)) > /sys/class/graphics/fb0/free_scale_axis
echo $outputx $outputy $(($outputx + $outputwidth - 1)) $(($outputy + $outputheight - 1)) > /sys/class/graphics/fb0/window_axis
echo 0x10001 > /sys/class/graphics/fb0/free_scale
echo 0 > /sys/class/graphics/fb1/free_scale
echo rm default > /sys/class/vfm/map
echo add default decoder ionvideo > /sys/class/vfm/map
