#!/bin/bash

ctrl_c(){
  echo -e "\n\n [!] Saliendo...\n"
  exit 1
}
# Ctrl+C
trap ctrl_c INT

descomprimir_gz(){
file_name=""

echo -e " [+] Que fixero .gz quieres descomprimir: \n"

archivos=$(ls *.gz 2>/dev/null)

if [ -z "$archivos" ]; then 
  echo -e "\n [!] No se ha encontrado ningun archivo .gz en el directorio actual.\n"
  return
else
  echo "$archivos"
fi


echo -e "\n [+] Introduce el nombre del archivo que deseas descomprimir: \n"

read file_name 

decompressed_file_name="$(7z l "$file_name" | tail -n 3 | head -n1 | awk '$NF{print $NF}')"

7z x "$file_name" &>/dev/null
last_valid_name="$decompressed_file_name"

while [ $decompressed_file_name ]; do 
  echo -e "\n [+] Nuevo archivo descomprimido: $decompressed_file_name"
  7z x "$decompressed_file_name" &>/dev/null
  last_valid_name="$decompressed_file_name"
  decompressed_file_name="$(7z l "$decompressed_file_name" 2>/dev/null | tail -n 3 | head -n1 | awk '$NF{print $NF}')"
done

echo -e "\n\n[^_^] Archivo final: $last_valid_name"
}

descomprimir_tar(){

  file_name=""

echo -e " [+] Que fixero .tar quieres descomprimir: \n"

archivos=$(ls *.tar 2>/dev/null)

if [ -z "$archivos" ]; then
  echo -e "\n [!] No se ha encontrado ningun archivo .tar en el directorio actual.\n"
  return
else
  echo "$archivos"
fi

echo -e "\n [+] Introduce el nombre del archivo que deseas descomprimir: \n"

read file_name 

decompressed_file_name="$(7z l "$file_name" | tail -n 3 | head -n1 | awk '$NF{print $NF}')"

7z x "$file_name" &>/dev/null
last_valid_name="$decompressed_file_name"

while [ $decompressed_file_name ]; do 
  echo -e "\n [+] Nuevo archivo descomprimido: $decompressed_file_name"
  7z x "$decompressed_file_name" &>/dev/null
  last_valid_name="$decompressed_file_name"
  decompressed_file_name="$(7z l "$decompressed_file_name" 2>/dev/null | tail -n 3 | head -n1 | awk '$NF{print $NF}')"
done

echo -e "\n\n[^_^] Archivo final: $last_valid_name"
}

descomprimir_zip(){

  file_name=""

echo -e " [+] Que fixero .zip quieres descomprimir: \n"

archivos=$(ls *.zip 2>/dev/null)

if [ -z "$archivos" ]; then
  echo -e "\n [!] No se ha encontrado ningun archivo .zip en el directorio actual.\n"
  return
else
  echo "$archivos"
fi

echo -e "\n [+] Introduce el nombre del archivo que deseas descomprimir: \n"

read file_name

decompressed_file_name="$(7z l "$file_name" | tail -n 3 | head -n1 | awk '$NF{print $NF}')"

7z x "$file_name" &>/dev/null
last_valid_name="$decompressed_file_name"

while [ $decompressed_file_name ]; do
  echo -e "\n [+] Nuevo archivo descomprimido: $decompressed_file_name"
  7z x "$decompressed_file_name" &>/dev/null
  last_valid_name="$decompressed_file_name"
  decompressed_file_name="$(7z l "$decompressed_file_name" 2>/dev/null | tail -n 3 | head -n1 | awk '$NF{print $NF}')"
done

echo -e "\n\n[^_^] Archivo final: $last_valid_name"
}

menu(){
  opcion=""

  echo -e "\n [+] En que formato esta el fixero. \n"

  echo -e "\n   [1] .gz\n"
  echo -e "\n   [2] .tar\n"
  echo -e "\n   [3] .zip\n"

  read opcion

  if [ "$opcion" == "1" ]; then
    descomprimir_gz
  elif [ "$opcion" == "2" ]; then
    descomprimir_tar
  elif [ "$opcion" == "3" ]; then
    descomprimir_zip
  fi
}

menu  
