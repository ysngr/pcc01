/* 120_20200504 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
  strokeWeight(2);
  noFill();
}


void draw() {
  background(30, 45, 70);

  float x, y, w, h, st, et, r, g, b;

  for ( int i = 0; i < 25; i++ ) {
    x = random(width);
    y = random(height);
    w = random(80, 780);
    h = w;
    st = random(HALF_PI);
    et = st + random(PI);
    r = random(255);
    g = random(255);
    b = random(255);
    for ( int j = 0; j < 1200; j++ ) {
      stroke(r, g, b, 40);
      arc(x, y, w, h, st, et);
      x += random(-2, 2);
      y += random(-2, 2);
      w += map(noise(w), 0, 1, -3, 4);
      h += map(noise(h), 0, 1, -3, 4);
      st += random(-PI/32, PI/32);
      et += random(-PI/32, PI/32);
      r += map(noise(r), 0, 1, -5, 5);
      g += map(noise(g), 0, 1, -5, 5);
      b += map(noise(b), 0, 1, -5, 5);
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("120.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
