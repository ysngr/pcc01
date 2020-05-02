/* 118_20200503 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  noFill();
}


void draw() {
  background(0);

  for ( int i = 0; i < 25; i++ ) {
    ring();
  }
}


void ring() {
  
  float w, h, st, et;

  pushMatrix();
  translate(random(width), random(height));
  
  strokeWeight(random(1.0, 3.0));
  stroke(random(255), random(255), random(255), 15);

  w = random(10, 800);
  h = w;
  st = random(-PI, PI);
  et = st + random(TWO_PI);
  for ( int i = 0; i < 1800; i++ ) {
    arc(0, 0, w, h, st, et);
    w += sgn() * 8 * noise(w);
    h += sgn() * 8 * noise(h);
    st += sgn() * PI/32 * noise(st);
    et += sgn() * PI/32 * noise(et);
  }

  popMatrix();

  return ;
}


float sgn(){
  return (( random(2) < 1 )? 1.0 : -1.0);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("118.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
