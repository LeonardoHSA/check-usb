#!/bin/bash

# Define o diretório para monitorar
diretorio="/media/$(whoami)"

# Verifica se o diretório existe
if [ -d "$diretorio" ]; then
    echo "Aguardando a conexão de um pendrive..."

    # Loop infinito para monitorar o diretório
    while true; do
        # Verifica se há algum arquivo no diretório
        if [ "$(ls -A $diretorio)" ]; then
            echo "Pendrive conectado!"
            # Insira aqui os comandos que deseja executar quando o pendrive for conectado
            espeak "USB conected"
            # Quebra o loop
            break
        fi
        

        # Aguarda por 1 segundo antes de verificar novamente
        sleep 1
    done

    while true; do
        # Verifica se o pendrive foi desconectado
        if [ -z "$(ls -A $diretorio)" ]; then

           echo "Pendrive desconetado"        
           
           espeak "USD desconected"

           break 
          
        fi

    done
    
else
    echo "Diretório '$diretorio' não encontrado."
fi
