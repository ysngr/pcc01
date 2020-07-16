/* 182_20200716 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(235, 240, 243);
  translate(width/2, height/2);
  rotate(PI/64);
  translate(-width/2, -height/2);

  final color[] cs = {
    color(123, 159, 211), 
    color(143, 181, 224), 
    color(187, 208, 236), 
    color(222, 231, 245), 
    color(204, 224, 244), 
    color( 74, 148, 191), 
    color( 37,  92, 142)
  };
  final float d = 50, dw = 2*sqrt(3)*d, dh = d;

  int c = 0;
  for ( float h = 0; h < height+d; h += dh ) {
    for ( float w = (c++%2 == 0)? 0 : dw/2; w < width+d; w += dw ) {
      if ( random(100) < 1 ) {
        fill(237, 111, 0);
      } else {
        fill(cs[(int)random(cs.length)]);
      }
      kochsnowflake(w, h, d);
    }
  }
}


void kochsnowflake(float x, float y, float l) {

  noStroke();

  pushMatrix();
  translate(x, y);
  triangle(l*cos(HALF_PI), l*sin(HALF_PI), l*cos(7*PI/6), l*sin(7*PI/6), l*cos(11*PI/6), l*sin(11*PI/6));
  kochcurve(l*cos(7*PI/6), l*sin(7*PI/6), l*cos(HALF_PI), l*sin(HALF_PI));
  kochcurve(l*cos(11*PI/6), l*sin(11*PI/6), l*cos(7*PI/6), l*sin(7*PI/6));
  kochcurve(l*cos(HALF_PI), l*sin(HALF_PI), l*cos(11*PI/6), l*sin(11*PI/6));
  popMatrix();

  return ;
}


void kochcurve(float lx, float ly, float rx, float ry) {

  float l = dist(lx, ly, rx, ry);
  float dx = (rx - lx) / 3;
  float dy = (ry - ly) / 3;
  float cx = (lx + rx) / 2;
  float cy = (ly + ry) / 2;

  triangle(lx+dx, ly+dy, cx-sqrt(3)/2*dy, cy+sqrt(3)/2*dx, rx-dx, ry-dy);

  if ( l > 1 ) {
    kochcurve(lx             , ly             , lx+dx          , ly+dy          );
    kochcurve(lx+dx          , ly+dy          , cx-sqrt(3)/2*dy, cy+sqrt(3)/2*dx);
    kochcurve(cx-sqrt(3)/2*dy, cy+sqrt(3)/2*dx, rx-dx          , ry-dy          );
    kochcurve(rx-dx          , ry-dy          , rx             , ry             );
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("182.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
