/* 193_20200725 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeWeight(2.4);
}


void draw() {
  background(40);
  for ( int i = 0; i < 18; i++ ) {
    firework();
  }
}


void firework() {

  int pt;
  Point[] ps;

  pushMatrix();
  translate(random(width), random(height));

  ps = initPoints((int)random(100, 220));
  pt = (int)random(60, 180);
  for ( int i = 0; i < pt; i++ ) {
    plot(ps);
    update(ps);
  }

  popMatrix();

  return ;
}


Point[] initPoints(int n) {

  final color[] cs = {
    color(153,  47,  60), 
    color(234,  77,  21), 
    color(241, 142,  29), 
    color(248, 182,  52), 
    color(253, 212, 110), 
    color(219,  84,  45), 
    color(168,  69,  54), 
    color(242, 216,  80), 
    color(105,  55, 165)
  };

  Point[] ps = new Point[n];
  float v = random(2.5, 5.0);
  float dt = TWO_PI / (n/2.3);
  float ddt = PI / 1024;
  color c = cs[(int)random(cs.length)];

  float r = 0;
  float t = 0;
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new Point(random(-r, r), random(-r, r), v*cos(t), v*sin(t), c);
    if ( (t += dt + random(ddt)) > TWO_PI ) {
      t %= TWO_PI;
      r = random(v, 2*v);
    }
  }

  return ps;
}


void plot(Point[] ps) {

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i].plot();
  }

  return ;
}


void update(Point[] ps) {

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i].update();
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("193.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
