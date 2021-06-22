type action = RoomChangeWidth(string) | RoomChangeHeight(string) | CommandInput(string) | DoCommands
type state = {
  room: Room.room,
  robot: Robot.robot,
  commandString: string,
  commandResult: array<string>,
}

let createRobotInRoom = (room: Room.room) =>
  Robot.create(East, {x: room.width / 2, y: room.height / 2})

let initialRoom = Room.create(5, 5)
let initialRobot = createRobotInRoom(initialRoom)

let reducer = (state, action) =>
  switch action {
  | RoomChangeWidth(val) => {
      let newRoom =
        Belt.Int.fromString(val)
        ->Belt.Option.getWithDefault(state.room.width)
        ->Utils.clampInt(10, 2)
        ->Room.create(state.room.height)
      let newRobot = createRobotInRoom(newRoom)
      {...state, room: newRoom, robot: newRobot}
    }
  | RoomChangeHeight(val) => {
      let newRoom =
        Belt.Int.fromString(val)
        ->Belt.Option.getWithDefault(state.room.height)
        ->Utils.clampInt(10, 2) |> Room.create(state.room.width)
      let newRobot = createRobotInRoom(newRoom)
      {...state, room: newRoom, robot: newRobot}
    }
  | CommandInput(val) => {...state, commandString: Js.String2.toUpperCase(val)}
  | DoCommands => {
      let currentReadbleRobot = Robot.readableRobot(state.robot)
      let commandResult = ExecuteCommandString.run(state.room, state.robot, state.commandString)
      let newRobot =
        Belt.Array.reverse(commandResult)
        ->Belt.Array.getBy(Belt.Result.isOk)
        ->Belt.Option.getWithDefault(Belt.Result.Error(state.robot))
        ->Belt.Result.getWithDefault(state.robot)
      let readableResult = commandResult->Belt.Array.map(result =>
        switch result {
        | Belt.Result.Ok(robot) => Robot.readableRobot(robot)
        | Belt.Result.Error(_) => "Error command"
        }
      )
      {
        ...state,
        robot: newRobot,
        commandResult: Belt.Array.concat([currentReadbleRobot], readableResult),
      }
    }
  }

@react.component
let make = () => {
  let ({room, robot, commandString, commandResult}, dispatch) = React.useReducer(
    reducer,
    {room: initialRoom, robot: initialRobot, commandString: "", commandResult: []},
  )

  <main>
    <div className="nes-container is-rounded">
      <div className="wrapping-inputs">
        <div className="nes-container with-title space-between">
          <p className="title"> {React.string("Commands")} </p>
          <div className="nes-field space-between">
            <label htmlFor="commands_field"> {React.string("Commands")} </label>
            <input
              type_="text"
              id="commands_field"
              className="nes-input"
              defaultValue={commandString}
              onInput={evt => dispatch(CommandInput(ReactEvent.Form.target(evt)["value"]))}
            />
          </div>
          <div>
            <button
              type_="button" className="nes-btn is-primary" onClick={_ => dispatch(DoCommands)}>
              {React.string("Run")}
            </button>
            <ol>
              {Belt.Array.mapWithIndex(commandResult, (i, result) => {
                <li key={Belt.Int.toString(i)}> <pre> {React.string(result)} </pre> </li>
              })->React.array}
            </ol>
          </div>
        </div>
      </div>
      <div className="nes-container with-title space-between">
        <p className="title"> {React.string("Robot")} </p>
        <div className="robot-input">
          <p> {React.string(`Facing: ${Robot.facingToString(robot.facing)}`)} </p>
          <p>
            {React.string(
              `Position: ${Belt.Int.toString(robot.coord.x)}, ${Belt.Int.toString(robot.coord.y)}`,
            )}
          </p>
        </div>
      </div>
      <div className="nes-container with-title">
        <p className="title"> {React.string("Room size")} </p>
        <div className="room-input">
          <div className="nes-field room-input-field">
            <input
              value={Belt.Int.toString(room.width)}
              onChange={evt => dispatch(RoomChangeWidth(ReactEvent.Form.target(evt)["value"]))}
              type_="number"
              className="nes-input"
            />
          </div>
          <span> {React.string(" x ")} </span>
          <div className="nes-field room-input-field">
            <input
              onChange={evt => dispatch(RoomChangeHeight(ReactEvent.Form.target(evt)["value"]))}
              value={Belt.Int.toString(room.height)}
              type_="number"
              className="nes-input"
            />
          </div>
        </div>
      </div>
    </div>
  </main>
}
