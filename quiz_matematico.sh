#!/bin/bash

intentos() {
    local pregunta="$1"
    local respuesta="$2"
    local i=1

    while [ $i -le 3 ]; do
        read -p "$pregunta " resp
        if [ "$resp" -eq "$respuesta" ] 2>/dev/null; then
            echo "Correcto! Muy bien!"
            return
        else
            if [ $i -lt 3 ]; then
                echo "Incorrecto, intentalo de nuevo."
            fi
        fi
        i=$((i + 1))
    done
    echo "Se acabaron los intentos. La respuesta era: $respuesta"
}

suma() {
    local a=$((RANDOM % 101))
    local b=$((RANDOM % 101))
    local resultado=$((a + b))
    echo ""
    echo "=== PROBLEMA DE SUMA ==="
    intentos "Cuanto es $a + $b?" $resultado
}

resta() {
    local a=$((RANDOM % 101))
    local b=$((RANDOM % 101))
    if [ $a -lt $b ]; then
        local tmp=$a
        a=$b
        b=$tmp
    fi
    local resultado=$((a - b))
    echo ""
    echo "=== PROBLEMA DE RESTA ==="
    intentos "Cuanto es $a - $b?" $resultado
}

multiplicacion() {
    local a=$(( (RANDOM % 100) + 1 ))
    local b=$(( (RANDOM % 10) + 1 ))
    local resultado=$((a * b))
    echo ""
    echo "=== PROBLEMA DE MULTIPLICACION ==="
    intentos "Cuanto es $a * $b?" $resultado
}

division() {
    local a=$(( (RANDOM % 20) + 1 ))
    local b=$(( (RANDOM % 10) + 1 ))
    a=$((a * b))
    local resultado=$((a / b))
    echo ""
    echo "=== PROBLEMA DE DIVISION ==="
    intentos "Cuanto es $a / $b?" $resultado
}

while true; do
    echo ""
    echo "QUIZ MATEMATICO"
    echo "1) Problemas de suma"
    echo "2) Problemas de resta"
    echo "3) Problemas de multiplicacion"
    echo "4) Problemas de division"
    echo "9) Salir"
    read -p "Elige una opcion: " opcion

    case $opcion in
        1) suma ;;
        2) resta ;;
        3) multiplicacion ;;
        4) division ;;
        9) echo "Hasta luego!"; exit 0 ;;
        *) echo "Opcion no valida, intenta de nuevo." ;;
    esac
done
