# ROS2
```
source /opt/ros/jazzy/setup.bash
source <install_folder>/local_setup.bash
```

```
rqt # gui to replace many command-line
colcon_cd <pkg_name> # cd to pkg folder
```

## Build
```
# resolve dependencies
rosdep install -i --from-path src --rosdistro jazzy -y
# build
colcon build --symlink-install # build (python modifications do not require rebuild)
colcon build --packages-select <pkg_name> # rebuild only specific package
colcon build --event-handlers console_direct+ # show console output to debug
```
To not build a specific package, place an empty file `COLCON_IGNORE` in its directory.

## Introspection
```bash
ros2 run rqt_graph rqt_graph
ros2 run rqt_console rqt_console # to inspect logs

ros2 pkg executables <pkg_name>

ros2 node list
ros2 topic list -t # -t to show topic type
ros2 service list
ros2 action list

ros2 node info <node_name>
ros2 topic info <topic_name> # show type, publishers, subscribers
ros2 interface show <msg_name> # show details of message structure

ros2 topic hz <topic_name>
ros2 topic bw <topic_name> # bandwith (data transfer rate in KB/s and msg size in KB)
ros2 topic echo <topic_name>
```

## Operations
```bash
ros2 launch <pkg_name> <launch_name> # launch files have extension .launch.py
ros2 run <pkg_name> <exec_name>
```

## Parameters
```
ros2 param get <node_name> <param_name>
ros2 param set <node_name> <param_name> <value>
ros2 param dump <node name> # print all param and values to stdout
ros2 param dump /turtlesim > cfg1.yaml # print to file
ros2 param load /turtlesim cfg1.yaml # load parameters
ros2 run <pkg_name> <exec_name> --ros-args --params-file cfg1.yaml # run with param
```

## Bags
```
cd /bag_files # move to where bag should be saved
ros2 bag record -o my_bag_name <topic_name1> <topic_name2>
ros2 bag info <bag_file>
ros2 bag play --clock --loop <bag_file>
```
