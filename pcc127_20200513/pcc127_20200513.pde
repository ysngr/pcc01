/* 127_20200513 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(50);
  translate(width/2, height/2);

  final float R = 270.0;

  float r;

  strokeWeight(1.5);
  stroke(255, 100);
  noFill();
  r = 0.9 * R;
  for ( int i = 0; i < 10; i++ ) {
    circle(0, 0, 2*r);
    r += random(2, 10);
  }

  for ( float t = 0; t < 2*TWO_PI; t += PI/7 ) {
    strokeWeight(random(1.0, 2.2));
    stroke(random(255), random(255), random(255), random(100, 200));
    r = random(R, 1.2*R);
    lineCircle(r*cos(t), r*sin(t), random(50, 320));
  }
}


void lineCircle(float x, float y, float d) {

  noiseSeed((long)random(1000));

  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));

  float r = d / 2;
  for ( float t = 0; t < PI; t += map(noise(t), 0, PI, PI/256, PI/64) ) {
    line(r*cos(t), r*sin(t), r*cos(-t), r*sin(-t));
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("127.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
