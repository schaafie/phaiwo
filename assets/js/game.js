import world from "./world.js";

export default class game {

    constructor(h, w, prey, pred) {
        this.height = h;
        this.width = w;
        this.world = new world(this.width, this.height, prey, pred);
        console.log("initiated");

        let canvas = document.getElementById("map");
        canvas.addEventListener("click", (ev) => { this.world.setEntityByLocation(ev.pageX, ev.pageY); });
        this.ctx = canvas.getContext("2d");
    }

    draw() {
        let circum = 2 * Math.PI;
        let gra2rad = circum / 360;
        this.ctx.clearRect(0, 0, this.width, this.height);

        let entities = this.world.getAll();
        entities.forEach(el => {
            this.ctx.beginPath();
            this.ctx.arc(el.x, el.y, el.s, 0, circum);
            this.ctx.fillStyle = el.c;
            this.ctx.fill();

            let xs = el.s * Math.sin(el.o * gra2rad);
            let ys = el.s * Math.cos(el.o * gra2rad);
            this.ctx.moveTo(el.x + xs, el.y + ys);
            this.ctx.lineTo(el.x + 1.5 * xs, el.y + 1.5 * ys);
            this.ctx.stroke();
            if (el.t == 2) {
                for (let i = 0; i <= 20; i++) {
                    if (el.prey_vision[i] == 1) {
                        document.getElementById("pn" + i).classList.add("active");
                    } else {
                        document.getElementById("pn" + i).classList.remove("active");
                    }
                    if (el.pred_vision[i] == 1) {
                        document.getElementById("n" + i).classList.add("active");
                    } else {
                        document.getElementById("n" + i).classList.remove("active");
                    }
                }
            }
        });
    }

    left() {
        // this.world.pred[0].turnleft();
        this.draw();
    }

    right() {
        // this.world.pred[0].turnright();
        this.draw();
    }

    move() {
        // this.world.pred[0].move();
        this.draw();
    }

    processKey(code) {
        switch (code) {
            case 'KeyA':
                this.left();
                break;
            case 'KeyD':
                this.right();
                break;
            case 'KeyW':
                this.move();
                break;
        }
    }
}
