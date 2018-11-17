# Docker settings for RoboNetSim

This repository contains files for docker to run [RoboNetSim](http://www.giannidicaro.com/robonetsim.html).
The Dockerfile is based on [EduardoFF's repository](https://github.com/EduardoFF/RoboNetSim) with minor modifications.

Recommended environment:
- Ubuntu 18.04
- Nvidia Graphic card

# How to build

## Option1
```
chmod u+x build.sh
./build.sh robonetsim
```

## Option2
```
docker pull tidota/robonetsim
```

# How to run

## Network simulator
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

## Robot simulator.
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

