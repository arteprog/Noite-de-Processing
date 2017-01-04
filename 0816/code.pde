// Resultado do whorkshop
// Noite de Processing: Introdução à Visão Computacional usando Processing
// com Airton Gaidys
// 30/08/2016
// Garoa Hacker Clube

PImage img;
PImage imgAux;


void setup() {
  size(900, 300);
  frameRate(30);
  img = loadImage("Michelangelo.jpg");
  imgAux = img;
  println("Imagem X-> " + img.width);
  println("Imagem Y-> " + img.height);  
  loop();
  
}

void draw() {
  background(1);
  image(img,0,0,400,300);
  image(imgAux,410,0,400,300);  
}

void keyPressed(){
  
    img.loadPixels();
    imgAux.loadPixels();
    PImage foto = createImage(img.width , img.height , RGB);
    foto.loadPixels();
    
    if(key == '0'){
      foto = img;
      
    }
    
    if(key == '1') {
      int origem = img.width * img.height;
      int destino = 0;   
      for (int temp = origem-1; temp>=0; temp--){
         foto.pixels[destino] = img.pixels[temp];
         destino++;            
      }
    }
    
    if(key == '2'){
      int origem = img.height*img.width-img.width;
      int destino = 0;
        for (int temp = 0; temp<img.height; temp++){
            for (int temp1 = origem; temp1 > 0; temp1-=img.width){
                foto.pixels[destino] = img.pixels[temp1];
                destino++;            
            }
            origem++; 
            destino = temp*img.width;
         }      
     }
     
     if(key == '3'){
       int meio = int(img.width/2);
       int origemDestino = 0;
       
       for (int y = 0; y< img.height; y++)
           for(int x = 0; x<img.width; x++){
             
           foto.pixels[origemDestino] = img.pixels[origemDestino];
           
           if (x == meio) foto.pixels[origemDestino] = 0; 
           
           origemDestino++;
         }       
     }
     
     if(key == '4'){
       int meio = int(img.height/2);
       int origemDestino = 0;
       
       for (int y = 0; y< img.height; y++)
           for(int x = 0; x<img.width; x++){
             
           foto.pixels[origemDestino] = img.pixels[origemDestino];
           
           if (y == meio) foto.pixels[origemDestino] = 0; 
           
           origemDestino++;
         }       
     }
     
     if(key == '5'){
       
       int origemDestino = 0;
       int meio = int(img.height/2);
       color c = color(255, 204, 0);
       for (int y = 0; y< img.height; y++)
           for(int x = 0; x<img.width; x++){
             
               color cor = img.pixels[origemDestino];
               foto.pixels[origemDestino] = cor;
               if (y == meio) foto.pixels[origemDestino] = c; 
               origemDestino++;
         }       
     }
     
     if(key == '6'){
       
       int origemDestino = 0;
       for (int y = 0; y< img.height; y++)
           for(int x = 0; x<img.width; x++){
             
               color cor = img.pixels[origemDestino];
               float vermelho = red(cor);
               float verde    = green(cor);
               float azul     = blue(cor);
               cor = color(verde,azul,vermelho);
               foto.pixels[origemDestino] = cor;
               
               origemDestino++;
         }       
     }
     
     if(key == '7'){
       int limite = 75;
       int origemDestino = 0;
       for (int y = 0; y< img.height; y++)
           for(int x = 0; x<img.width; x++){
             
               color cor = img.pixels[origemDestino];
               float vermelho = red(cor) - limite;
               float verde    = green(cor) - limite;
               float azul     = blue(cor) - limite;
               if (vermelho < 0) vermelho = 0;
               if (verde < 0) verde = 0;
               if (azul < 0) azul = 0;
               cor = color(vermelho,verde,azul);
               foto.pixels[origemDestino] = cor;
               
               origemDestino++;
         }       
     }
     
     if(key == '8'){
       int limite = 75;
       int origemDestino = 0;
       for (int y = 0; y< img.height; y++)
           for(int x = 0; x<img.width; x++){
             
               color cor = img.pixels[origemDestino];
               float vermelho = red(cor) + limite;
               float verde    = green(cor) + limite;
               float azul     = blue(cor) + limite;
               if (vermelho > 255) vermelho = 255;
               if (verde > 255) verde = 255;
               if (azul > 255) azul = 255;
               cor = color(vermelho,verde,azul);
               foto.pixels[origemDestino] = cor;
               
               origemDestino++;
         }       
     }
     
     if(key == '9'){
       int media = 0;
       int origemDestino = 0;
       for (int y = 0; y< img.height; y++)
           for(int x = 0; x<img.width; x++){
             
               color cor = img.pixels[origemDestino];
               float vermelho = red(cor);
               float verde    = green(cor);
               float azul     = blue(cor);
               media = int((vermelho + verde + azul)/3);
               cor = color(media,media,media);
               foto.pixels[origemDestino] = cor;
               
               origemDestino++;
         }       
     }
     
     if((key == 'a') || (key == 'A')){
       int media = 0;
       int limite = 150;
       int origemDestino = 0;
       for (int y = 0; y< img.height; y++)
           for(int x = 0; x<img.width; x++){
             
               color cor = img.pixels[origemDestino];
               float vermelho = red(cor);
               float verde    = green(cor);
               float azul     = blue(cor);
               media = int((vermelho + verde + azul)/3);
               if (media < limite) foto.pixels[origemDestino] = 0x00000000;
                  else foto.pixels[origemDestino] = 0x00FFFFFF;
               
               origemDestino++;
         }       
     }
    
    if((key == 'B') || (key == 'b')){
       PImage img2 = loadImage("coracao.jpg");
       int origemDestino = 0;
       for (int y = 0; y< img.height; y++)
           for(int x = 0; x<img.width; x++){
             
               color cor = img.pixels[origemDestino];
               float vermelho = red(cor);
               float verde    = green(cor);
               float azul     = blue(cor);
               color cor2 = img2.pixels[origemDestino];
               float vermelho2 = red(cor2)+50;
               float verde2    = green(cor2)+50;
               float azul2     = blue(cor2)+50;
               vermelho += vermelho2;
               azul += azul2;
               verde +=verde2;
               vermelho2 = int(vermelho/2);
               azul2 = int(azul/2);
               verde2 = int(verde/2);
               foto.pixels[origemDestino] = color(vermelho2,verde2,azul2);
               origemDestino++;
         }       
     }
    
    if((key == 'C') || (key == 'c')){
       int origemDestino = 0;
       for (int y = 0; y< img.height; y++)
           for(int x = 0; x<img.width; x+=2){
               foto.pixels[origemDestino] = img.pixels[origemDestino];
               origemDestino+=2;
       }
       origemDestino = img.width;
       for (int y = 1; y< img.height; y+=2){
           for(int x = 0; x<img.width; x++){
           foto.pixels[origemDestino] = 0x0;
           origemDestino++;
         }
         origemDestino+= img.width;
       }
    }
    
    imgAux = foto;
    imgAux.updatePixels();
    
  }
