/* 124_20200508 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(219, 211, 229);

  strokeWeight(12);

  for ( int i = 0; i < 18; i++ ) {
    if ( i == 15 ) {
      stroke(249, 241, 236);
      fill(189, 53, 41);
    } else {
      stroke(161, 168, 156);
      fill(65, 92, 126);
    }
    circle(random(width), random(height), random(120, 400));
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
