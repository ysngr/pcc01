/* 116_20200503 */

void setup() {
  size(1000, 1000);
  noLoop();
  //blendMode(DIFFERENCE);
  blendMode(SCREEN);
}


void draw() {
  background(0);
  translate(width/2, height/2);

  float r, st, et, dt, rw, rh;

  for ( int i = 0; i < 50; i++ ) {
    r = random(420);
    st = random(-PI, PI);
    et = st + random(PI);
    dt = random(PI/28);
    rw = random(25, 60);
    rh = random(10, 20);
    if ( random(4) < 1 ) {
      //stroke(random(220, 255));
      stroke(random(255), random(255), random(255), 140);
      noFill();
    } else {
      noStroke();
      //fill(random(220, 255));
      fill(random(255), random(255), random(255), 140);
    }
    for ( float t = st; t < et; t += dt ) {
      pushMatrix();
      rotate(t);
      rect(r, 0, rw, rh);
      popMatrix();
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("116.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
