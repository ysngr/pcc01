/* 178_20200708 */

final float len = 32, dw = 3 * len, dh = sqrt(3)/2 * len;

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  Background();

  translate(width/2, height/2);
  rotate(PI/64);
  translate(-width/2, -height/2);

  int c = 0;
  for ( float h = -len; h < height+len; h += dh ) {
    for ( float w = getStartW(c); w < width+len; w += dw ) {
      setColor();
      hexaflake(w, h, len, 3);
    }
    c++;
  }
}


void Background() {

  background(255);

  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      stroke(
        map(noise(w/200, h/300), 0, 1, 190, 250), 
        map(noise(w/400, h/300), 0, 1, 179, 239), 
        map(noise(w/400, h/200), 0, 1, 155, 215)
      );
      point(w, h);
    }
  }

  return ;
}


float getStartW(int c) {
  return (c % 2 == 0)? -len : 0.5*len;
}


void setColor() {

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

  noStroke();
  fill(cs[(int)random(cs.length)]);

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



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("178.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
