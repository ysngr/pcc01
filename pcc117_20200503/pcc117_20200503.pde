/* 117_20200503 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(DIFFERENCE);
  rectMode(CENTER);
}


void draw() {
  background(240);
  translate(width/2, height/2);

  float r, t, dt, d;

  noStroke();
  for ( int i = 0; i < 6; i++ ) {
    r = random(680);
    dt = random(PI/32, PI/16);
    d = random(20, 200);
    if ( random(10) < 1 ) {
      fill(random(255), random(255), random(255), 200);
    } else {
      fill(random(200, 255));
    }
    for ( t = 0; t <= TWO_PI; t += dt ) {
      circle(r*cos(t), r*sin(t), d);
    }
  }

  noFill();
  for ( int i = 0; i < 10; i++ ) {
    strokeWeight(random(12, 20));
    dt = random(PI/32, PI/16);
    d = random(1000);
    stroke(random(200, 255));
    for ( t = 0; t < TWO_PI; t += dt ) {
      square(0, 0, d);
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("117.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
