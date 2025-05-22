#!/bin/bash

source /etc/file_admin/torrent_conf

clientes=($(cat /var/www/filegator/torrent_info | grep "Equipo: " | sed 's/Equipo: //'))
aulas=($(cat /var/www/filegator/torrent_info | grep "Aula: " | sed 's/Aula: //'))
fecha=$(cat /var/www/filegator/torrent_info | grep "Fecha de creación: " | sed 's/Fecha de creación: //')


if [ ${#clientes[@]} -eq 0 ] && [ ${#aulas[@]} -eq 0 ]; then
	echo "No hay aulas ni clientes seleccionados"; exit 1
else
	echo -n "" > "${torrent_map_folder}torrent_${fecha}"
fi

if [ ${#clientes[@]} -ge 1 ];then
	for i in "${clientes[@]}"; do
		echo $i >> "${torrent_map_folder}torrent_${fecha}"
	done
fi

if [ ${#aulas[@]} -ge 1 ];then
	for i in "${aulas[@]}"; do
		echo $i >> "${torrent_map_folder}torrent_${fecha}"
	done
fi


