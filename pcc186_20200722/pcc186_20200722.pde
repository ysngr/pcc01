/* 186_20200722 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  Background(251, 203, 103);
  holedAurora();
}


void Background(float r, float g, float b) {

  background(100);

  noiseSeed((long)random(9999));

  strokeWeight(1);
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      stroke(
        map(noise(w/120, h/120), 0, 1, r-30, r+30), 
        map(noise(w/120, h/120), 0, 1, g-30, g+30), 
        map(noise(w/120, h/120), 0, 1, b-30, b+30)
      );
      point(w, h);
    }
  }

  return ;
}


void holedAurora() {

  PVector[] hs = getHoleParams();

  noiseSeed((long)random(9999));

  strokeWeight(1);
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      if ( isPoint(w, h, hs) ) {
        stroke(
          map(noise(w/400, h/250), 0, 1,  80, 220), 
          map(noise(w/350, h/300), 0, 1, 100, 220), 
          map(noise(w/280, h/320), 0, 1, 150, 255)
        );
        point(w, h);
      }
    }
  }

  return ;
}


PVector[] getHoleParams() {

  PVector[] hs = new PVector[15];

  for ( int i = 0; i < hs.length; i++ ) {
    hs[i] = new PVector(random(width), random(height), random(20, 240));
  }

  return hs;
}


boolean isPoint(float x, float y, PVector[] hs) {

  int n = 0;

  for ( int i = 0; i < hs.length; i++ ) {
    if ( dist(x, y, hs[i].x, hs[i].y) < hs[i].z ) {
      n++;
    }
  }

  return ( n % 2 == 0 )? true : false;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("186.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
