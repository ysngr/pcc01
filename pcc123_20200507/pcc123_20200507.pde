/* 123_20200507 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
  rectMode(CENTER);
  strokeWeight(0.8);
  noFill();
}


void draw() {
  background(0);
  for ( int i = 0; i < 6; i++ ) {
    drawSpiral();
  }
}


void drawSpiral() {

  pushMatrix();
  translate(random(width), random(height));

  float r = 1;
  color c = ( random(10) < 1 )?
             color(random(200, 240), random(80, 120), random(0, 40)):
             color(random(30, 120), random(100, 200), random(40, 180));

  for ( float t = 0; t < 15*TWO_PI; t += random(PI/128) ) {
    if ( random(10) < 1 ) {
      rotate(random(PI/32));
    }
    stroke(c, 80);
    square(0, 0, r);
    r += 0.005*r*noise(r);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("123.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
