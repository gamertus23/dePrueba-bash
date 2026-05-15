#!/bin/bash

<<<<<<< HEAD
archivo="informacion"

listaEquipos() {
	echo "--- Lista de Equipos: ---"
	grep "^EQUIPO=" informacion | cut -d'=' -f2
	echo "--- Fin ---" 
=======
ARCHIVO="informacion"


listaEquipos() {
	grep "EQUIPO" $ARCHIVO | cut -d "=" -f 2
>>>>>>> ed3e5b4c49bda3ec77e059fbcd24c54fb46b619a
}



campeon() {
<<<<<<< HEAD
	echo "--- Campeon Actual: ---"
	grep "^CAMPEON=" $archivo | cut -d'=' -f2
	echo "--- Fin ---"
=======
	grep "CAMPEON" $ARCHIVO | cut -d "=" -f 2
>>>>>>> ed3e5b4c49bda3ec77e059fbcd24c54fb46b619a
}




registrarEquipo() {
<<<<<<< HEAD
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

=======
	equipos=$(grep "EQUIPO" $ARCHIVO | wc -l)
		if [ "$equipos" -ge 15 ]; then
 		echo "El limite es 15 equipos" 
 		return
	fi

	echo "Ingrese un nuevo equipo"
    	read nombreEquipo
    	if [ -z "$nombreEquipo" ]; then
        	echo "El nombre no puede estar vacio"
        	return
    	fi
	echo "EQUIPO=$nombreEquipo" >> $ARCHIVO
>>>>>>> ed3e5b4c49bda3ec77e059fbcd24c54fb46b619a
}



registrarPartido() {
<<<<<<< HEAD
	echo "---Ingrese equipo 1 ---"
=======
	echo "Ingrese equipo 1"
>>>>>>> ed3e5b4c49bda3ec77e059fbcd24c54fb46b619a
	read equipo1
	if [ -z "$equipo1" ]; then
		echo "El nombre no puede estar vacio"
		return
	fi

<<<<<<< HEAD
	echo "--- Ingrese equipo 2 ---"
=======
	echo "Ingrese equipo 2"
>>>>>>> ed3e5b4c49bda3ec77e059fbcd24c54fb46b619a
	read equipo2

	if [ -z "$equipo2" ]; then
		echo "El nombre no puede estar vacio"
		return
	fi

<<<<<<< HEAD
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
=======
	echo "Ingrese goles equipo 1"
	read goles1
	if [ -z "$goles1" ]; then
		echo "El campo no puede estar vacio"
		return
	fi

	echo "Ingrese goles equipo 2"
	read goles2
	if [ -z "$goles2" ]; then
		echo "El campo no puede estar vacio"
		return
	fi

	echo "PARTIDO=$equipo1 $goles1 $equipo2 $goles2" >> $ARCHIVO
>>>>>>> ed3e5b4c49bda3ec77e059fbcd24c54fb46b619a
}



historial() {
<<<<<<< HEAD
	partidos=$(grep "PARTIDO" $archivo)
	
	if [ -z "$partidos" ]; then
		echo "No hay partidos registrados"
		return	
	fi

	echo "--- El resultado del partido fue $partidos ---"
}	




buscarEquipo() {
	echo "--- Ingrese un equipo para buscar ---"
=======
	partidos=$(grep "PARTIDO" $ARCHIVO)

	if [ -z "$partidos" ]; then
		echo "No hay partidos registrados"
		return
	fi

	echo "$partidos"
}

buscarEquipo() {
	echo "Ingrese un equipo para buscar"
>>>>>>> ed3e5b4c49bda3ec77e059fbcd24c54fb46b619a
	read nombreEquipo
	if [ -z "$nombreEquipo" ]; then
		echo "El campo no puede estar vacio"
		return
	fi

<<<<<<< HEAD
	resultado=$(grep "Equipo=$nombreEquipo" $archivo)
=======
	resultado=$(grep "EQUIPO=$nombreEquipo" $ARCHIVO)
>>>>>>> ed3e5b4c49bda3ec77e059fbcd24c54fb46b619a

	if [ -z "$resultado" ]; then
		echo "El equipo no existe"
	else
<<<<<<< HEAD
		echo "El equipo existe" 
	fi


=======
		echo "El equipo existe"
	fi

>>>>>>> ed3e5b4c49bda3ec77e059fbcd24c54fb46b619a
}



cantidadPartidos() {
<<<<<<< HEAD

	echo "--- Cantidad de partidos jugados:   ---"
	grep "PARTIDO" $archivo | wc -l
=======
	echo "Cantidad de partidos jugados:"
	grep "PARTIDO" $ARCHIVO | wc -l
>>>>>>> ed3e5b4c49bda3ec77e059fbcd24c54fb46b619a
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
		6) buscarEquipo ;;
		7) cantidadPartidos ;;
		8) salir ;;
		*) echo "Opcion invalida" ;;
	esac

done
