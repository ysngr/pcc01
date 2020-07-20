/* 184_20200721 */

void setup() {
  size(1000, 1000);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  Background(247, 242, 244);
  for ( int i = 0; i < 20; i++ ) {
    squareDecircle(random(width), random(height), random(50, 160));
  }
}


void Background(float r, float g, float b) {

  background(128);

  strokeWeight(2);
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      stroke(
        map(noise(w/300, h/200), 0, 1, r-30, r+30), 
        map(noise(w/400, h/300), 0, 1, g-30, g+30), 
        map(noise(w/200, h/400), 0, 1, b-30, b+30)
      );
      point(w, h);
    }
  }

  return ;
}


void squareDecircle(float x, float y, float l) {

  pushMatrix();
  translate(x, y);
  rotate(random(-1, 1)*PI/128);
  decircle(0, 0, l);
  swsquare( l,  l, random(l/2, 3*l/2));
  swsquare(-l,  l, random(l/2, 3*l/2));
  swsquare(-l, -l, random(l/2, 3*l/2));
  swsquare( l, -l, random(l/2, 3*l/2));
  popMatrix();

  return ;
}


void decircle(float x, float y, float l) {

  final color[] cs = {
    color(253, 237,  82), 
    color(251, 220,  53), 
    color(227, 189,  58), 
    color(251, 236, 165), 
    color(230, 221, 135), 
    color(221, 203, 107)
  };

  noStroke();
  fill(cs[(int)random(cs.length)], random(2, 4));

  for ( float r = 1.25*l; r > 0; r -= random(1.5) ) {
    circle(x+random(-1, 1), y+random(-1, 1), 2*r);
  }

  return ;
}


void swsquare(float x, float y, float l) {

  final color[] cs = {
    color(  0, 165, 213), 
    color( 89, 195, 225), 
    color(161, 216, 225), 
    color( 76, 187, 180), 
    color(134, 202, 182), 
    color(230, 229, 215), 
    color( 91, 164, 105), 
    color(250, 238, 222)
  };

  strokeWeight(random(1, 5));
  stroke(230, 229, 215);
  fill(cs[(int)random(cs.length)], random(80, 180));

  square(x, y, l);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("184.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
