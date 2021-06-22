let appElement = ReactDOM.querySelector("#app")

switch appElement {
| Some(anchor) => ReactDOM.render(<App />, anchor)
| None => Js.log("Could not find anchor element.")
}
