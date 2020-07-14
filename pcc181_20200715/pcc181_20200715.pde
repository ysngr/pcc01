/* 181_20200715 */

final color SHADOWCOL = color(30, 30, 30, 20);
final float maxd = 50;


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);

  final color[] cs = {
    color(233,  84, 100), 
    color(244, 173, 163), 
    color(247, 185, 119), 
    color(198, 104, 150), 
    color(183,  40,  45), 
    color(201, 153,  98), 
    color(253, 237, 223), 
    color(162, 215, 221), 
    color( 92, 173,  75)
  };

  float x, y, d;
  color c;

  for ( int i = 0; i < 100; i++ ) {
    x = random(width);
    y = random(height);
    d = random(40, 400);
    c = cs[(int)random(cs.length)];
    if ( random(2) < 1 ) {
      shadowCircle(x, y, d, c);
      flowCircle(x, y, d/2);
    } else {
      shadowSquare(x, y, d, c);
      flowSquare(x, y, d);
    }
  }
}


void shadowCircle(float x, float y, float d, color c) {

  noStroke();
  fill(SHADOWCOL);
  circle(
    x + maxd*map(noise(x/width), 0, 1, -1, 1), 
    y + maxd*map(noise(y/height), 0, 1, -1, 1), 
    d
  );

  fill(c);
  circle(x, y, d);

  return ;
}


void shadowSquare(float x, float y, float l, color c) {

  noStroke();
  fill(SHADOWCOL);
  square(
    x + maxd*map(noise(x/width), 0, 1, -1, 1), 
    y + maxd*map(noise(y/height), 0, 1, -1, 1), 
    l
  );

  fill(c);
  square(x, y, l);

  return ;
}


void flowCircle(float x, float y, float rad) {

  float r, t;

  for ( int i = 0; i < 60; i++ ) {
    r = random(rad);
    t = random(-PI, PI);
    flow(x+r*cos(t), y+r*sin(t));
  }

  return ;
}


void flowSquare(float x, float y, float l) {

  for ( int i = 0; i < 60; i++ ) {
    flow(x+random(l), y+random(l));
  }

  return ;
}


void flow(float w, float h) {

  float x, y, t, ta, a, al;
  int n;
  color c;

  x = w;
  y = h;
  ta = map(noise(w/width, h/height), 0, 1, 8, 12);
  a = random(3);
  al = random(80, 160);
  n = (int)random(80, 180);
  c = get((int)w, (int)h);

  for ( int j = 0; j < n; j++ ) {
    strokeWeight(map(noise(x/width, y/height), 0, 1, 2.4, 3.2));
    stroke(c, al);
    point(x, y);
    t = ta * noise(x/width, y/height);
    x += a * cos(t);
    y += a * sin(t);
    a += random(0.02);
    al--;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("181.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
