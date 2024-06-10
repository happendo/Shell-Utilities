#!/bin/bash

LANG=C

INTERFACE='eno1'
MIN_SPEED=5

# Captura a velocidade atual da interface
CURRENT_SPEED=$(ifstat -i $INTERFACE 1 1 | awk 'NR==3 {print $1}')

# Remove qualquer ponto decimal para comparar inteiros
INT=${CURRENT_SPEED/\.*}

# Compara a velocidade atual com a velocidade mínima
if [ "$INT" -lt "$MIN_SPEED" ]; then
    echo 0
else
    echo 1
fi

