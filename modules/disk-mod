diskstr=$(df -B 1073741824 | grep -w /)
echo $diskstr | awk 'ORS="";{print $4}'
echo -n ' / '
echo $diskstr | awk 'ORS="";{print $2}'
echo ' GB'
