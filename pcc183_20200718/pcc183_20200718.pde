/* 183_20200718 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(40);
  back();
  for ( int i = 0; i < 10; i++ ) {
    sparkler(random(width), random(height));
  }
}


void back() {

  blendMode(BLEND);
  strokeWeight(1);

  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      if ( random(20) < 1 ) {
        stroke(65, 80, 140, 240);
        point(w, h);
      }
    }
  }

  return ;
}


void sparkler(float x, float y) {

  blendMode(ADD);

  decCircle(x, y, random(26, 32));

  pushMatrix();
  translate(x, y);
  for ( float t = -HALF_PI; t < 3*HALF_PI; t += random(PI/32, PI/16) ) {
    rotate(t);
    strokeWeight(2);
    stroke(random(220, 240), random(100, 150), random(20, 50), 40);
    noFill();
    bfire(random(20, 80), 0, 0, (int)random(140, 260));
    rotate(-t);
  }
  popMatrix();

  return ;
}


void decCircle(float x, float y, float diag) {

  noStroke();
  fill(random(200, 240), random(120, 140), random(30, 40), 17);

  for ( float d = diag; d > 0; d-- ) {
    circle(x, y, d);
  }

  return ;
}


void bfire(float x, float y, float dy, int n) {

  if ( n <= 0 || random(100) < 1 ) {
    return ;
  }

  point(x, y);
  bfire(x+random(1), y+dy, dy, n-1);

  if ( random(100) < 1 ) {
    bfire(x, y, random(-1, 1), n-1);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("183.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
