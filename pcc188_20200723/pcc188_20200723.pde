/* 188_20200723 */

void setup() {
  size(1150, 800);
  noLoop();
  noiseSeed(8107);
}


void draw() {
  background(223, 224, 231);
  for ( float w = width/3; w < width; w++ ) {
    flow(w, height);
  }
  for ( float h = height/3; h < height; h++ ) {
    flow(width, h);
  }
  moon();
}


void flow(float x, float y) {

  float w, h, t, a;

  blendMode(BLEND);

  w = x;
  h = y;
  a = random(0.7, 1.0);

  while ( isInCanvas(w, h) ) {
    strokeWeight(map(noise(w/width, h/height), 0, 1, 1.0, 4.5));
    stroke(
      map(noise(w/300, h/500), 0, 1,  40, 200), 
      map(noise(w/400, h/300), 0, 1, 130, 240), 
      map(noise(w/200, h/400), 0, 1, 160, 255)
    );
    point(w, h);
    t = map(noise(w/500, h/400), 0, 1, -PI, PI);
    w -= a * cos(t);
    h -= a * sin(t);
  }

  return ;
}


boolean isInCanvas(float x, float y) {

  if ( x < 0 || width < x ) {
    return false;
  }
  if ( y < 0 || height < y ) {
    return false;
  }

  return true;
}


void moon() {

  blendMode(SUBTRACT);

  noStroke();
  fill(0, 172, 223);

  circle(random(width), random(height), random(400, 600));
  for ( int i = 0; i < 3; i++ ) {
    circle(random(width), random(height), random(80, 200));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("188.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
