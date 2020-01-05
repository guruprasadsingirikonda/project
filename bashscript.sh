#!/bin/bash

sudo docker build -t ubuntuapache:v2 project/
sudo docker run -itd -p 8090:80 ubuntuapache:v2
sleep 5
curl http://localhost:8090/
