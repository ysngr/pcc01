/* 178_20200708 */

final color[] cs = {
  color(240, 132,  74), 
  color(244, 164, 102), 
  color(238, 186, 107), 
  color(254, 228, 167), 
  color(223, 151, 112), 
  color(140, 110,  96), 
  color(140, 110,  96), 
  color( 92,  63,  42)
};
final float len = 32.5, dw = 3 * len, dh = sqrt(3)/2 * len;


void setup() {
  size(1000, 1000);
  noLoop();
  strokeCap(PROJECT);
}


void draw() {
  background(220, 209, 185);

  int c = 0;
  for ( float h = -len; h < height+len; h += dh ) {
    for ( float w = getStartW(c); w < width+len; w += dw ) {
      setColor();
      edgedHexaflake(w, h, len, 3);
    }
    c++;
  }
}


float getStartW(int c) {
  return (c % 2 == 0)? -len : 0.5*len;
}


void setColor() {

  noStroke();
  fill(cs[(int)random(cs.length)]);

  return ;
}


void edgedHexaflake(float x, float y, float l, int n) {

  final float dt = TWO_PI / 6;  
  float il = 0.98 * l;

  hexaflake(x, y, l, n);

  strokeWeight(2);
  for ( float t = PI; t <= TWO_PI-dt; t += dt ) {
    if ( isDiffColor(x, y, sqrt(3)*l, t+dt/2) ) {
      stroke(59, 252, 193, 200);
      line(x+il*cos(t), y+il*sin(t), x+il*cos(t+dt), y+il*sin(t+dt));
    }
  }
  strokeWeight(1);

  return ;
}


boolean isDiffColor(float x, float y, float l, float t) {

  color tc = get((int)x, (int)y);
  color nc = get((int)(x+l*cos(t)), (int)(y+l*sin(t)));

  return tc != nc;
}


void hexaflake(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    hexagon(x, y, l);
    return ;
  }

  hexaflake(x, y, l/3, n-1);
  for ( float t = 0; t < TWO_PI; t += TWO_PI/6 ) {
    hexaflake(x+2*l/3*cos(t), y+2*l/3*sin(t), l/3, n-1);
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
