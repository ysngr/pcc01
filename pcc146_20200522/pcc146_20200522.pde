/* 146_20200522 */

void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(1.2);
}


void draw() {
  background(227, 233, 242);

  final float L = 100, DL = L / 10;

  float a = 1;
  float b = 1;

  for ( float h = 0; h < height; h += L ) {
    for ( float w = 0; w < width; w += L ) {
      lissajousCurve(w+DL, h+DL, 4*DL, a, b);
      a += random(0.001, 0.225);
      b += random(0.001, 0.225);
    }
  }
}


void lissajousCurve(float x, float y, float l, float a, float b) {

  pushMatrix();
  translate(x+l, y+l);

  selectColor();

  for ( float t = 0; t < TWO_PI; t += PI/2048 ) {
    point(l*cos(a*t), l*sin(b*t));
  }

  popMatrix();

  return ;
}


void selectColor() {

  final color[] cs = {
    color( 98, 144, 177), 
    color(158, 200, 209), 
    color( 96, 154, 161), 
    color(112, 123, 153), 
    color(153, 166, 177)
  };

  stroke(cs[(int)random(cs.length)]);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("146.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
