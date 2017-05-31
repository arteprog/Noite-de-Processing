// (Poor and Tacky) Object Oriented Implementation of Graphs

var Graph = function (){
    this.nodes = [];
    this.edges = [];
}

Graph.prototype.createMap = function(lin, col){
    for (i = 0; i < lin; i++){
        for (j = 0; j < col; j++){
            this.nodes.push("0");
        }
    }
}

// SETUP

function setup() {
  createCanvas  (500, 500);
  createSquares(2);
}

// DRAW

function draw() {
    var G = new Graph();
    G.createMap(10,10);
    fill (0);    
}

// function createSquares()
// --------------------------------------------------
// Fills map with squares, after "squarelizing" it 

function createSquares(algorithm){
  var sizeSq = 20;
  var nSqLin = width/sizeSq;
  var nSqCol = height/sizeSq;
  var pct = {};
 
  // ALGORITHM 1  
  // choose randomly how to fill other tiles. 
  // one can change the probability of a square to be of certain
  // type by changing the percentage below
  
  if (algorithm == 1){
    pct['water'] = 10;
    pct['plain'] = 60;
    pct['mountain'] = 30;
    
    for (i = 1; i < nSqLin - 1; i++){
      for (j = 1; j < nSqCol - 1; j++){
        noStroke();
        var chance = Math.floor((Math.random() * 100) + 1);
        if (chance <= pct['water']) fill(chooseTile('water'));
        else if (chance <= pct['plain'] + pct['water'] ) fill(chooseTile('plain'));
        else fill(chooseTile('mountain'));
        rect (i * sizeSq, j * sizeSq, sizeSq, sizeSq);
       }
    }
  }
  // ALGORITHM 2
  // If 2-neighborhood has a water tile, it has a 50% chance of being a water.  
  //
  if (algorithm == 2){
    for (i = 1; i < nSqLin - 1; i++){
      var lastWater = 0;
      for (j = 1; j < nSqCol - 1; j++){               
        var chance = Math.floor((Math.random() * 100) + 1);
        if (lastWater == 0){
          pct['water'] = 33;
          pct['plain'] = 33;
          pct['mountain'] = 34;
          if (chance <= pct['water']) { fill(chooseTile('water')); lastWater = 1}
          else if (chance <= pct['plain'] + pct['water'] ) { fill(chooseTile('plain')); lastWater = 0;}
          else { fill(chooseTile('mountain')); lastWater = 0;}
        }
        else{
          pct['water'] = 60;
          pct['plain'] = 20;
          pct['mountain'] = 20;
          if (chance <= pct['water']) { fill(chooseTile('water')); lastWater = 1}
          else if (chance <= pct['plain'] + pct['water'] ) { fill(chooseTile('plain')); lastWater = 0;}
          else { fill(chooseTile('mountain')); lastWater = 0;}
        }
        
        rect (i * sizeSq, j * sizeSq, sizeSq, sizeSq);
       
      }
    }
  }
}

function chooseTile(type){
  var terrain = {};
  terrain['water'] = color(80, 173, 229);
  terrain['plain'] = color(27, 130, 46);
  terrain['mountain'] = color(102, 51, 0);
  
  return terrain[type];
}
