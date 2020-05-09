/* 20200514 wa */

void setup() {
  size(1150, 800);
  noLoop();
  noStroke();
}


void draw() {
  background(40);

  for ( int i = 0; i < 2; i++ ) {
    drawCotton(230, 230, 230);
  }
  drawCotton(120, 180, 200);
  for ( int i = 0; i < 2; i++ ) {
    drawCotton(230, 230, 230);
  }
  drawCotton(230, 200, 230);
  for ( int i = 0; i < 2; i++ ) {
    drawCotton(230, 230, 230);
  }
  drawCotton(230, 235, 140);
  for ( int i = 0; i < 2; i++ ) {
    drawCotton(230, 230, 230);
  }
}


void drawCotton(float red, float green, float blue) {

  final float R = 240;

  float r, t, d;

  pushMatrix();
  translate(random(width), random(height));

  for ( int i = 0; i < 2800; i++ ) {
    r = random(R);
    t = random(-PI, PI);
    d = random(40, 100);
    fill(red+random(-10, 10), green+random(-10, 10), blue+random(-10, 10), random(10, 20));
    circle(r*cos(t), r*sin(t), d);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("125.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
