// by tatasz, Oct 3, 2017, 6:26:38 AM

PVector P; //<>//

void setup() {
 size(400, 400);
 background(255);
 stroke(0);
 fill(0);
 
 P = new PVector(0, height);
}

void draw() 
{
 for (int iter = 0; iter < 2000; iter ++){
     switch(int(random(3))){
       case 0:
         P.add(new PVector(0, 0));
         P.mult(0.5);
         break;
       case 1:
         P.add(new PVector(1, 0));
         P.mult(0.5);
         break;      
       case 2:
         P.add(new PVector(0.5, sin(PI/3) * 1));
         P.mult(0.5);
         break;
       }
     point(P.x * width, P.y * height);
 }
 //saveFrame("sierpinski-######.png");
}
