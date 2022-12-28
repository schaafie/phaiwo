export default class world {

    constructor(w,h,prey, pred) {
        this.width = w;
        this.height= h;
        this.entities = [];
        this.entity = {};
        fetch( "http://localhost:4000/api/", {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({w: w, h: h, prey: prey, pred: pred }) })
        .then((response) => response.json())
        .then( (data) => { this.entities = data; });
    }

    refresh() {
        fetch( "http://localhost:4000/api/", {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }})
        .then((response) => response.json())
        .then( (data) => { this.entities = data; });

        fetch( "http://localhost:4000/api/entity", {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }})
        .then((response) => response.json())
        .then( (data) => { this.entity = data; });
    }

    setEntityByLocation(x,y){
        fetch( `http://localhost:4000/api/entity/by_location/${x}/${y}`, {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }})
        .then((response) => response.json())
        .then((data) => { this.entity = data; });
    }

    setEntityByName(name){
        fetch( `http://localhost:4000/api/entity/by_name/${name}`, {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }})
        .then((response) => response.json())
        .then( (data) => { this.entity = data; });        
    }


    getAll() { return this.entities; }
    getEntity() { return this.entity; }


}