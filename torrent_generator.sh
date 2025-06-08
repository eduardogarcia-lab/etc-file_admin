#!/bin/bash
source /etc/file_admin/torrent_conf

#if [ ! -e "${torrent_file_folder}settings.json" ]; then
#	echo '{
#	"rpc-enabled": true,
#	"rpc-authentication-required": false,
#       "lpd-enabled": true,
#        "utp-enabled": false
#	}' > "${torrent_file_folder}settings.json"
#fi

for i in $(find $torrent_repository -name "torrent.txt" -mtime -${max_days_transmission}); do
echo "AA"
	file_trans=$(stat -c %y "$i" | cut -d'.' -f1 | sed 's/ /--/')
	if grep -qE "Transmision: activa" $i && ! pgrep -f "$file_trans" > /dev/null; then
    		echo "BB"
		echo "$file_trans"
		transmission-cli \
        	    -w "$(dirname "$(dirname "$i")")" \
            	    -g "${torrent_file_folder}torrents/" \
        	    "${torrent_file_folder}${file_trans}.torrent" \
        	    > /dev/null 2>&1 &
	else
		continue
	fi
done
echo "CC"
for j in $(find $torrent_repository -name "torrent.txt" -mtime +${max_days_transmission} -mtime -${max_days_on_computer}); do
	file_stop=$(stat -c %y "$j" | cut -d'.' -f1 | sed 's/ /--/')
	if grep -qE "Transmision: activa" $j && ! pgrep -f "$file_stop" > /dev/null; then
		sed -i 's/activa/inactiva/' $j
		kill -9 $(ps aux | grep ${file_stop} | head -1 | awk -F " " '{print $2}')
	else
		continue
	fi
done

for x in $(find $torrent_repository -name "torrent.txt" -mtime +${max_days_on_computer}); do
	file_del=$(stat -c %y "$x" | cut -d'.' -f1 | sed 's/ /--/')
	rm -f $x
	rm -f ${torrent_file_folder}${file_del}.torrent
	rm -f ${torrent_map_folder}torrent_${file_del}
done
