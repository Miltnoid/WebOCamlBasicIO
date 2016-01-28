open Core.Std

let transformation (input:string) : string =
  input

let onload _ =
  let doc = Dom_html.document in
  let div1 = Dom_html.createDiv doc in
  let div2 = Dom_html.createDiv doc in
  let button = Dom_html.createButton ~_type:(Js.string "button") doc in
  let inputtext = Dom_html.createTextarea doc in
  let outputtext = Dom_html.createTextarea doc in
  outputtext##value <- Js.string "Output text";
  outputtext##readOnly <- Js._true;
  inputtext##value <- Js.string "Input text";
  button##textContent <- Js.some (Js.string "Change Content");
  let _ =
    Lwt_js_events.clicks button
      (fun _ev _ ->
        begin
          outputtext##value <- Js.string
            (transformation (Js.to_string inputtext##value));
          Lwt.return()
        end) in
     Dom.appendChild doc##body inputtext;
     Dom.appendChild doc##body div1;
     Dom.appendChild doc##body outputtext;
     Dom.appendChild doc##body div2;
     Dom.appendChild doc##body button;
     Js._false

let () =
  Dom_html.window##onload <- Dom_html.handler onload

