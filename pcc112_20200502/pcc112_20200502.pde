/* 112_20200502 */

void setup() {
  size(1250, 680);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);
  translate(0, height/2);

  float w, a, t, dt;

  for ( int i = 0; i < 45; i++ ) {
    strokeWeight(random(1.2, 2.8));
    stroke(random(255), random(255), random(255));
    a = random(0.8*height/2);
    t = 0;
    dt = random(PI/128, PI/32);
    for ( w = 0; w <= width; w ++ ) {
      point(w, a*cos(t));
      t = (t + dt) % TWO_PI;
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("112.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
