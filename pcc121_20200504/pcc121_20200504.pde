/* 121_20200504 */

float[][] hs;


void setup() {
  size(1000, 1000);
  noLoop();
  hs = new float[16][2];
}


void draw() {
  background(200, 50, 50);

  color c;
  float c1x, c1y, c2x, c2y;

  for ( int i = 0; i < hs.length; i++ ) {
    hs[i][0] = random(width);
    hs[i][1] = random(height);
  }

  c = color(0, 220, 180);

  noFill();
  for ( int i = 0; i < hs.length; i++ ) {
    if( random(10) < 3 ){
      blendMode(BLEND);
    }else{
      blendMode(DIFFERENCE);
    }
    c1x = random(width);
    c1y = random(height);
    c2x = random(width);
    c2y = random(height);
    for ( int j = i+1; j < hs.length; j++ ) {
      for ( int k = 0; k < 15; k++ ) {
        strokeWeight(random(1.0, 4.0));
        stroke(c, 200);
        bezier(hs[i][0], hs[i][1], c1x, c1y, c2x, c2y, hs[j][0], hs[j][1]);
        c1x += random(-10, 10);
        c1y += random(-10, 10);
        c2x += random(-10, 10);
        c2y += random(-10, 10);
      }
    }
  }

  noStroke();
  fill(c);
  for ( int i = 0; i < hs.length; i++ ) {
     if( random(10) < 3 ){
      blendMode(SUBTRACT);
    }else{
      blendMode(DIFFERENCE);
    }
    for ( int j = 0; j < 20; j++ ) {
      circle(hs[i][0]+random(-40, 40), hs[i][1]+random(-40, 40), random(120, 240));
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("121.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
