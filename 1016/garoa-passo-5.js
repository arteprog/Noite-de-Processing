var world;
var boxes = [];
var boundaries = [];

function setup() {
  // canvas size
  createCanvas(800,600);
  // world and gravity
  world = createWorld();

  boundaries.push( new Boundary(width/4, height-10, 100, 10) );
  boundaries.push( new Boundary(3*width/4, height-50, 100, 10) );

  // frameRate(30);

}

function draw() {
  background(63);

  // fracao de tempo que devemos avancar na simulacao
  var step = 1.0/60;
  // step, velocity and position iterations
  world.Step(step, 10, 10);

  if (isMousePressed) {
    var b = new Box(mouseX, mouseY);
    boxes.push(b);
  }

  for (var i = 0; i < boundaries.length; i++) {
    boundaries[i].display();
  }

  for (var i = 0; i < boxes.length; i++) {
    boxes[i].display();
  }
}

function Box(x, y) {
  this.w = 16;
  this.h = 16;
  this.c = random(255);

  var bd = new box2d.b2BodyDef();
  bd.type = box2d.b2BodyType.b2_dynamicBody;
  bd.position = scaleToWorld(x,y);

  // criar a moldura do corpo e juntar com uma fixture
  var fd = new box2d.b2FixtureDef();
  fd.shape = new box2d.b2PolygonShape();
  fd.shape.SetAsBox(scaleToWorld(this.w/2), scaleToWorld(this.h/2));

  fd.density = 1.0;
  fd.friction = 0.5;
  fd.restitution = 0.2;

  // cria o corpo no mundo
  this.body = world.CreateBody(bd);
  // junta com o shape box
  this.body.CreateFixture(fd);

  // desenha o resultado
  this.display = function() {

    // position
    var pos = scaleToPixels(this.body.GetPosition());
    // rotation
    var a = this.body.GetAngleRadians();

    rectMode(CENTER);
    push();
    translate(pos.x, pos.y);
    rotate(a);
    fill(this.c);
    stroke(200);
    strokeWeight(2);
    rect(0, 0, this.w, this.h);
    pop();
  }
}

function Boundary(x_,y_,w_,h_) {
  // seta as propriedades do limite
  this.x = x_;
  this.y = y_;
  this.w = w_;
  this.h = h_;

  // cria um corpo
  var bd = new box2d.b2BodyDef();
  bd.type = box2d.b2BodyType.b2_staticBody;
  bd.position.x = scaleToWorld(this.x);
  bd.position.y = scaleToWorld(this.y);

  // cria uma  fixture
  var fd = new box2d.b2FixtureDef();
  fd.density = 1.0;
  fd.friction = 0.5;
  fd.restitution = 0.2;
  fd.shape = new box2d.b2PolygonShape();
  fd.shape.SetAsBox(this.w/(scaleFactor*2), this.h/(scaleFactor*2));

  this.body = world.CreateBody(bd).CreateFixture(fd);

  this.display = function() {
    fill(127);
    stroke(0);
    rectMode(CENTER);
    rect(this.x,this.y,this.w,this.h);
  }

}
