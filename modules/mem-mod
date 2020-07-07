memstr=$(free -m | grep 'Mem:')
echo $memstr | awk 'ORS="";{print $2 - $7}'
echo -n ' / '
echo $memstr | awk 'ORS="";{print $2}'
echo ' MB'
