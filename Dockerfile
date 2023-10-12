FROM ros:noetic

WORKDIR /home/catkin_ws/src
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash;catkin_init_workspace"
WORKDIR /home/catkin_ws
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash; catkin_make"
RUN /bin/bash -c "source devel/setup.bash"

WORKDIR /home/catkin_ws/src
COPY . .

RUN sudo apt-get update
RUN sudo apt-get install -y nano
RUN sudo apt-get install -y ros-noetic-can-msgs
RUN sudo apt-get install -y ros-noetic-socketcan-bridge

