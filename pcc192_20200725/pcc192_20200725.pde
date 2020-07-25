/* 192_20200725 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);

  final float[][] params = {
    {-0.80,  0.15}, 
    {-0.54,  0.50}, 
    {-0.50,  0.53}, 
    {-0.12,  0.77}, 
    {-0.10,  0.70}, 
    { 0.32, -0.12}, 
    { 0.00, -0.60}, 
    { 0.10, -0.62}, 
    {-0.05, -0.75}, 
    {-0.80, -0.00}, 
    {-0.74,  0.06}, 
    {-0.75,  0.07}
  };
  final float d = 120;

  for ( float[] p : params ) {
    juliaSet(p, random(d, width-d), random(d, height-d), random(320, 580));
  }
}


void juliaSet(float[] p, float x, float y, float l) {

  float rez, imz;
  float nR, xR, nG, xG, nB, xB;

  nR = random(  0, 128);
  xR = random(128, 255);
  nG = random(  0, 128);
  xG = random(128, 255);
  nB = random(  0, 128);
  xB = random(128, 255);

  for ( float h = y-0.5*l; h < y+0.5*l; h++ ) {
    imz = map(h, y-0.5*l, y+0.5*l, 1.2, -1.2);
    for ( float w = x-0.7*l; w < x+0.7*l; w++ ) {
      rez = map(w, x-0.7*l, x+0.7*l, -1.6, 1.6);
      if ( isPointEscape(rez, imz, p[0], p[1]) ) {
        stroke(
          map(noise(w/60,  h/80), 0, 1, nR, xR), 
          map(noise(w/70,  h/70), 0, 1, nG, xG), 
          map(noise(w/40, h/100), 0, 1, nB, xB)
        );
        point(w, h);
      }
    }
  }

  return ;
}


boolean isPointEscape(float rez, float imz, float rec, float imc) {

  float crez, cimz;

  for ( int i = 0; i < 100; i++ ) {
    if ( mag(rez, imz) > 4 ) {
      return false;
    }
    crez = rez;
    cimz = imz;
    rez = sq(crez) - sq(cimz) + rec;
    imz = 2 * crez * cimz + imc;
  }

  return true;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("192.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
