#!/bin/bash

listaEquipos() {
	grep "EQUIPO" informacion | cut -d "=" -f 2
}

campeon() {
	grep "CAMPEON" informacion | cut -d "=" -f 2
}

registrarEquipo() {
	codigo
}

registrarPartido() {
	codigo
}

historial() {
	codigo
}

buscarEquipo() {
	codigo
}

cantidadPartidos() {
	codigo
}

salir() {
	exit 0
}




while true
do
	echo "Bienvenido al mundial"
	echo "1-Lista de equipos"
	echo "2-Campeon actual"
	echo "3-Registrar Equipo"
	echo "4-Registrar Partido"
	echo "5-Historial"
	echo "6-Buscar equipo"
	echo "7-Cantidad de Partidos"
	echo "8-Salir"
	read opcion


	case $opcion in 
		1) listaEquipos ;;
		2) campeon ;;
		3) registrarEquipo ;;
		4) registrarPartido ;;
		5) historial ;;
		6) buscarEquipo ;;
		7) cantidadPartidos ;;
		8) salir ;;
		*) echo "Opcion invalida" ;;
	esac

done
