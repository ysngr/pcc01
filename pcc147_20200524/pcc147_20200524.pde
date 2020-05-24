/* 147_20200524 */

void setup() {
  size(1000, 1000);
  noLoop();
  strokeCap(PROJECT);
  ellipseMode(CENTER);
}


void draw() {
  background(249, 248, 249);
  for ( int i = 0; i < 22; i++ ) {
    penroseTriangle(random(width), random(height), random(10, 80), random(10, 60));
  }
}


void penroseTriangle(float cx, float cy, float r, float s) {

  pushMatrix();
  translate(cx, cy);
  rotate(random(-PI, PI));

  strokeWeight(random(2.0, 3.2));
  stroke(105, 108, 117);

  fill(231, 213, 88);
  beginShape();
  vertex(0, -r);
  vertex(s/2, -r-sqrt(3)*s/2);
  vertex(sqrt(3)*r/2+2*s, r/2+sqrt(3)*s);
  vertex(-sqrt(3)*r/2-2*s, r/2+sqrt(3)*s);
  vertex(-sqrt(3)*r/2-5*s/2, r/2+sqrt(3)*s/2);
  vertex(sqrt(3)*r/2+s/2, r/2+sqrt(3)*s/2);
  endShape(CLOSE);

  fill(227, 205, 186);
  beginShape();
  vertex(sqrt(3)*r/2, r/2);
  vertex(sqrt(3)*r/2+s/2, r/2+sqrt(3)*s/2);
  vertex(-sqrt(3)*r/2-5*s/2, r/2+sqrt(3)*s/2);
  vertex(-s/2, -r-3*sqrt(3)*s/2);
  vertex(s/2, -r-3*sqrt(3)*s/2);
  vertex(-sqrt(3)*r/2-s, r/2);
  endShape(CLOSE);

  fill(183, 191, 142);
  beginShape();
  vertex(s/2, -r-3*sqrt(3)*s/2);
  vertex(sqrt(3)*r/2+5*s/2, r/2+sqrt(3)*s/2);
  vertex(sqrt(3)*r/2+2*s, r/2+sqrt(3)*s);
  vertex(s/2, -r-sqrt(3)*s/2);
  vertex(-sqrt(3)*r/2, r/2);
  vertex(-sqrt(3)*r/2-s, r/2);
  endShape(CLOSE);

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("147.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
