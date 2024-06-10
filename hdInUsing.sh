#!/bin/bash

noUsageRead=0.00
noUsageWrite=0.00
iotop_output=$(iotop -bto --iter=2)
read_above_zero=0
write_above_zero=0

# Filtra as linhas que contêm "Total DISK READ" ou "Total DISK WRITE" da saída do iotop
total_disk_lines=$(echo "$iotop_output" | grep -E "Total DISK READ|Total DISK WRITE")

while IFS= read -r line; do
    if [[ "$line" =~ Total\ DISK\ READ:\ *([0-9]+\.[0-9]+) ]]; then
        read_value=${BASH_REMATCH[1]}
        # Se o valor de leitura for maior que 0, atualiza o indicador read_above_zero
        if (( $(echo "$read_value > 0" | bc -l) )); then
            read_above_zero=1
        fi
    fi
    if [[ "$line" =~ Total\ DISK\ WRITE:\ *([0-9]+\.[0-9]+) ]]; then
        write_value=${BASH_REMATCH[1]}
        # Se o valor de escrita for maior que 0, atualiza o indicador write_above_zero
        if (( $(echo "$write_value > 0" | bc -l) )); then
            write_above_zero=1
        fi
    fi
done <<< "$total_disk_lines"

# Se qualquer um dos indicadores (leitura ou escrita) for 1, imprime 0 (uso de disco ocorreu)
if (( read_above_zero == 1 || write_above_zero == 1 )); then
    echo 0
else
    echo 1
fi
