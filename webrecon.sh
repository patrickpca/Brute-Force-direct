#!/bin/bash


for palavra in $(cat lista_common.txt)
do
        resposta=$(curl -s -H "User-Agent: Mozila/5.0" -o /dev/null -w "%{http_code}" $1/$palavra/)
        if [ $resposta == "200" ]
        then
                echo "Diretorio encontrado: $1/$palavra/"
        fi


        arquivo=$(curl -s -H "User-Agent: Mozila/5.0" -o /dev/null -w "%{http_code}" $1/$palavra)

        if [ $arquivo == "200" ]
        then
                echo "Arquivo encontrado: $1/$arquivo"
        fi

        extensao=$(curl -s -H "User-Agent: Mozila/5.0" -o /dev/null -w "%{http_code}" $1/$palavra.$2)
        if [ $extensao == "200" ]
        then
                echo "Arquivo encontrado: $1/$palavra.$2"

        fi
done
