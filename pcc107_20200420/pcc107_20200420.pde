/* 107_20200420 */

void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(0.8);
  stroke(30, 20);
  noFill();
}


void draw() {
  background(240);
  translate(width/2, height/2);

  float w, h;

  w = 400;
  h = 400;
  for ( int i = 0; i < 1500; i++ ) {
    ellipse(0, 0, w, h);
    w += random(-1, 1) * noise(w) * 8;
    h += random(-1, 1) * noise(h) * 8;
    if ( random(100) < 5 ) {
      rotate(PI/128);
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("107.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
