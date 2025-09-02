## ROS2 C++ package
Structure
```
my_package/
     CMakeLists.txt      # instructions to build code
     include/my_package/ # public headers of pkg
     package.xml         # meta info
     src/                # source code
```
Creation
```
ros2 pkg create --build-type ament_cmake --license Apache-2.0 --node-name my_node my_package

```