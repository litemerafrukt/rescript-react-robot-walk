let parseCommand = command =>
  switch command {
  | "L" => Belt.Result.Ok(Robot.Turn(L))
  | "R" => Belt.Result.Ok(Robot.Turn(R))
  | "F" => Belt.Result.Ok(Robot.F)
  | c => Belt.Result.Error(c)
  }

let parseCommandString = commandString => {
  Js.String2.split(commandString, "")->Belt.Array.map(parseCommand)
}

let doCommand = (parsedCommand, room, robot) =>
  switch parsedCommand {
  | Belt.Result.Ok(command) => Belt.Result.Ok(Room.keepInsideRoom(room, Robot.move(command, robot)))
  | Belt.Result.Error(_) => Belt.Result.Error(robot)
  }

// Ska in clamping av movement nånstans också
let rec doCommands = (parsedCommands, room, robot, commandResults) => {
  switch parsedCommands {
  | [] => commandResults
  | [command] => commandResults->Belt.Array.concat([doCommand(command, room, robot)])
  | commands => {
      let command = commands[0]
      let rest = commands->Belt.Array.sliceToEnd(1)
      let commandResult = doCommand(command, room, robot)

      switch commandResult {
      | Belt.Result.Ok(okRobot) =>
        doCommands(rest, room, okRobot, commandResults->Belt.Array.concat([commandResult]))
      | Belt.Result.Error(_) =>
        doCommands(rest, room, robot, commandResults->Belt.Array.concat([commandResult]))
      }
    }
  }
}

let run = (room, robot, commandString) =>
  commandString->parseCommandString->doCommands(room, robot, [])
