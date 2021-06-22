# Robot walk

First attempt with [rescript](https://rescript-lang.org/) and [rescript-react](https://rescript-lang.org/docs/react/latest/introduction).

Setup with [parcel](https://parceljs.org/) and [jest](https://jestjs.io/) ([bindings](https://github.com/glennsl/bs-jest/blob/master/src/jest.ml))

## Robot behavior

- The robot will start in the middle of the room.
- After a series of commands it starts from where it is currently.
- If the robot hits a wall it just keeps hitting the wall if it should go forward.
- Commands the robot do not recognize it ignores and reports.
- All command results is presented.

Commands known to the robot:
L: turn left
R: turn right
F: move forward

Have fun :)

## Installation

```sh
npm i
```

## Run, serve and recompile in development:

1. Open two terminals
2. First terminal: `npm run start`
3. Second terminal: `npm run parcel`

## Run tests with recompile and watch:

1. Open two terminals
2. First terminal: `npm run start`
3. Second terminal: `npx jest --watch`

## Build

- Build: `npm run build`
- Clean: `npm run clean`

## Serve

```sh
npx parcel src/index.html
```

## Bundle it up

Nah, not this time.
