BYOBU_VERSION=5.133  # Puedes modificar esto para cambiar la versión

# Salir inmediatamente si hay un error
set -e

echo "Por favor, asegúrate de tener las siguientes dependencias instaladas:"
echo "  [+] tar"
#echo "  [+] screen"
echo "  [+] tmux"
echo "  [+] make"
echo "  [+] curl"

# Función para instalar una dependencia si no está instalada
install_if_not_found() {
    if ! which $1 >/dev/null; then
        echo "No se encontró $1, instalando..."
        sudo dnf install -y $1 || sudo apt-get install -y $1 || sudo yum install -y $1
    else
        echo "$1 ya está instalado."
    fi
}

# Verificar e instalar las dependencias necesarias
install_if_not_found tar
#install_if_not_found screen
install_if_not_found tmux
install_if_not_found make
install_if_not_found curl

echo "Vamos a descargar la versión ${BYOBU_VERSION} de byobu e instalarla..."

# Configurar carpeta temporal única
echo "Configurando carpeta temporal..."
UNIQUE_FOLDER=$(date +%s)
cd /tmp
mkdir /tmp/${UNIQUE_FOLDER}
cd /tmp/${UNIQUE_FOLDER}

# Descargar el paquete fuente utilizando curl
echo "Descargando paquete fuente con curl..."
curl -L -o "byobu_${BYOBU_VERSION}.orig.tar.gz" "https://launchpad.net/byobu/trunk/${BYOBU_VERSION}/+download/byobu_${BYOBU_VERSION}.orig.tar.gz"

# Extraer los archivos fuente
echo "Extrayendo archivos fuente..."
tar -xvf "byobu_${BYOBU_VERSION}.orig.tar.gz"
BYOBU_FOLDER_NAME=$(ls | grep byobu | grep -v .tar.gz)
cd "byobu-${BYOBU_VERSION}"

# Configurar y compilar
echo "Configurando y compilando..."
./configure
sudo make install

# Seleccionar tmux como backend predeterminado de Byobu
byobu-select-backend tmux

echo "Byobu versión ${BYOBU_VERSION} ha sido instalada correctamente con tmux como backend predeterminado."

