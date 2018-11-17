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

