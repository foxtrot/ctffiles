#!/bin/bash

PENTOO_PORT="2201"
KALI_PORT="2202"
PARROT_PORT="2203"
BLACKARCH_PORT="2204"
HOST=""

scp -r container_files root@$HOST:~/Files -p $PENTOO_PORT
scp -r container_files root@$HOST:~/Files -p $KALI_PORT
scp -r container_files root@$HOST:~/Files -p $PARROT_PORT
scp -r container_files root@$HOST:~/Files -p $BLACKARCH_PORT


