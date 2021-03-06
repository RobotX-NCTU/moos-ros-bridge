#!/bin/bash

# Launch the ROS nodes
roslaunch moosros_tester examle.launch &
ROSLAUNCH_PID=$!

# Launch the MOOS nodes
pAntler $(rospack find moosros)/moos/example/bridge.moos >& /dev/null &
PANTLER_PID=$!

uMAC $(rospack find moosros)/moos/example/bridge.moos

printf "Killing all processes, safely ... \n"
kill -SIGTERM $ROSLAUNCH_PID
kill -SIGTERM $PANTLER_PID
printf "Done killing processes.   \n"


