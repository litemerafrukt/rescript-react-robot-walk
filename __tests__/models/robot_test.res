open Jest

let pos = (facing, (x, y)): Robot.robot => {
  facing: facing,
  coord: {x: x, y: y},
}

describe("Robot.turn", () => {
  open Expect

  test("turn L, should be North from East", () =>
    expect(Robot.turn(Robot.L, pos(East, (0, 0)))) |> toEqual(pos(North, (0, 0)))
  )
  test("turn L, should be West from North", () =>
    expect(Robot.turn(Robot.L, pos(North, (0, 0)))) |> toEqual(pos(West, (0, 0)))
  )
  test("turn L, should be South from West", () =>
    expect(Robot.turn(Robot.L, pos(West, (0, 0)))) |> toEqual(pos(South, (0, 0)))
  )
  test("turn L, should be East from South", () =>
    expect(Robot.turn(Robot.L, pos(South, (0, 0)))) |> toEqual(pos(East, (0, 0)))
  )

  test("turn R, should be South from East", () =>
    expect(Robot.turn(Robot.R, pos(East, (0, 0)))) |> toEqual(pos(South, (0, 0)))
  )
  test("turn R, should be East from North", () =>
    expect(Robot.turn(Robot.R, pos(North, (0, 0)))) |> toEqual(pos(East, (0, 0)))
  )
  test("turn R, should be North from West", () =>
    expect(Robot.turn(Robot.R, pos(West, (0, 0)))) |> toEqual(pos(North, (0, 0)))
  )
  test("turn R, should be West from South", () =>
    expect(Robot.turn(Robot.R, pos(South, (0, 0)))) |> toEqual(pos(West, (0, 0)))
  )
})

describe("Robot.forward", () => {
  open Expect

  test("Forward from (North (2, 2)) should be 2, 1", () =>
    expect(Robot.forward(pos(North, (2, 2)))) |> toEqual(pos(North, (2, 1)))
  )

  test("Forward from (East (2, 2)) should be 3, 2", () =>
    expect(Robot.forward(pos(East, (2, 2)))) |> toEqual(pos(East, (3, 2)))
  )

  test("Forward from (South (2, 2)) should be 2, 3", () =>
    expect(Robot.forward(pos(South, (2, 2)))) |> toEqual(pos(South, (2, 3)))
  )

  test("Forward from (West (2, 2)) should be 1, 2", () =>
    expect(Robot.forward(pos(West, (2, 2)))) |> toEqual(pos(West, (1, 2)))
  )
})

describe("Robot.move", () => {
  open Expect

  test("Move turn L from (North, (1, 1)) should be (West, (1, 1)", () =>
    expect(Robot.move(Turn(L), pos(North, (1, 1)))) |> toEqual(pos(West, (1, 1)))
  )

  test("Move turn R from (North, (1, 1)) should be (East, (1, 1)", () =>
    expect(Robot.move(Turn(R), pos(North, (1, 1)))) |> toEqual(pos(East, (1, 1)))
  )

  test("Move forward from (North, (1, 1)) should be (North, (1, 0)", () =>
    expect(Robot.move(F, pos(North, (1, 1)))) |> toEqual(pos(North, (1, 0)))
  )
})
