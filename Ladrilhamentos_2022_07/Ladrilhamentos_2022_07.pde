float sq3;
int TS = 4;

//"GLM":{ "T1":[-1,0,2,2], "T2":[3,2,-1,-2], "Seed":[ [0,0,0,0], [-1,0,2,1], [0,0,1,0], [0,0,1,1], [0,1,1,0], [1,1,1,0], [1,2,1,-1], [1,2,1,0], [2,2,0,-2], [2,2,0,-1], ] }
Wcoord T1;
Wcoord T2;
Wcoord[] Seed;

Wcoord[] dir12;

//                         2  3  4   5   
int[] polytype = { -1, -1, 3, 4, 6, 12 };

color[] palette = { #000000, #000000, #FF7231, #FBFF31, #31FFBF, #9731FF };

void setup() {
  size(600, 600);

  sq3 = sqrt(3);
  
  //GLM
  /*
  T1 = new Wcoord( -1, 0, 2, 2 );
  T2 = new Wcoord( 3, 2, -1, -2 );
  Seed = new Wcoord[10];
  Seed[0] = new Wcoord( 0, 0, 0, 0 );
  Seed[1] = new Wcoord( -1, 0, 2, 1);
  Seed[2] = new Wcoord( 0, 0, 1, 0 );
  Seed[3] = new Wcoord( 0, 0, 1, 1 );
  Seed[4] = new Wcoord( 0, 1, 1, 0 );
  Seed[5] = new Wcoord( 1, 1, 1, 0 );
  Seed[6] = new Wcoord( 1, 2, 1, -1);
  Seed[7] = new Wcoord( 1, 2, 1, 0 );
  Seed[8] = new Wcoord( 2, 2, 0, -2);
  Seed[9] = new Wcoord( 2, 2, 0, -1);*/
  
  //t6020
  T1 = new Wcoord(-3,0,6,3);
  T2 = new Wcoord(6,3,-3,-3);
  Seed = new Wcoord[54];
  Seed[0] = new Wcoord(0,0,0,0);
  Seed[1] = new Wcoord(0,0,0,2);
  Seed[2] = new Wcoord(0,-1,2,3);
  Seed[3] = new Wcoord(-1,-1,4,3);
  Seed[4] = new Wcoord(0,0,1,2);
  Seed[5] = new Wcoord(-2,0,5,3);
  Seed[6] = new Wcoord(0,-1,3,3);
  Seed[7] = new Wcoord(0,1,0,0);
  Seed[8] = new Wcoord(0,1,0,1);
  Seed[9] = new Wcoord(0,0,2,2);
  Seed[10] = new Wcoord(-1,0,4,3);
  Seed[11] = new Wcoord(1,1,-1,0);
  Seed[12] = new Wcoord(0,1,1,1);
  Seed[13] = new Wcoord(0,0,3,2);
  Seed[14] = new Wcoord(0,0,3,3);
  Seed[15] = new Wcoord(0,2,0,0);
  Seed[16] = new Wcoord(0,1,2,1);
  Seed[17] = new Wcoord(-1,1,4,3);
  Seed[18] = new Wcoord(0,2,1,0);
  Seed[19] = new Wcoord(1,2,-1,0);
  Seed[20] = new Wcoord(0,1,3,1);
  Seed[21] = new Wcoord(0,1,3,3);
  Seed[22] = new Wcoord(1,2,0,0);
  Seed[23] = new Wcoord(2,2,-2,0);
  Seed[24] = new Wcoord(0,2,2,0);
  Seed[25] = new Wcoord(3,2,-3,0);
  Seed[26] = new Wcoord(0,2,3,0);
  Seed[27] = new Wcoord(0,2,3,1);
  Seed[28] = new Wcoord(0,2,3,2);
  Seed[29] = new Wcoord(3,2,-2,0);
  Seed[30] = new Wcoord(1,2,2,0);
  Seed[31] = new Wcoord(2,2,0,0);
  Seed[32] = new Wcoord(4,2,-3,0);
  Seed[33] = new Wcoord(1,2,3,0);
  Seed[34] = new Wcoord(1,2,3,1);
  Seed[35] = new Wcoord(1,2,3,2);
  Seed[36] = new Wcoord(3,2,-1,0);
  Seed[37] = new Wcoord(2,2,1,0);
  Seed[38] = new Wcoord(5,2,-3,-1);
  Seed[39] = new Wcoord(5,2,-3,0);
  Seed[40] = new Wcoord(2,2,3,0);
  Seed[41] = new Wcoord(2,2,3,1);
  Seed[42] = new Wcoord(4,2,-1,0);
  Seed[43] = new Wcoord(3,2,1,0);
  Seed[44] = new Wcoord(5,2,-2,0);
  Seed[45] = new Wcoord(4,2,0,0);
  Seed[46] = new Wcoord(3,2,2,0);
  Seed[47] = new Wcoord(6,2,-3,0);
  Seed[48] = new Wcoord(3,2,3,0);
  Seed[49] = new Wcoord(6,2,-3,-2);
  Seed[50] = new Wcoord(6,2,-3,-1);
  Seed[51] = new Wcoord(6,2,-2,0);
  Seed[52] = new Wcoord(4,2,2,0);
  Seed[53] = new Wcoord(5,2,0,0);

  dir12 = new Wcoord[12];
  dir12[0] = new Wcoord(1, 0, 0, 0);
  dir12[1] = new Wcoord(0, 1, 0, 0);
  dir12[2] = new Wcoord(0, 0, 1, 0);
  dir12[3] = new Wcoord(0, 0, 0, 1);
  dir12[4] = new Wcoord(-1, 0, 1, 0);
  dir12[5] = new Wcoord(0, -1, 0, 1);
  dir12[6] = new Wcoord(-1, 0, 0, 0);
  dir12[7] = new Wcoord(0, -1, 0, 0);
  dir12[8] = new Wcoord(0, 0, -1, 0);
  dir12[9] = new Wcoord(0, 0, 0, -1);
  dir12[10] = new Wcoord(1, 0, -1, 0);
  dir12[11] = new Wcoord(0, 1, 0, -1);
}

void draw() { 
  background(127);
  translate( 300, 300 );
  scale(15);

  HashMap<String, Wcoord> hash = new HashMap<String, Wcoord>();

  noStroke();
  fill(0);
  for ( int x = -TS; x <= TS; x++ ) {
    for ( int y = -TS; y <= TS; y++ ) {
      Wcoord translacao = T1.scaled( x ).translated( T2.scaled( y ) );
      for (int i=0; i < Seed.length; i++) {
        Wcoord WC = Seed[i].translated( translacao );
        hash.put( WC.toString(), WC );
        WC.display();
      }
    }
  }

  stroke(0);
  strokeWeight(0.1);
  fill(255);
  for ( int x = -TS; x <= TS; x++ ) {
    for ( int y = -TS; y <= TS; y++ ) {
      Wcoord translacao = T1.scaled( x ).translated( T2.scaled( y ) );
      for (int i = 0; i < Seed.length; i++) {
        Wcoord WC = Seed[i].translated( translacao );
        int face = 0;
        int[] neighs = new int[12];
        for ( int d=0; d < 6; d++ ) {
          Wcoord neighbor = WC.translated( dir12[d] );
          Wcoord val = hash.get( neighbor.toString() );
          if ( val != null ) {
            neighs[ face++ ] = d;
          }
        }
        PVector A = WC.display_coords();
        for( int n = 0; n < face-1; n++ ){
  
          int diff = neighs[n+1] - neighs[n];
          int skip = 12/polytype[diff];
          fill( palette[ diff ] );
          
          Wcoord fc = WC;
          beginShape();
          for ( int f = 0; f < 12; f += skip ) {
            Wcoord nfc = fc.translated( dir12[ (neighs[n] + f) % 12 ] );
            PVector F = nfc.display_coords();
            vertex( F.x, F.y );
            fc = nfc;
          }
          endShape(CLOSE);
        }
      }
    }
  }


  noLoop();
}


class Wcoord { 
  int[] w = new int[4]; 
  Wcoord(int w0, int w1, int w2, int w3) { 
    w[0] = w0; 
    w[1] = w1; 
    w[2] = w2; 
    w[3] = w3;
  }
  Wcoord translated( Wcoord wc ) {
    Wcoord out = new Wcoord(0, 0, 0, 0);
    for (int i = 0; i < 4; i++) {
      out.w[i] = w[i] + wc.w[i];
    }
    return out;
  }
  Wcoord scaled( int k ) {
    Wcoord out = new Wcoord(0, 0, 0, 0);
    for (int i = 0; i < 4; i++) {
      out.w[i] = w[i] * k;
    }
    return out;
  }
  void display() { 
    float x = w[0] + 0.5 * sq3 * w[1] + 0.5 * w[2]; 
    float y = 0.5 * w[1] + 0.5 * sq3 * w[2] + w[3]; 
    circle(x, y, 0.2);
    //point(x,y);
  }
  PVector display_coords() {
    return new PVector( w[0] + 0.5 * sq3 * w[1] + 0.5 * w[2], 
      0.5 * w[1] + 0.5 * sq3 * w[2] + w[3] );
  }
  String toString() {
    return  w[0]+","+w[1]+","+w[2]+","+w[3];
  }
} 
