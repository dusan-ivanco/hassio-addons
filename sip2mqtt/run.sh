#!/bin/bash

CONFIG_PATH="/data/options.json"

MQTT_HOST="$(jq --raw-output ".mqtthost" $CONFIG_PATH)"
MQTT_PORT="$(jq --raw-output ".mqttport" $CONFIG_PATH)"
MQTT_USER="$(jq --raw-output ".mqttuser" $CONFIG_PATH)"
MQTT_PASS="$(jq --raw-output ".mqttpass" $CONFIG_PATH)"
MQTT_TOPIC="$(jq --raw-output ".mqtttopic" $CONFIG_PATH)"
SIP_DOMAIN="$(jq --raw-output ".sipdomain" $CONFIG_PATH)"
SIP_USER="$(jq --raw-output ".sipuser" $CONFIG_PATH)"
SIP_PASS="$(jq --raw-output ".sippass" $CONFIG_PATH)"

echo "Starting sip2mqtt..."
CMD="sip2mqtt.py -a ${MQTT_HOST} -t ${MQTT_PORT} -u ${MQTT_USER} -p ${MQTT_PASS} -d ${SIP_DOMAIN} -n ${SIP_USER} -s ${SIP_PASS} --mqtt_topic ${MQTT_TOPIC}"
python $CMD
