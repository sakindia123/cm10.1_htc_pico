#!/sbin/sh
#
# Check if there is enough space on /system to install full ROM.
#

sys_size=$(df -h system|grep dev/block|awk '{ print substr($2,1,length($2)-3) }')

# Make sure setprop link exists for older CWM versions.
ln -s /sbin/recovery /sbin/setprop

if [ $sys_size -ge 243 ]; then
    setprop install.extras 1
else
    setprop install.extras 0
fi
