/*
Apresentado por André Burnier na Noite de Processing em 29/09/2020.
*/

import geomerative.*;
RPoint[][] points;
PVector mouse;
float raio = 200;

void setup() {
  size(800, 800);
  RG.init(this);

  String txt = "O";
  int txtSize = 700;

  RShape grp = RG.getText(txt, "Arial Black.ttf", txtSize, CENTER);
  //RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(4);

  points = grp.getPointsInPaths();

  mouse = new PVector(0,0);
}

void draw() {
  background(255);
  noStroke();
  fill(0);
  translate(width*0.5, height*0.8);
  //mouse.set(mouseX-width*0.5, mouseY-height*0.8);
  mouse.set(mouseX - screenX(0, 0), mouseY - screenY(0, 0));

  beginShape();
  for (int i = 0; i < points.length; i ++) {
    if (i>0) beginContour();
    for (int j = 0; j < points[i].length; j++) {
      //float x = points[i][j].x;
      //float y = points[i][j].y;
      PVector pos = new PVector(points[i][j].x, points[i][j].y);

      PVector posMouse = PVector.sub(pos,mouse);
      float dist = posMouse.mag();
      if (dist < raio){
        float t = map(dist, 0, raio, 100, 0);
        posMouse.setMag(t);
        pos.add(posMouse);
      }
      vertex(pos.x,pos.y);
    }
    if (i>0) endContour();
  }
  endShape(CLOSE);
}
