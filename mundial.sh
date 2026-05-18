#!/bin/bash
#Renzo Amestoy - 361801 / Santiago Rodriguez - 000000
ARCHIVO="informacion"


listaEquipos() {
	echo "-------------------------"
	grep "EQUIPO" $ARCHIVO | cut -d "=" -f 2
	echo "-------------------------"
}

campeon() {
	echo "-------------------------"
	grep "CAMPEON" $ARCHIVO | cut -d "=" -f 2
	echo "-------------------------"
}

registrarEquipo() {
	equipos=$(grep "EQUIPO" $ARCHIVO | wc -l)
		if [ "$equipos" -ge 15 ]; then
 		echo "------------------------"
		echo "El limite es 15 equipos" 
 		echo "------------------------"
		return
	fi
	echo "--------------------------"
	echo "Ingrese un nuevo equipo: "
    	echo "--------------------------"
	read nombreEquipo
    	if [ -z "$nombreEquipo" ]; then
        	echo "-------------------------------"
		echo "El nombre no puede estar vacio"
        	echo "-------------------------------"	
		return
    	fi
	echo "------------------------"
	echo "EQUIPO=$nombreEquipo" >> $ARCHIVO
	echo "------------------------"
}

registrarPartido() {
	echo "------------------"
	echo "Ingrese equipo 1:"
	echo "------------------"
	read equipo1
	if [ -z "$equipo1" ]; then
		echo "-------------------------------"
		echo "El nombre no puede estar vacio"
		echo "-------------------------------"
		return
	fi
	echo "-------------------"
	echo "Ingrese equipo 2:"
	echo "-------------------"
	read equipo2

	if [ -z "$equipo2" ]; then
		echo "-------------------------------"
		echo "El nombre no puede estar vacio"
		echo "-------------------------------"
		return
	fi
	echo "------------------------"
	echo "Ingrese goles equipo 1:"
	echo "------------------------"
	read goles1
	if [ -z "$goles1" ]; then
		echo "------------------------------"
		echo "El campo no puede estar vacio"
		echo "------------------------------"
		return
	fi
	echo "------------------------"
	echo "Ingrese goles equipo 2:"
	echo "------------------------"
	read goles2
	if [ -z "$goles2" ]; then
		echo "------------------------------"
		echo "El campo no puede estar vacio"
		echo "------------------------------"
		return
	fi
	echo "-------------------------------------------------------"
	echo "PARTIDO=$equipo1 $goles1 $equipo2 $goles2" >> $ARCHIVO
	echo "-------------------------------------------------------"
}

historial() {
	partidos=$(grep "PARTIDO" $ARCHIVO)

	if [ -z "$partidos" ]; then
		echo "---------------------------"
		echo "No hay partidos registrados"
		echo "---------------------------"
		return
	fi
	echo "-------------------------------------------------------------"
	echo "$partidos" | sed 's/PARTIDO=/El resultado del partido fue: /'
	echo "-------------------------------------------------------------"
}

buscarEquipo() {
	echo "-------------------------------"
	echo "Ingrese un equipo para buscar:"
	echo "-------------------------------"
	read nombreEquipo
	if [ -z "$nombreEquipo" ]; then
		echo "-----------------------------"
		echo "El campo no puede estar vacio"
		echo "-----------------------------"
		return
	fi

	resultado=$(grep "EQUIPO=$nombreEquipo" $ARCHIVO)

	if [ -z "$resultado" ]; then
		echo "-------------------"
		echo "El equipo no existe"
		echo "-------------------"
	else
		echo "-------------------"
		echo "El equipo existe"
		echo "-------------------"
	fi

}

cantidadPartidos() {
	echo "------------------------------"
	echo "Cantidad de partidos jugados:"
	
	grep "PARTIDO" $ARCHIVO | wc -l
	echo "------------------------------"
}

salir() {
	exit 0
}




while true
do
	echo "                                       === Bienvenido al mundial ==="
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
		*) echo "-------------------"
		   echo "  Opcion invalida" 
		   echo "-------------------";;
	esac

done
