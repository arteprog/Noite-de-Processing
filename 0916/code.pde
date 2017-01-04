/*Abaixo o resultado do workshop Software Arte e Sistemas de Partículas com 
João Antonio que ocorreu no dia 27/9/2016 na Noite de Processing 
(confira aqui alguns outros trabalhos do John: http://imgur.com/a/6lZu4).
Ao longo do processo exploramos algumas ideias separadas, que se encontram comentadas. 
Em especial no método run() da classe Body, 
algumas opções interessantes podem ser habilitadas removendo-se as barras de comentário (//).*/

ArrayList<Body> bodies;     //Lista de corpos.
   float G;                    //constante gravitacional.
   float mm;                   //massa do mouse
   PVector mouse;              //posicao do mouse convertida em PVector para facilitar.
   int bmode = 0;              //estilo: 0: sem rastro. 1: rastro curto. 2: rastro permanente.
   
   void setup(){
     fullScreen();
     
     G = 8;
     mm = 30;
     
     bodies = new ArrayList();
     
     //inicializacao com 20 corpos aleatoriamente posicionados.
     for( int i = 0; i < 20; i++ ){
       bodies.add( new Body( random( width ), random( height ), random(2, 8) ) );
     }
     
     /* 
     inicializacao com dois corpos onde o segundo esta em orbita circular ao redor do primeiro.
     para que a simulacao rode corretamente o corpo 0 nao pode rodar seu metodo run() dentro do draw(),
     apenas seu metodo display().
     bodies.add( new Body( width/2f, height/2f, 50 ) );
     bodies.add( new Body( (width/2f) - 300, height/2f, 5 ) );
     bodies.get(1).vel = new PVector( 0, -sqrt( G*(50/300.0) ) ); 
     */
     noStroke();
     background(0);
   }
   
   void draw(){
     if(bmode == 0 ) background(0);
     else if( bmode == 1 ){
       fill( 0, 10 );
       rect( 0, 0, width, height );
       fill(255);
     }
     
     mouse = new PVector( mouseX, mouseY );
   
     for( int i = 0; i < bodies.size(); i++ ){
       for( int j = i+1; j < bodies.size(); j++ ){
         bodies.get(i).gravitate( bodies.get(j) );
       }
     }
   
     for( int i = 0; i < bodies.size(); i++ ) bodies.get(i).run();
     
   }
   
   class Body{                     //classe que define um corpo do sistema.
     float mass;
     PVector pos, vel, acc;
     Body(float x, float y, float m){
       mass = m;
       pos = new PVector( x, y );
       //vel = new PVector( random( -2, 2), random(-2, 2) ); //inicializacao com velocidades aleatorias.
       vel = new PVector();
       acc = new PVector();
     }
     void gravitate( Body b ){
       float f = G * (mass * b.mass) / sq( pos.dist(b.pos) ); // forca
       float a = atan2( b.pos.y - pos.y, b.pos.x - pos.x );   // direcao (angulo em radianos)
       float g = f/mass;                                      // aceleracao
       acc.add( new PVector( g*cos(a), g*sin(a) ) );
       g = f/b.mass;
       b.acc.add( new PVector( g*cos(a+PI), g*sin(a+PI) ) );
     }
     void gravitate_to_mouse(){
       float f = G * (mass * mm) / sq( pos.dist(mouse) );
       float a = atan2( mouseY - pos.y, mouseX - pos.x );
       acc.add( new PVector( f*cos(a), f*sin(a) ) );
     }
     void constrain_velocity( float max ){
       vel.setMag( constrain( vel.mag(), 0, max ) );
     }
     void wrap_around(){
       if( pos.x > width ){
         pos.x -= width;
       }    
       else if ( pos.x < 0 ){
         pos.x = width+pos.x;
       }
       if( pos.y > height ){
         pos.y -= height;
       }
       else if( pos.y < 0 ){
         pos.y = height+pos.y;
       }
     }
     void run(){
       //vel.y += 0.005;                    // Exemplo de gravidade simples (para baixo)
       //vel.setMag( 0.99 * vel.mag() );    // Exemplo onde os corpos desaceleram.
       gravitate_to_mouse();              // inclui o mouse como uma massa dentro do sistema.
       constrain_velocity( 6 );           // aplica um valor maximo para a velocidade, que ajuda a evitar que as massas escapem.
       wrap_around();                     // faz com que os corpos reaparecam na tela pelo lado oposto àquele pelo qual escaparam.
       // (para os nerds de geometria: isso torna o espaco, topologicamente, em um toróide )
       
       vel.add(acc);
       pos.add(vel);
       display();
       acc = new PVector();
     }
     void display(){
       ellipse( pos.x, pos.y, mass, mass );
     }
   }
   
   void keyPressed(){ 
     if( key == 'b' || key == 'B' ){       // aperte 'b' para alterar o estilo de rastro.
       if( bmode == 2 ) bmode = 0;
       else bmode++;
     }
   }
