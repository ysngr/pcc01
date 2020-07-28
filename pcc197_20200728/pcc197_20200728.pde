/* 197_20200728 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 30; i++ ) {
    lattice(random(width), random(height));
    if ( random(2) < 1 ) {
      decircle(random(width), random(height), random(240, 320));
    }
  }
}


void lattice(float sx, float sy) {

  final float d = 100;
  float x, y, dx, dy;

  x = sx;
  y = sy;
  for ( int i = 0; i < 100; i++ ) {
    if ( i % 2 == 0 ) {
      dx = d * random(-1, 1);
      dy = 0;
    } else {
      dx = 0;
      dy = d * random(-1, 1);
    }
    cLine(x, y, x+dx, y+dy);
    x += dx;
    y += dy;
    if ( ! isInCanvas(x, y) ) {
      break;
    }
  }

  return ;
}


void cLine(float sx, float sy, float ex, float ey) {

  float x, y;
  float d = dist(sx, sy, ex, ey);
  float dx = (ex - sx) / d;
  float dy = (ey - sy) / d;

  strokeWeight(2);
  for ( x = sx, y = sy; dist(x, y, ex, ey) > 2; x += dx, y += dy ) {
    stroke(
      map(noise(x/width) , 0, 1, 0, 255), 
      map(noise(y/height), 0, 1, 0, 255), 
      map(noise(d/1000)  , 0, 1, 0, 255)
    );
    point(x, y);
  }

  noStroke();
  fill(
    map(noise(ex/width) , 0, 1, 0, 255), 
    map(noise(ey/height), 0, 1, 0, 255), 
    map(noise(d/1000)   , 0, 1, 0, 255)
  );
  circle(ex, ey, random(0.1, 0.3)*d);

  return ;
}


boolean isInCanvas(float x, float y) {
  return ( 0 < x && x < width && 0 < y && y < height )? true : false;
}


void decircle(float x, float y, float l) {

  noStroke();
  fill(240, 2);

  for ( float r = l; r > 0; r -= random(1, 2) ) {
    circle(x+random(-1, 1), y+random(-1, 1), 2*r);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("197.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
