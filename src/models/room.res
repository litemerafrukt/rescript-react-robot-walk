type room = {width: int, height: int}

let create = (width, height) => {width: width, height: height}

let keepInsideRoom = (room, robot: Robot.robot) => {
  let {x, y} = robot.coord

  let x = Utils.clampInt(x, room.width, 1)
  let y = Utils.clampInt(y, room.height, 1)

  Robot.create(robot.facing, {x: x, y: y})
}
