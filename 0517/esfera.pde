/*-----------------------------------
Library: ComputationalGeometry
By: Mark Collins & Toru Hasegawa
Example: IsoWrap

Creates a simple boundary hull
around a group of points, effectively
shrink wrapping the point cloud
------------------------------------*/

import ComputationalGeometry.*;

IsoWrap wrap;

ArrayList<PVector> pontos;

void setup() {
  
  size(250, 250, P3D);
  
  wrap = new IsoWrap(this);
  pontos = new ArrayList();
  // Add points
  for (int i=0; i<5000; i++){
    // eq circ x*x + y*y = 1
    float r = 100;
    float k = (random(10) < 5)? -1 : 1;
    float x = random(-r, r);
    float outracoisa = sqrt(abs(r*r - x*x));
    float y = random( -outracoisa, outracoisa);
    float h = sqrt( x*x + y*y );
    float H = sqrt(r*r - h*h);
    float z = random( -H, H );
    
    PVector ponto = new PVector(x, y, z);
    wrap.addPt( ponto );
    pontos.add( ponto );
  }
}

void draw(){
  
  background(220);
  lights();  
  float zm = 200; //random(200,250);
  float sp = 0.01 * frameCount;
  camera(zm * cos(sp), zm * sin(sp), zm, 0, 0, 0, 0, 0, -1);

  fill(255,255,0, 10);
  strokeWeight(random(1,3));
    for( PVector p : pontos ){
    stroke(random(255), random(255), random(255));
    point(p.x, p.y, p.z);
  }
  strokeWeight(1);
  stroke(0);
  wrap.plot();
}
