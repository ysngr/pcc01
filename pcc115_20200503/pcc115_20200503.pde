/* 115_20200503 */

void setup() {
  size(1100, 620);
  noLoop();
}


void draw() {
  background(80);
  translate(0, height/2);

  float[] hs = new float[250];
  float a, t;

  blendMode(SCREEN);
  strokeWeight(2);
  for ( int i = 0; i < 10; i++ ) {
    for ( int j = 0; j < hs.length; j++ ) {
      hs[j] = 20 * noise(j) + random(-height/4, height/4);
    }
    stroke(random(255), random(255), random(255));
    for ( int j = 0; j < 100; j++ ) {
      for ( int k = 0; k < hs.length; k++ ) {
        point(k*width/hs.length, hs[k]);
        hs[k] += random(-1, 1) * noise(hs[k]) * 20;
      }
    }
  }

  blendMode(SUBTRACT);
  strokeWeight(5.0);
  for ( int i = 0; i < 30; i++ ) {
    a = 0.75 * random(height/2);
    t = 0;
    stroke(random(255), random(255), random(255), 120);
    for ( float w = 0; w <= width; w++ ) {
      point(w, a*cos(t));
      t += PI / 128;
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("115.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
