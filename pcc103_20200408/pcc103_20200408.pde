/* 103_20200408 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(DARKEST);
  noFill();
}


void draw() {
  background(230);

  float x, y, r;
  boolean isReset;
  float[][] ps = new float[20][3];

  for ( int i = 0; i < ps.length; i++ ) {
    x = random(width);
    y = random(height);
    r = random(80, 160);
    isReset = false;
    
    for ( int j = 0; j < i; j++ ) {
      if ( dist(x, y, ps[j][0], ps[j][1]) < r + ps[j][2] ) {
        isReset = true;
        break;
      }
    }
    if ( isReset ) {
      i--;
      continue;
    }
    
    mark(x, y, r);
    ps[i][0] = x;
    ps[i][1] = y;
    ps[i][2] = r;
  }
}


void mark(float x, float y, float rmax) {

  pushMatrix();
  translate(x, y);
  stroke(random(0, 50));

  for ( float r = 0; r < rmax; r += random(-5, 25) ) {
    strokeWeight(random(2.5, 6.0));
    beginShape();
    for ( float t = 0; t < TWO_PI; t += random(PI/8) ) {
      vertex(random(0.55*r, 1.2*r)*cos(t), random(0.55*r, 1.2*r)*sin(t));
    }
    endShape(CLOSE);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("103.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
