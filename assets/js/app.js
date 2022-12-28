import "../css/app.css"
import game from "./game.js";

function run() {
    // Game parameters
    let height      = 800;
    let width       = 1000;
    let predcount   = 1;
    let preycount   = 5;

    document.getElementById("map").setAttribute("height", height + "px");
    document.getElementById("map").setAttribute("width", width + "px");
    let g = new game(height, width, preycount, predcount);
    document.getElementById("btn_left").addEventListener('click', ev => { g.left(); });
    document.getElementById("btn_right").addEventListener('click', ev => { g.right(); });
    document.getElementById("btn_move").addEventListener('click', ev => { g.move(); });
    document.addEventListener('keydown', ev => { g.processKey(ev.code); });
}

document.addEventListener( "onload", run());