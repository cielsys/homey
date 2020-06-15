#!/usr/bin/env bash

echo "Does not currently work!!!"
exit -1

# Needs to be called with 'source' which shows as $0 == 'bash' or '-bash'
if [ ! $0 == 'bash' ] && [ ! $0 == '-bash' ];
  then
    echo "Need to call with 'source $0'"
    exit -1
fi

while true
do

# Allow for ROS source choice
read -p "Do you want to source ROS in this workspace (y/n): " input_choice
#input_choice="n"

if [ "$input_choice" = "y" ]
then
  echo "Sourcing ROS..."
  # Source ROS
  #source /opt/ros/kinetic/setup.bash
  #source /opt/ros/dashing/setup.bash
  source /opt/ros/eloquent/setup.bash
  #export ROS_IP=`echo $(hostname -I)` 
  export ROS_IP=192.168.1.19
  
  # RoboND Proj2
  #export CATKIN_WS=$HOME/AAAProjects/AAAUdacity/roboND/Proj2_RosPickPlace/catkin_ws 
  #export GAZEBO_MODEL_PATH=$CATKIN_WS/src/RoboND-Kinematics-Project/kuka_arm/models

  # RoboND Proj3 Exer1,2
  #export CATKIN_WS=$HOME/AAAProjects/AAAUdacity/roboND/Proj3_3dPerception/RoboND-Perception-Exercises/catkin_ws
  #export GAZEBO_MODEL_PATH=$CATKIN_WS/src/sensor_stick/models

  # RoboND Proj3 Exer3
  #export CATKIN_WS=$HOME/AAAProjects/AAAUdacity/roboND/Proj3_3dPerception/RoboND-Perception-Exercises/catkin_ws3
  #export GAZEBO_MODEL_PATH=~$CATKIN_WS/src/sensor_stick/models

  # RoboND Proj3 
  #export CATKIN_WS=$HOME/AAAProjects/AAAUdacity/roboND/Proj3_3dPerception/Proj3_Root/catkin_ws
  #export GAZEBO_MODEL_PATH=$CATKIN_WS/src/RoboND-Perception-Project/pr2_robot/models

  # RoboND2 Proj2
  #export CATKIN_WS=$HOME/AAAProjects/AAAUdacity/roboND2/Proj2_Localization/Proj2_Root/catkin_ws
  #export GAZEBO_MODEL_PATH=$CATKIN_WS/src/RoboND-Perception-Project/pr2_robot/models

  # RoboND Proj3 
  #export CATKIN_WS=$HOME/AAAProjects/AAAUdacity/roboND/Proj3_3dPerception/Proj3_Root/catkin_ws
  #export GAZEBO_MODEL_PATH=$CATKIN_WS/src/RoboND-Perception-Project/pr2_robot/models

  # Scarecrow
  #export CATKIN_WS=$HOME/AAAProjects/ScareCrow/scarecrow_ws
  #export GAZEBO_MODEL_PATH=$CATKIN_WS/src/

  #source $CATKIN_WS/devel/setup.bash
  #echo "ROS sourced." 
  #echo "        CATKIN_WS = $CATKIN_WS"
  #echo "GAZEBO_MODEL_PATH = $GAZEBO_MODEL_PATH"

  # Scarecrow2
  export COLCON_WS=$HOME/AAAProjects/ScareCrow2/scarecrow_ws
  export GAZEBO_MODEL_PATH=$COLCON_WS/src/

  source $COLCON_WS/install/setup.bash
  echo "ROS2 sourced." 
  echo "        CATKIN_WS = $CATKIN_WS"
  echo "GAZEBO_MODEL_PATH = $GAZEBO_MODEL_PATH"

  break
elif [ "$input_choice" = "n" ]
then
  echo "ROS *NOT* sourced"
  # Setup conda
# export PATH="/home/cl/apps/anaconda3/bin:$PATH"  # commented out by conda initialize
  break
else
  echo "Warning: Not an acceptable option. Choose (y/n). "
fi

done

