# Acerca del repositorio

Este repositorio es una colección de programas en assembler intel x86 de 64 bits en linux cuyo objetivo es ser útil para mis examenes. Si ves esto y te resulta útil, chevere

# Ejecución

## Requerimientos

* Contar con NASM para compilar los programas. Instalación en linux:
```shell
sudo apt install nasm
```

## Compilación

Es el proceso de convertir el archivo de asm a un objeto

```shell
nasm -f elf64 <file>.asm -o <object>.o
```

## Enlazamiento

Sirve para enlazar los objetos en un ejecutable 

```shell
ld <object.o> -o <program>
```

## Ejecución del programa

```shell
./<program>
```