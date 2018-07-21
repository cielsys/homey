#!/usr/bin/env bash

# NOTE: Not really shell script!
# Needs to be sourced
# I use
# alias mmm='source ~/bin/ros_make.bash'

# Change to project root. Relies on cdp alias
cdp
catkin_make

# TODO: check retval of make
source devel/setup.bash

# Could popdir?
