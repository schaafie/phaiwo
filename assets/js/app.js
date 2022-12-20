import "../css/app.css"
import game from "./game.js";

function run() {
    let height = 600;
    let width = 800;
    document.getElementById("map").setAttribute("height", height + "px");
    document.getElementById("map").setAttribute("width", width + "px");
    let g = new game(height, width);
    document.getElementById("btn_left").addEventListener('click', ev => { g.left(); });
    document.getElementById("btn_right").addEventListener('click', ev => { g.right(); });
    document.getElementById("btn_move").addEventListener('click', ev => { g.move(); });
    document.addEventListener('keydown', ev => { g.processKey(ev.code); });
}

document.onload( run() );