#!/bin/bash
docker build --build-arg TARGET=https://graderv2.devcommu.org/ -t devcommugrader .