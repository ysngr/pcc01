/* 199_20200730 */

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  background(0);

  final float d = 220;

  for ( float h = 0; h < height+d; h += random(0.8, 1.2)*d ) {
    for ( float w = 0; w < width+d; w += random(0.45, 0.55)*d ) {
      decircle(w, h, random(0.8*d, 1.2*d));
    }
  }
  for ( int i = 0; i < 7; i++ ) {
    dechole(random(width), random(height), random(1, 3)*d);
  }
  for ( int i = 0; i < 10; i++ ) {
    ccircle(random(width), random(height), random(0.2, 0.6)*d);
  }
  for ( int i = 0; i < 5; i++ ) {
    dlines();
  }
}


void decircle(float x, float y, float l) {

  final color[] cs = {
    color(160, 216, 239), 
    color(105, 186, 223)
  };
  final float d = 2.5;

  noStroke();
  fill(cs[(int)random(cs.length)], 6);

  for ( float r = l; r > 0; r -= random(1, 2) ) {
    circle(x+random(-1, 1)*d, y+random(-1, 1)*d, 2*r);
  }

  return ;
}


void dechole(float x, float y, float l) {

  final color[] cs = {
    color(226,  69,  31), 
    color(231, 117,  52), 
    color(244, 164,  88), 
  };

  float r = l;
  int idx = (int)random(cs.length);

  strokeWeight(1);
  noFill();

  for ( float a = 100; a > 0; a -= random(1) ) {
    stroke(cs[idx], a);
    circle(x, y, 2*r);
    r += 1;
  }

  return ;
}


void ccircle(float x, float y, float l) {

  final color[] cs = {
    color(226,  69,  31), 
    color(231, 117,  52), 
    color(244, 164,  88), 
    color(232,  56,  40), 
    color(174, 211, 237)
  };

  noStroke();
  fill(cs[(int)random(cs.length)], random(120, 220));
  circle(x, y, l);

  return ;
}


void dlines() {

  final color[] cs = {
    color(234,  77,  21), 
    color( 98, 144, 177), 
    color( 78, 191, 213), 
    color(124, 185, 215)
  };

  strokeWeight(random(1, 3));
  stroke(cs[(int)random(cs.length)], 200);

  line(random(width), 0, random(width), height);
  line(0, random(height), width, random(height));

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("199.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
