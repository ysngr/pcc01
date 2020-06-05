/* 160_20200605 */

final color[] cs = {
  color(241, 205, 189), 
  color(195, 144, 150), 
  color(153,  89, 110), 
  color(245, 175, 120), 
  color(244, 170, 150), 
  color(101,  89,  93), 
  color( 79,  50,  53)
};


void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
  strokeWeight(1.0);
  noFill();
}


void draw() {
  background(255, 248, 243);

  blendMode(MULTIPLY);
  final float L = 80;
  for ( float h = 40; h < height; h += L ) {
    for ( float w = 20; w < width; w += L ) {
      figs(w, h, L);
    }
  }

  blendMode(BLEND);
  for ( int i = 0; i < 10; i++ ) {
    hole(random(width), random(height), random(140, 260));
  }
}


void figs(float w, float h, float l) {

  if ( random(2) < 1 ) {
    decSquare(w, h, random(l/4, l/1.5));
  }

  if ( random(2) < 1 ) {
    halfCircle(w-l/2, h, l, -HALF_PI, HALF_PI);
  }

  if ( random(2) < 1 ) {
    halfCircle(w+l/2, h, l, -3*HALF_PI, -HALF_PI);
  }

  if ( random(2) < 1 ) {
    halfCircle(w, h-l/2, l, 0, PI);
  }

  if ( random(2) < 1 ) {
    halfCircle(w, h+l/2, l, -PI, 0);
  }

  return ;
}


void decSquare(float w, float h, float l) {

  color c = cs[(int)random(cs.length)];
  int a = (int)random(100, 160);

  for ( float r = l; r > 0; r-- ) {
    stroke(c, a--);
    square(w, h, r);
  }

  return;
}


void halfCircle(float w, float h, float l, float st, float et) {

  color c = cs[(int)random(cs.length)]; 
  int a = (int)random(10, 100); 

  for ( float r = l; r > 0; r-- ) {
    stroke(c, a++); 
    arc(w, h, r, r, st, et);
  }

  return;
}


void hole(float w, float h, float l) {

  color c = cs[(int)random(cs.length)];
  int a = (int)random(120, 180);

  float r = l;
  while ( a > 0 ) {
    stroke(c, a--);
    circle(w, h, r++);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("160.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
