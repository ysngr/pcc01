/* 133_20200517 */

void setup() {
  size(1150, 800);
  background(73, 49, 60);
  noLoop();
}


void draw() {
  final color sc = color(248, 246, 222);
  final color cc = color(235, 92, 50);

  for ( float w = -680; w < width; w += 120 ) {
    strokeWeight(18);
    stroke(sc);
    line(w, 0, w+680, height);
    strokeWeight(10);
    stroke(cc);
    line(w, 0, w+680, height);
  }
  for ( float h = 20; h < height; h += 125 ) {
    strokeWeight(18);
    stroke(sc);
    line(0, h, width, h);
    strokeWeight(10);
    stroke(cc);
    line(0, h, width, h);
  }
  for ( float w = width+620; w > 0; w -= 120 ) {
    strokeWeight(18);
    stroke(sc);
    line(w, 0, w-680, height);
    strokeWeight(10);
    stroke(cc);
    line(w, 0, w-680, height);
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("133.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
