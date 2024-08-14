#!/bin/bash


export VAULT_ADDR=${VAULT_ADDR}
vault login token=${VAULT_DEV_ROOT_TOKEN_ID}

export RABBITMQ_DEFAULT_USER=$(vault kv get -field=RABBITMQ_DEFAULT_USER secret/emacommerce)
export RABBITMQ_DEFAULT_PASS=$(vault kv get -field=RABBITMQ_DEFAULT_PASS secret/emacommerce)
export MYSQL_ROOT_PASSWORD=$(vault kv get -field=MYSQL_ROOT_PASSWORD secret/emacommerce)
export MYSQL_DATABASE=$(vault kv get -field=MYSQL_DATABASE secret/emacommerce)
export MYSQL_USER=$(vault kv get -field=MYSQL_USER secret/emacommerce)
export MYSQL_PASSWORD=$(vault kv get -field=MYSQL_PASSWORD secret/emacommerce)
export PORT=$(vault kv get -field=PORT secret/emacommerce)
export NATS_SERVER_URL=$(vault kv get -field=NATS_SERVER_URL secret/emacommerce)
export RMQ_SERVER_URL=$(vault kv get -field=RMQ_SERVER_URL secret/emacommerce)
export RMQ_QUEUE=$(vault kv get -field=RMQ_QUEUE secret/emacommerce)
export MQTT_URL=$(vault kv get -field=MQTT_URL secret/emacommerce)
export KAFKA_URL=$(vault kv get -field=KAFKA_URL secret/emacommerce)
export KAFKA_CLIENTID=$(vault kv get -field=KAFKA_CLIENTID secret/emacommerce)
export KAFKA_CONSUMER=$(vault kv get -field=KAFKA_CONSUMER secret/emacommerce)
export DB_URL=$(vault kv get -field=DB_URL secret/emacommerce)
export AWS_REGION=$(vault kv get -field=AWS_REGION secret/emacommerce)
export ACCES_KEY_ID=$(vault kv get -field=ACCES_KEY_ID secret/emacommerce)
export SECRET_ACCESS_KEY=$(vault kv get -field=SECRET_ACCESS_KEY secret/emacommerce)
export JWT_SECRET=$(vault kv get -field=JWT_SECRET secret/emacommerce)
export MYSQL_PORT=$(vault kv get -field=MYSQL_PORT secret/emacommerce)
export MYSQL_HOST=$(vault kv get -field=MYSQL_HOST secret/emacommerce)
export HOST_MARIADB=$(vault kv get -field=HOST_MARIADB secret/emacommerce)
export PORT_MARIADB=$(vault kv get -field=PORT_MARIADB secret/emacommerce)
export DATABASE_MARIADB=$(vault kv get -field=DATABASE_MARIADB secret/emacommerce)
export USERNAME_MARIADB=$(vault kv get -field=USERNAME_MARIADB secret/emacommerce)
export PASSWORD_MARIADB=$(vault kv get -field=PASSWORD_MARIADB secret/emacommerce)
export DATABASE_URL=$(vault kv get -field=DATABASE_URL secret/emacommerce)
export PROM_PASS=$(vault kv get -field=PROM_PASS secret/emacommerce)
export PROM_USER=$(vault kv get -field=PROM_USER secret/emacommerce)

env | grep -E 'RABBITMQ_DEFAULT_USER|RABBITMQ_DEFAULT_PASS|MYSQL_ROOT_PASSWORD|MYSQL_DATABASE|MYSQL_USER|MYSQL_PASSWORD|PORT|NATS_SERVER_URL|RMQ_SERVER_URL|RMQ_QUEUE|MQTT_URL|KAFKA_URL|KAFKA_CLIENTID|KAFKA_CONSUMER|DB_URL|AWS_REGION|ACCES_KEY_ID|SECRET_ACCESS_KEY|JWT_SECRET|MYSQL_PORT|MYSQL_HOST|HOST_MARIADB|PORT_MARIADB|DATABASE_MARIADB|USERNAME_MARIADB|PASSWORD_MARIADB|DATABASE_URL|PROM_PASS|PROM_USER' > /secrets.env

sleep 2