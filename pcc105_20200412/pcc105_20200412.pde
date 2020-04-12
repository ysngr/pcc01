/* 105_20200412 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  noFill();
}


void draw() {
  background(0);
  for ( int i = 0; i < 200; i++ ) {
    drawCirclePart();
  }
}


void drawCirclePart() {

  float r, maxr, ts, te, dt;

  pushMatrix();
  translate(random(width), random(height));
  stroke(random(255), random(255), random(255), random(80, 120));

  ts = random(-PI, PI);
  te = random(-PI, PI);
  maxr = random(80, 300);
  for ( r = 0; r < maxr; r += random(5) ) {
    strokeWeight(random(3.0));
    arc(0, 0, r, r, ts, te, OPEN);
    dt = random(-PI/8, PI/16);
    ts += random(-PI/32, PI/32) + dt;
    te += random(-PI/32, PI/32) + dt;
  }
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("105.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
