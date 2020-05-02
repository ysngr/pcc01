/* 113_20200502 */

float[][] ps;

void setup() {
  size(1150, 800);
  noLoop();
  ps = new float[150][3];
}


void draw() {
  background(0);

  float d;

  initPoints();

  stroke(255, 60);
  for ( int i = 0; i < ps.length; i++ ) {
    if ( random(10) < 1 ) {
      blendMode(DIFFERENCE);
      fill(random(200, 255), random(60, 120), random(30, 60));
    } else {
      blendMode(ADD);
      fill(random(0, 80), random(120, 255), random(150, 220), 20);
    }
    circle(ps[i][0], ps[i][1], ps[i][2]);
  }

  blendMode(BLEND);
  strokeWeight(1.2);
  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = i+1; j < ps.length; j++ ) {
      d = dist(ps[i][0], ps[i][1], ps[j][0], ps[j][1]);
      if ( d < 240 ) {
        stroke(255, 70);
        line(ps[i][0], ps[i][1], ps[j][0], ps[j][1]);
      }
    }
  }
}


void initPoints() {

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i][0] = random(width);
    ps[i][1] = random(height);
    ps[i][2] = random(40, 480);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("113.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
