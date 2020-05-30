/* 154_20200531 */

ArrayList<float[]> ps;

void setup() {
  size(1150, 800);
  noLoop();
  strokeCap(PROJECT);
  noFill();
}


void draw() {
  background(237, 226, 216);

  ps = new ArrayList<float[]>();
  recDiv(0.1*width, 0.1*height, 0.8*width, 0.8*height);

  translate(width/2, height/2);
  rotate(PI/26);
  translate(-width/2, -height/2);

  for ( int i = 0; i < ps.size(); i++ ) {
    decorateArea(ps.get(i));
  }
}


void recDiv(float x, float y, float w, float h) {

  if ( w < 500 && h < 500 ) {
    if ( w < 60 || h < 60 || random(10) < 2 ) {
      float[] np = {x, y, w, h};
      ps.add(np);
      return ;
    }
  }

  float wr = random(0.35, 0.65);
  float hr = random(0.35, 0.65);

  recDiv(x     , y     , w*wr    , h*hr    );
  recDiv(x+w*wr, y     , w*(1-wr), h*hr    );
  recDiv(x     , y+h*hr, w*wr    , h*(1-hr));
  recDiv(x+w*wr, y+h*hr, w*(1-wr), h*(1-hr));

  return ;
}


void decorateArea(float[] p) {

  switch( (int)random(6) ) {
  case 0 : 
    selectColor();
    vertLines(p);
    break;
  case 1 : 
    selectColor();
    horzLines(p);
    break;
  case 2 :
    innerCircle(p, selectColor());
    break;
  case 3 :
    selectColor();
    wave(p);
    break;
  case 4 :
    decRect(p, selectColor());
    break;
  case 5 :
    selectColor();
    sputter(p);
    break;
  }

  return ;
}


void vertLines(float[] p) {

  float dw = random(0.02, 0.08) * p[2];

  strokeWeight(random(1.2, 3.2));
  for ( float w = p[0]; w < p[0]+p[2]; w += dw ) {
    line(w, p[1], w, p[1]+p[3]);
  }

  return ;
}


void horzLines(float[] p) {

  float dh = random(0.02, 0.08) * p[3];

  strokeWeight(random(1.2, 3.2));
  for ( float h = p[1]; h < p[1]+p[3]; h += dh ) {
    line(p[0], h, p[0]+p[2], h);
  }

  return ;
}


void innerCircle(float[] p, color c) {

  strokeWeight(2.0);
  noFill();

  float a = random(50);
  for ( float r = min(p[2], p[3])/2; r > 0; r-- ) {
    stroke(c, a);
    circle(p[0]+p[2]/2, p[1]+p[3]/2, 2*r);
    a++;
  }

  return ;
}


void wave(float[] p) {

  float dw = random(0.1, 0.5);
  float dt = random(PI/32, PI/8);
  float r = random(p[3]/2);
  float t = random(-PI, PI);

  strokeWeight(random(0.8, 2.2));
  for ( float w = p[0]; w < p[0]+p[2]; w += dw ) {
    point(w, p[1]+p[3]/2+r*cos(t));
    t += dt;
  }

  return ;
}


void decRect(float[] p, color c) {

  int div = (int)random(10, 30);
  float dw = p[2] / div;
  float dh = p[3] / div;
  float a = random(200);

  strokeWeight(random(0.8, 2.2));
  for ( float w = 0, h = 0; w < p[2]; w += dw, h += dh ) {
    stroke(c, a--);
    rect(p[0]+p[2]/2-w/2, p[1]+p[3]/2-h/2, w, h);
  }

  return ;
}


void sputter(float[] p) {

  int n = (int)random(100, 400);
  for ( int i = 0; i < n; i++ ) {
    strokeWeight(random(0.8, 2.2));
    point(p[0]+random(p[2]), p[1]+random(p[3]));
  }

  return ;
}


color selectColor() {

  final color[] cs = {
    color(218, 205, 139), 
    color(174, 154, 107), 
    color( 92, 118, 100), 
    color( 92, 118, 100), 
    color(  0, 126, 118), 
    color(248, 246, 222), 
    color(230, 224, 196), 
    color( 85, 125,  62), 
    color( 73,  49,  60), 
    color(235,  92,  50)
  };

  int sidx = (int)random(cs.length);
  stroke(cs[sidx]);

  return cs[sidx];
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("154.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
