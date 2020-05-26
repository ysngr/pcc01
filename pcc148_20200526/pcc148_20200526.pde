/* 148_20200526 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(234, 235, 235);
  for ( int i = 0; i < 18; i++ ) {
    drawLoop();
  }
}


void drawLoop() {

  final float dt = PI / 128;
  final color[] cs = {
    color(227, 236, 244), 
    color(112, 148, 158), 
    color(212, 212, 211), 
    color( 51,  49, 115), 
    color(204, 104, 117), 
  };

  float w, h, ew, eh;
  color c;

  pushMatrix();
  translate(random(width), random(height));
  rotate(random(-PI, PI));

  w = random(20, 140);
  h = random(20, 140);
  ew = random(40, 180);
  eh = random(40, 180);
  c = cs[(int)random(cs.length)];

  strokeWeight(1.0);
  noFill();

  for ( float t = 0; t < PI; t += dt ) {
    stroke(c, map(t, 0, PI, 20, 128));
    ellipse(w*cos(t), h*sin(t), ew, eh);
  }
  for ( float t = PI; t < TWO_PI; t += dt ) {
    stroke(c, 148-map(t, PI, TWO_PI, 20, 128));
    ellipse(w*cos(t), h*sin(t), ew, eh);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("148.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
