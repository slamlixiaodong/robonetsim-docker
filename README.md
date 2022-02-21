# Docker settings for RoboNetSim

[RoboNetSim](http://www.giannidicaro.com/robonetsim.html) is a framework to integrate robot and network simulators.
This repository contains files for docker to compile and run the integrated simulators in the preferred environment of Ubuntu 14.04.
The Dockerfile is based on [EduardoFF's repository](https://github.com/EduardoFF/RoboNetSim) with minor modifications.

Note: Your PC needs to have a Nvidia graphic card.

# How to build the environment

## Option1: building an image from the Dockerfile
```
chmod u+x build.sh
./build.sh robonetsim
```

## Option2: pulling the prepared image from Docker hub
```
docker pull tidota/robonetsim
```
## install nvidia-container-runtime
```
curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | \
  sudo apt-key add -
```
```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
```
```
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
```
```
sudo apt-get update 
sudo apt-get install nvidia-container-runtime 
systemctl restart docker
```



## set env
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
sudo xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -



# How to run the simulator

You need to run the network simulator first, and then run the robot simulator.

## NS-3 network simulator
Run the docker container.
```
chmod u+x start.sh
./start.sh
```
Now the terminal shows the environment in the container.

Then, run the NS-3 network simulator.
```
cd /RoboNetSim/ns-3-dev-git
./start.sh
```

## ARGoS simulator
Open another terminal and access the docker container.
You can check the container's name by the command `docker container list`.
```
docker exec -it <container's name> bash
```

Then, run the ARGoS2 robot simulator.
```
cd /RoboNetSim/argos2-RoboNetSim/example
./start.sh
```

