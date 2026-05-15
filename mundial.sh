#!/bin/bash

archivo="informacion"

listaEquipos() {
	echo "--- Lista de Equipos: ---"
	grep "^EQUIPO=" informacion | cut -d'=' -f2
	echo "--- Fin ---" 
}



campeon() {
	echo "--- Campeon Actual: ---"
	grep "^CAMPEON=" $archivo | cut -d'=' -f2
	echo "--- Fin ---"
}




registrarEquipo() {
	echo "--- Ingrese el nombre del equipo: ---"
	read nombreEquipo

	if [ -z "$nombreEquipo" ]; then
		echo "No se a detectado ningun equipo, ingrese un equipo nuevamente porfavor"
	else
		cantidad=$(grep -c "^EQUIPO=" $archivo)
		if [ $cantidad -ge 15 ]; then
			echo "Advertencia: ya hay 15 equipos"
		fi
		echo "EQUIPO=$nombreEquipo" >> $archivo
		echo "Equipo registrado correctamente"
	fi

}



registrarPartido() {
	echo "---Ingrese equipo 1 ---"
	read equipo1
	if [ -z "$equipo1" ]; then
		echo "El nombre no puede estar vacio"
		return
	fi

	echo "--- Ingrese equipo 2 ---"
	read equipo2

	if [ -z "$equipo2" ]; then
		echo "El nombre no puede estar vacio"
		return
	fi

	echo "--- Ingrese goles equipo 1 ---"
	read goles1
	if [ -z "$goles1" ]; then
		echo "El numero de goles no es valido"
		return
	fi

	echo "--- Ingrese goles equipo 2 ---"
	read goles2
	if [ -z "$goles2" ]; then
		echo "El numero de goles no es valido"
		return
	fi

	echo "PARTIDO"=$equipo1 $goles1 $equipo2 $goles2" >> $archivo
}



historial() {
	partidos=$(grep "PARTIDO" $archivo)
	
	if [ -z "$partidos" ]; then
		echo "No hay partidos registrados"
		return	
	fi

	echo "--- El resultado del partido fue $partidos ---"
}	




buscarEquipo() {
	echo "--- Ingrese un equipo para buscar ---"
	read nombreEquipo
	if [ -z "$nombreEquipo" ]; then
		echo "El campo no puede estar vacio"
		return
	fi

	resultado=$(grep "Equipo=$nombreEquipo" $archivo)

	if [ -z "$resultado" ]; then
		echo "El equipo no existe"
	else
		echo "El equipo existe" 
	fi


}



cantidadPartidos() {

	echo "--- Cantidad de partidos jugados:   ---"
	grep "PARTIDO" $archivo | wc -l
}




salir() {
	exit 0
}




while true
do
	echo "			              ===Bienvenido al mundial==="
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
		6) busacarEquipo ;;
		7) cantidadPartidos ;;
		8) salir ;;
		*) echo "Opcion invalida" ;;
	esac

done
