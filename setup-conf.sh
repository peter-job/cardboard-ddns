#!/bin/bash
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1; fi

CONF_FILE=/etc/cardboard/ddns.conf

echo "Cardboard DDNS Configurator"

read -p "Enter API Key: " API_KEY
read -p "Enter Secret: " SECRET

SOURCE_DIR=$(pwd)
echo "Source Directory: ${SOURCE_DIR}"

read -p "Create ${CONF_FILE} (y/n)? " CONT
if [ "$CONT" = "y" ]; then
  echo "Writing..."
  sudo rm -f ${CONF_FILE}
  sudo echo "API_KEY=${API_KEY}" >> ${CONF_FILE}
  sudo echo "SECRET=${SECRET}" >> ${CONF_FILE}
  sudo echo "SOURCE_DIR=${SOURCE_DIR}" >> ${CONF_FILE}
  echo "Config complete."
else
  echo "Exiting...";
fi

