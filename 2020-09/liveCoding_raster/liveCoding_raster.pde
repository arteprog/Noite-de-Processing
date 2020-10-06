/*
Apresentado por André Burnier na Noite de Processing em 29/09/2020.
*/

int div = 20;
PGraphics orig;
PImage[][] imgs = new PImage[div][div];
float[] pontos = new float[div];
float t = 0;

void setup() {
  size(800, 800);

  orig = createGraphics(width, height);
  PFont fonte = createFont("Helvetica-Bold", height*0.3);
  orig.beginDraw();
  orig.background(0);
  orig.fill(255);
  orig.noStroke();
  orig.textAlign(CENTER);
  orig.textFont(fonte);
  orig.text("teste", width*0.5, height*0.6);
  orig.endDraw();

  recortaImg();
}


void draw() {
  background (0);
  //image(orig, 0, 0);
  calcPontos();
  //int w = ceil(orig.width/div);
  float x = 0;
  float y = 0;
  for (int i = 0; i < div; i ++) {
    for (int j = 0; j < div; j ++) {
      image(imgs[i][j], x, y, pontos[i], pontos[j]);
      noFill();
      stroke(255,0,0);
      rect(x, y, pontos[i], pontos[j]);
      y += pontos[j];
    }
    y = 0;
    x += pontos[i];
  }
  t +=0.005;
}

void calcPontos(){
  float soma = 0;
  for(int i = 0; i < pontos.length; i ++){
    float atual = norm(i,0,pontos.length);
    pontos[i] = pow(noise(atual,t), 4);
    soma += pontos[i];
  }
  
  for(int i = 0; i < pontos.length; i ++){
    float w = map(pontos[i], 0, soma, 0, width);
    pontos[i] = w;
  }
  
}

void recortaImg() {
  int w = ceil(orig.width/div);
  int x = 0;
  int y = 0;
  for (int i = 0; i < div; i ++) {
    for (int j = 0; j < div; j ++) {
      imgs[i][j] = orig.get(x, y, w, w);
      y +=w;
    }
    y = 0;
    x += w;
  }
}
