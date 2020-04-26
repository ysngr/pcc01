/* 110_20200426 */

void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(2.0);
}


void draw() {

  float r, g, b;

  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      r = map(noise(r(w), r(h)), 0, 1, 120, 230);
      g = map(noise(r(w), r(h)), 0, 1, 20, 100);
      b = map(noise(r(w), r(h)), 0, 1, 80, 125);
      stroke(r, g, b, 230);
      point(w, h);
    }
  }
}


float r(float s) {
  return random(0.98*s, 1.02*s) / random(98, 100);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("110.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
