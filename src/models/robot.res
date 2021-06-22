type turn = L | R
type command = Turn(turn) | F
type facing = North | East | South | West
type coord = {x: int, y: int}
type robot = {facing: facing, coord: coord}

let create = (facing, coord) => {facing: facing, coord: coord}

let turn = (turnTo, robot) => {
  switch (turnTo, robot) {
  | (L, {facing: East}) => {...robot, facing: North}
  | (L, {facing: North}) => {...robot, facing: West}
  | (L, {facing: West}) => {...robot, facing: South}
  | (L, {facing: South}) => {...robot, facing: East}
  | (R, {facing: East}) => {...robot, facing: South}
  | (R, {facing: North}) => {...robot, facing: East}
  | (R, {facing: West}) => {...robot, facing: North}
  | (R, {facing: South}) => {...robot, facing: West}
  }
}

let forward = robot => {
  let {facing, coord: {x, y}} = robot

  switch facing {
  | North => {facing: facing, coord: {x: x, y: y - 1}}
  | East => {facing: facing, coord: {x: x + 1, y: y}}
  | South => {facing: facing, coord: {x: x, y: y + 1}}
  | West => {facing: facing, coord: {x: x - 1, y: y}}
  }
}

let move = (command, robot) => {
  switch command {
  | Turn(dir) => turn(dir, robot)
  | F => forward(robot)
  }
}

let facingToString = facing =>
  switch facing {
  | North => "North"
  | South => "South"
  | East => "East"
  | West => "West"
  }

let readableRobot = robot =>
  `Facing: ${facingToString(robot.facing)}\nposition: ${Belt.Int.toString(
      robot.coord.x,
    )}, ${Belt.Int.toString(robot.coord.y)}`
