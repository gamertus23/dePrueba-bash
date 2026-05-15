#!/bin/bash

ARCHIVO="informacion"

partidos=$(grep "PARTIDO" $ARCHIVO)

listaEquipos() {
	grep "EQUIPO" $ARCHIVO | cut -d "=" -f 2
}

campeon() {
	grep "CAMPEON" $ARCHIVO | cut -d "=" -f 2
}

registrarEquipo() {
    echo "Ingrese un nuevo equipo"
    read nombreEquipo
    if [ -z "$nombreEquipo" ]; then
        echo "El nombre no puede estar vacio"
        return
    fi
	echo "EQUIPO=$nombreEquipo" >> $ARCHIVO
}


registrarPartido() {
	echo "Ingrese equipo 1"
	read equipo1
	if [ -z "$equipo1" ]; then
		echo "El nombre no puede estar vacio"
		return
	fi

	echo "Ingrese equipo 2"
	read equipo2

	if [ -z "$equipo2" ]; then
		echo "El nombre no puede estar vacio"
		return
	fi

	echo "Ingrese goles equipo 1"
	read goles1
	if [ -z "$goles1" ]; then
		echo "El nombre no puede estar vacio"
		return
	fi

	echo "Ingrese goles equipo 2"
	read goles2
	if [ -z "$goles2" ]; then
		echo "El nombre no puede estar vacio"
		return
	fi

	echo "PARTIDO=$equipo1 $goles1 $equipo2 $goles2" >> $ARCHIVO
}

historial() {
	grep "PARTIDO" $ARCHIVO | cut -d "=" -f 2
	if [ -z "$partidos" ]; then
		echo "No hay partidos registrados"
	return
	fi
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
