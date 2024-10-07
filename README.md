# Script de Instalación de Byobu

> **Nota:** Este script ha sido probado en **RHEL 9**. Su funcionamiento en otras distribuciones puede requerir ajustes.

Este script descarga e instala la versión especificada de **Byobu**. El script también verifica la presencia de las dependencias necesarias y, si no se encuentran instaladas, las instala automáticamente.

## Requisitos

Se requiere privilegios de **sudo** para instalar las dependencias necesarias y realizar la instalación de Byobu.

Las siguientes dependencias deben estar instaladas en el sistema:

- `tar`
- ~~`screen`~~
- `tmux`
- `make`
- `curl`

Si alguna de estas dependencias no está presente, el script intentará instalarlas.

## Uso

1. Clona este repositorio o descarga el script en tu máquina.

2. Otorga permisos de ejecución al script:

    ```bash
    chmod +x instalar_byobu.sh
    ```

3. Ejecuta el script como superusuario:

    ```bash
    sudo ./instalar_byobu.sh
    ```

4. El script descargará e instalará la versión 5.133 de **Byobu** (puedes cambiar la versión en el script).

## Descripción del Script

El script realiza los siguientes pasos:

1. **Verificación de dependencias**: Comprueba que las herramientas necesarias (tar, screen, tmux, make, curl) estén instaladas. Si alguna falta, intenta instalarla usando `dnf`, `apt-get` o `yum`.

2. **Descarga de Byobu**: Utiliza `curl` para descargar el archivo fuente de Byobu desde **Launchpad**.

3. **Extracción y compilación**: Descomprime los archivos, configura el entorno y compila Byobu.

4. **Instalación de Byobu**: Instala Byobu en el sistema y selecciona `tmux` como backend predeterminado.

## Notas

- El script está configurado para instalar la versión `5.133` de Byobu por defecto. Si deseas instalar una versión diferente, simplemente cambia el valor de la variable `BYOBU_VERSION` al inicio del script.
  
- Si estás utilizando una distribución diferente a **RHEL 9**, es posible que necesites ajustar el gestor de paquetes (`dnf`, `apt-get`, `yum`) o instalar las dependencias manualmente.

