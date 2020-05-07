/* 123_20200507 */

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
  noFill();
}


void draw() {
  background(230);
  for ( int i = 0; i < 25; i++ ) {
    drawSpiral();
  }
}


void drawSpiral() {

  pushMatrix();
  translate(random(width), random(height));

  color c = color(random(30, 120), random(100, 200), random(40, 180));
  float r = 1;

  for ( float t = 0; t < 20*TWO_PI; t += random(PI/128) ) {
    if ( random(10) < 1 ) {
      rotate(random(PI/32));
    }
    stroke(c, 1);
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
