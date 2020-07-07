iw dev wlp6s0 link | grep 'SSID' | awk '{ print $2 }' | tr -d '\n'
echo -n ': '
cat /proc/net/wireless | grep 'wlp' | awk '{ split(FILENAME, array, "/"); print array[5] $3 }' | tr -d '.'
