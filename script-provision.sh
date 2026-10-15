#!/bin/bash

echo "Actualización de paquetes e instalación de dependencias"
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo "Agregando la clave GPG oficial de Docker..."
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Configuración del repositorio estable de Docker"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Instalación de Docker Engine"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Asignación de permisos al usuario vagrant"
sudo usermod -aG docker vagrant