/* 111_20200502 */

float[][] rps;
float[][] cps;


void setup() {
  size(1200, 780);
  noLoop();
  rps = new float[9][3];
  cps = new float[380][2];
}


void draw() {
  background(128);

  float x, y, r;

  for ( int i = 0; i < rps.length; i++ ) {
    rps[i][0] = random(width);
    rps[i][1] = random(height);
    rps[i][2] = random(50, 125);
    strokeWeight(10);
    stroke(240);
    fill(random(255), random(255), random(255));
    circle(rps[i][0], rps[i][1], rps[i][2]);
  }

  for ( int i = 0; i < cps.length; i++ ) {
    do {
      x = random(width);
      y = random(height);
      r = random(10, 40);
    } while ( ! isFar(x, y) );
    strokeWeight(1.0);
    stroke(255);
    fill(random(255), random(255), random(255), random(100, 200));
    circle(x, y, r);
    cps[i][0] = x;
    cps[i][1] = y;
    for ( int j = 0; j < i; j++ ) {
      if ( dist(cps[i][0], cps[i][1], cps[j][0], cps[j][1]) < 100 ) {
        strokeWeight(random(0.8, 1.5));
        stroke(random(200, 255), random(100, 200));
        line(cps[i][0], cps[i][1], cps[j][0], cps[j][1]);
      }
    }
  }
}


boolean isFar(float x, float y) {

  for ( int i = 0; i < rps.length; i++ ) {
    if ( dist(rps[i][0], rps[i][1], x, y) < rps[i][2] ) {
      return false;
    }
  }

  return true;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("111.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
