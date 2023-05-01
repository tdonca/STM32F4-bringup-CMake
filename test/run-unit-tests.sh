#!/bin/bash

#TODO: make this user friendly to run locally, not used for cloud builds

echo "Build docker image..."
sudo docker build -t unit-tests .
echo "Run unit tests in docker container..."
sudo docker run -v `pwd`/../:/github/workspace unit-tests
echo "Done!"