// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.bs.js");
var Robot = require("../../src/models/robot.bs.js");

function pos(facing, param) {
  return {
          facing: facing,
          coord: {
            x: param[0],
            y: param[1]
          }
        };
}

Jest.describe("Robot.turn", (function (param) {
        Jest.test("turn L, should be North from East", (function (param) {
                return Jest.Expect.toEqual(pos(/* North */0, [
                                0,
                                0
                              ]), Jest.Expect.expect(Robot.turn(/* L */0, pos(/* East */1, [
                                        0,
                                        0
                                      ]))));
              }));
        Jest.test("turn L, should be West from North", (function (param) {
                return Jest.Expect.toEqual(pos(/* West */3, [
                                0,
                                0
                              ]), Jest.Expect.expect(Robot.turn(/* L */0, pos(/* North */0, [
                                        0,
                                        0
                                      ]))));
              }));
        Jest.test("turn L, should be South from West", (function (param) {
                return Jest.Expect.toEqual(pos(/* South */2, [
                                0,
                                0
                              ]), Jest.Expect.expect(Robot.turn(/* L */0, pos(/* West */3, [
                                        0,
                                        0
                                      ]))));
              }));
        Jest.test("turn L, should be East from South", (function (param) {
                return Jest.Expect.toEqual(pos(/* East */1, [
                                0,
                                0
                              ]), Jest.Expect.expect(Robot.turn(/* L */0, pos(/* South */2, [
                                        0,
                                        0
                                      ]))));
              }));
        Jest.test("turn R, should be South from East", (function (param) {
                return Jest.Expect.toEqual(pos(/* South */2, [
                                0,
                                0
                              ]), Jest.Expect.expect(Robot.turn(/* R */1, pos(/* East */1, [
                                        0,
                                        0
                                      ]))));
              }));
        Jest.test("turn R, should be East from North", (function (param) {
                return Jest.Expect.toEqual(pos(/* East */1, [
                                0,
                                0
                              ]), Jest.Expect.expect(Robot.turn(/* R */1, pos(/* North */0, [
                                        0,
                                        0
                                      ]))));
              }));
        Jest.test("turn R, should be North from West", (function (param) {
                return Jest.Expect.toEqual(pos(/* North */0, [
                                0,
                                0
                              ]), Jest.Expect.expect(Robot.turn(/* R */1, pos(/* West */3, [
                                        0,
                                        0
                                      ]))));
              }));
        return Jest.test("turn R, should be West from South", (function (param) {
                      return Jest.Expect.toEqual(pos(/* West */3, [
                                      0,
                                      0
                                    ]), Jest.Expect.expect(Robot.turn(/* R */1, pos(/* South */2, [
                                              0,
                                              0
                                            ]))));
                    }));
      }));

Jest.describe("Robot.forward", (function (param) {
        Jest.test("Forward from (North (2, 2)) should be 2, 1", (function (param) {
                return Jest.Expect.toEqual(pos(/* North */0, [
                                2,
                                1
                              ]), Jest.Expect.expect(Robot.forward(pos(/* North */0, [
                                        2,
                                        2
                                      ]))));
              }));
        Jest.test("Forward from (East (2, 2)) should be 3, 2", (function (param) {
                return Jest.Expect.toEqual(pos(/* East */1, [
                                3,
                                2
                              ]), Jest.Expect.expect(Robot.forward(pos(/* East */1, [
                                        2,
                                        2
                                      ]))));
              }));
        Jest.test("Forward from (South (2, 2)) should be 2, 3", (function (param) {
                return Jest.Expect.toEqual(pos(/* South */2, [
                                2,
                                3
                              ]), Jest.Expect.expect(Robot.forward(pos(/* South */2, [
                                        2,
                                        2
                                      ]))));
              }));
        return Jest.test("Forward from (West (2, 2)) should be 1, 2", (function (param) {
                      return Jest.Expect.toEqual(pos(/* West */3, [
                                      1,
                                      2
                                    ]), Jest.Expect.expect(Robot.forward(pos(/* West */3, [
                                              2,
                                              2
                                            ]))));
                    }));
      }));

Jest.describe("Robot.move", (function (param) {
        Jest.test("Move turn L from (North, (1, 1)) should be (West, (1, 1)", (function (param) {
                return Jest.Expect.toEqual(pos(/* West */3, [
                                1,
                                1
                              ]), Jest.Expect.expect(Robot.move(/* Turn */{
                                    _0: /* L */0
                                  }, pos(/* North */0, [
                                        1,
                                        1
                                      ]))));
              }));
        Jest.test("Move turn R from (North, (1, 1)) should be (East, (1, 1)", (function (param) {
                return Jest.Expect.toEqual(pos(/* East */1, [
                                1,
                                1
                              ]), Jest.Expect.expect(Robot.move(/* Turn */{
                                    _0: /* R */1
                                  }, pos(/* North */0, [
                                        1,
                                        1
                                      ]))));
              }));
        return Jest.test("Move forward from (North, (1, 1)) should be (North, (1, 0)", (function (param) {
                      return Jest.Expect.toEqual(pos(/* North */0, [
                                      1,
                                      0
                                    ]), Jest.Expect.expect(Robot.move(/* F */0, pos(/* North */0, [
                                              1,
                                              1
                                            ]))));
                    }));
      }));

exports.pos = pos;
/*  Not a pure module */