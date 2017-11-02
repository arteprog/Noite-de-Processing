//by tatasz, Oct 3, 2017, 6:26:39 AM

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
    float rand = random(1);
    int select = 0;
    if (rand < 0.13) {
      select = 1;
    } else {
      if (rand < 0.24) {
        select = 2;
      } else {
        if (rand < 0.25){
          select = 3;
        }
    }
    }
     switch(select){
       case 0:
         P = affine(P, 0.85, 0.04, -0.04, 0.85, 0.0, 1.6);
         stroke(255,0,0);
         point(P.x * width / 11 + width / 2, -P.y * height / 11 + height);
         break;
       case 1:
         P = affine(P, 0.2, -0.26, 0.23, 0.22, 0.0, 1.6);
         stroke(0,255,0);
         point(P.x * width / 11 + width / 2, -P.y * height / 11 + height);
         break;      
       case 2:
         P = affine(P, -0.15, 0.28, 0.26, 0.24, 0.0, 0.44);
         stroke(0,0,255);
         point(P.x * width / 11 + width / 2, -P.y * height / 11 + height);
         break;
       case 3:
         P = affine(P, 0.0, 0.0, 0.0, 0.16, 0.0, 0.0);
         stroke(0,0,0);
         point(P.x * width / 11 + width / 2, -P.y * height / 11 + height);
         break;
       }
     
 }
 //saveFrame("sierpinski-######.png");
}

PVector affine(PVector xy, float a, float b, float c, float d, float e, float f){
 float px = a * xy.x + b * xy.y + e;
 float py = c * xy.x + d * xy.y + f;
 return(new PVector(px, py));
}
