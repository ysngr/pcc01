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
final float len = 38, dw = 3 * len, dh = sqrt(3)/2 * len;


void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(220, 209, 185);

  translate(width/2, height/2);
  rotate(PI/64);
  translate(-width/2, -height/2);

  int c = 0;
  for ( float h = -len; h < height+len; h += dh ) {
    for ( float w = getStartW(c); w < width+len; w += dw ) {
      setColor();
      if ( random(20) < 1 ) {
        if ( random(3) < 1 ) {
          dechexagon(w, h);
        } else {
          hexagon(w, h, 0.8*len);
        }
      } else {
        if ( random(4) < 1 ) {
          edgedHexaflake(w, h, len, 3);
        } else {
          hexaflake(w, h, len, 3);
        }
      }
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
  float il = 0.95 * l;

  hexaflake(x, y, l, n);

  strokeWeight(4);
  for ( float t = 0; t < TWO_PI; t += dt ) {
    if ( random(4) < 1 ) {
      stroke(cs[(int)random(cs.length)]);
      line(x+il*cos(t), y+il*sin(t), x+il*cos(t+dt), y+il*sin(t+dt));
    }
  }
  strokeWeight(1);

  return ;
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


void dechexagon(float x, float y) {

  color c = cs[(int)random(cs.length)];

  for ( float l = 0; l < 3*len; l++ ) {
    fill(c, 6);
    hexagon(x, y, l);
  }

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
