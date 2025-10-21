#!/bin/bash

# Script de instalación de Flutter para macOS
# Ejecutar con: bash install_flutter.sh

echo "🚀 Instalando Flutter..."

# Detectar arquitectura
ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ]; then
    FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.24.3-stable.zip"
else
    FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.24.3-stable.zip"
fi

# Crear directorio de desarrollo
mkdir -p ~/development
cd ~/development

# Descargar Flutter
echo "📥 Descargando Flutter..."
curl -o flutter.zip $FLUTTER_URL

# Extraer
echo "📦 Extrayendo Flutter..."
unzip -q flutter.zip
rm flutter.zip

# Agregar al PATH
echo "⚙️ Configurando PATH..."
FLUTTER_PATH="$HOME/development/flutter/bin"

# Detectar shell
if [ -f ~/.zshrc ]; then
    if ! grep -q "flutter/bin" ~/.zshrc; then
        echo "export PATH=\"\$PATH:$FLUTTER_PATH\"" >> ~/.zshrc
        echo "✅ Agregado a ~/.zshrc"
    fi
fi

if [ -f ~/.bash_profile ]; then
    if ! grep -q "flutter/bin" ~/.bash_profile; then
        echo "export PATH=\"\$PATH:$FLUTTER_PATH\"" >> ~/.bash_profile
        echo "✅ Agregado a ~/.bash_profile"
    fi
fi

echo ""
echo "✨ Flutter instalado!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Reinicia tu terminal o ejecuta: source ~/.zshrc"
echo "2. Ejecuta: flutter doctor"
echo "3. Sigue las instrucciones para instalar dependencias"
echo ""
echo "Para ejecutar el proyecto JUANIA:"
echo "cd /Users/home/Documents/universidad/print2-2025"
echo "flutter pub get"
echo "flutter run -d chrome"
