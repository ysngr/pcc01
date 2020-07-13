/* 180_20200713 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(235, 230, 237);
  ambLights(30);
  flows();
}


void ambLights(int n) {

  final color[] cs = {
    color(235, 230, 237), 
    color(213, 206, 220), 
    color(178, 177, 187), 
    color(243, 174, 204), 
    color(200, 139, 169), 
    color(231, 214, 222), 
    color(114, 126, 154), 
    color(118, 102, 141), 
    color(185, 157, 185)
  };

  color c;

  noStroke();
  for ( int i = 0; i < n; i++ ) {
    c = cs[(int)random(cs.length)];
    fill(c, 225);
    circle(random(width), random(height), random(240, 480));
  }

  return ;
}


void flow(float w, float h, color c) {

  float x, y, t, ta, a, al;
  int n;

  x = w;
  y = h;
  ta = map(noise(x/width, y/height), 0, 1, 6, 14);
  a = random(1);
  al = random(120, 180);
  n = (int)random(30, 140);

  for ( int i = 0; i < n; i++ ) {
    strokeWeight(map(noise(x/width, y/height), 0, 1, 2.4, 4.2));
    stroke(c, al);
    point(x, y);
    t = ta * noise(x/width, y/height);
    x += a * cos(t);
    y += a * sin(t);
    a += random(0.02);
    al -= random(0.5, 2.0);
  }

  return ;
}


void flows() {

  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      if ( random(100) < 5 ) {
        flow(w, h, get(w, h));
      }
    }
  }


  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("180.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
