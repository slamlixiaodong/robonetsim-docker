#!/bin/bash
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
sudo xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
./run.bash robonetsim
