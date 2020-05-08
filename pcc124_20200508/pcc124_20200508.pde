/* 124_20200508 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(219, 211, 229);

  strokeWeight(12);

  for ( int i = 0; i < 22; i++ ) {
    if ( random(4) < 1 ) {
      stroke(249, 241, 236, 240);
      fill(189, 53, 41, 240);
      circle(random(width), random(height), random(120, 240));
    } else {
      stroke(161, 168, 156, 200);
      fill(65, 92, 126, 160);
      circle(random(width), random(height), random(200, 860));
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("124.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
