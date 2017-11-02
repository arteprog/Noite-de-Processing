by tatasz, Oct 3, 2017, 6:26:37 AM
int depth = 0; //<>//

float s;


void setup() {
 size(400, 400);
 s = (width-50)/2;
}

void draw() {
 background(255);
 fill(16, 130, 166);
 stroke(16, 130, 166);
 
 Sierp(new PVector(width/2 + s * cos(-PI/6), height/2 - s * sin(-PI/6)), 
       new PVector(width/2 + s * cos(-5*PI/6), height/2 - s * sin(-5*PI/6)), 
       new PVector(width/2 + s * cos(PI/2), height/2 - s * sin(PI/2)), depth, 0); 
 
 fill(255);
}

void Sierp(PVector p1, PVector p2, PVector p3, int max_depth, int current_depth) {
 if(current_depth < max_depth) {
   PVector m1 = new PVector(p1.x + (p3.x - p1.x) / 2, 
                                    p1.y + (p3.y - p1.y) / 2);
   PVector m2 = new PVector(p2.x + (p3.x - p2.x) / 2, 
                                     p2.y + (p3.y - p2.y) / 2);
   PVector m3 = new PVector(p1.x + (p2.x - p1.x) / 2, p1.y);
   
   int new_depth = current_depth + 1;
   
   Sierp(m1, m2, p3, max_depth, new_depth);
   Sierp(p1, m3, m1, max_depth, new_depth);
   Sierp(m3, p2, m2, max_depth, new_depth); //<>//
 } else {
   triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y); //<>//
 }
}

void mousePressed() {  
 depth++; 
}
