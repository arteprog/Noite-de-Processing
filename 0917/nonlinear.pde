// by tatasz, Oct 3, 2017, 6:26:40 AM

PVector P; //<>//

void setup() {
 size(400, 400);
 background(255);
 stroke(0);
 fill(0);
 
 
}

void draw() 
{
 P = new PVector(random(-1,1), random(-1,1));
 for (int iter = 0; iter < 5000; iter ++){
    switch(int(random(2))){
       case 0:
         P = affine(P, 0, -2, 2, 0, 0, 0);
         float offset = (P.x < 0) ? -1.8 : 1.8;
         P = new PVector(P.x + offset, P.y);
         break;
       case 1:
         P = affine(P, 0, -0.5, 0.5, 0, 0, 0);
         float tmp = P.x * P.x + P.y * P.y + 1;
         float x2 = 2.0 * P.x;
         float xmax = 0.5 * (sqrt(tmp + x2) + sqrt(tmp - x2));
         float a = P.x / xmax;
         float w = (P.y > 0) ? 1.0 : -1.0;
         P = new PVector(asin(a), log(xmax + sqrt(max(0, xmax - 1.0))) * w);
         break;       
       }
     point(P.x * width / 5 + width / 2, -P.y * height / 5 + height/2);
 }
 //saveFrame("e-s-######.png");
}

PVector affine(PVector xy, float a, float b, float c, float d, float e, float f){
 float px = a * xy.x + b * xy.y + e;
 float py = c * xy.x + d * xy.y + f;
 return(new PVector(px, py));
}
