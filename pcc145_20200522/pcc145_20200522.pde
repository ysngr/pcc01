/* 145_20200522 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(235, 240, 243);
  for ( int i = 0; i < 60; i++ ) {
    drawBoard();
  }
}


color selectColor() {

  final color[] cs = {
    color(123, 159, 211), 
    color(143, 181, 224), 
    color(187, 208, 236), 
    color(222, 231, 245), 
    color(204, 224, 244), 
    color( 74, 148, 191), 
    color( 37,  92, 142), 
    color( 88,  86,  35)
  };

  return cs[(int)random(cs.length)];
}


void drawBoard() {

  float len, dl;
  color c;

  pushMatrix();
  translate(random(width), random(height));
  rotate(random(-PI, PI));

  len = random(50, 220);
  dl = random(0.005, 0.020) * len;
  c = selectColor();
  for ( float l = 0; l <= len; l += dl ) {
    strokeWeight(map(l, 0, len, 1.4, 0.1));
    stroke(c, map(l, 0, len, 50, 0));
    line(l, 0, l, len);
    line(0, l, len, l);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("145.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
