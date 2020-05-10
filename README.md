# Toy Robot Simulator

## Running

To run the robot simulator:

`bin/robot_simulator examples/commands.txt`

## Commands

There are 5 supported commands:

```
PLACE X,Y,F - PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST
MOVE - will move the toy robot one unit forward in the direction it is currently facing
LEFT - will rotate the robot 90 degrees in the specified direction without changing the position of the robot
RIGHT - will rotate the robot 90 degrees in the specified direction without changing the position of the robot
REPORT - will announce the X,Y and F of the robot.
```

## Supported file types

Only .txt files are support as a valid input type but this can easily ben extended by adding a new `Input::FileTypeFile` class and modifying the `FILE_MAPPINGS` constant in `Input::Processor`

## Tests

`bundle exec rspec`
