/* 178_20200708 */

void setup() {
  size(1150, 800);
  noLoop();
  noStroke();
}


void draw() {
  background(220, 209, 185);
  for ( int i = 0; i < 260; i++ ) {
    pushMatrix();
    translate(random(width), random(height));
    rotate(random(-PI, PI));
    setColor();
    hexaflake(0, 0, random(20, 180));
    popMatrix();
  }
}


void setColor() {

  final color[] cs = {
    color(240, 132,  74), 
    color(244, 164, 102), 
    color(238, 186, 107), 
    color(254, 228, 167), 
    color(223, 151, 112), 
  };

  float a;

  if ( random(32) < 1 ) {
    a = 160;
    blendMode(DIFFERENCE);
  } else {
    a = ( random(8) < 1 )? random(220, 255) : random(30, 50);
    blendMode(BLEND);
  }
  fill(cs[(int)random(cs.length)], a);

  return ;
}


void hexaflake(float x, float y, float l) {

  if ( l < 2 ) {
    hexagon(x, y, l);
    return ;
  }

  hexaflake(x, y, l/3);
  for ( float t = 0; t < TWO_PI; t += TWO_PI/6 ) {
    hexaflake(x+2*l/3*cos(t), y+2*l/3*sin(t), l/3);
  }

  return ;
}


void hexagon(float x, float y, float l) {

  beginShape();
  for ( float t = 0; t < TWO_PI; t += TWO_PI/6 ) {
    vertex(x+l*cos(t), y+l*sin(t));
  }
  endShape(CLOSE);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("178.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
