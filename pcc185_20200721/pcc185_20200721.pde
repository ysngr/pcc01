/* 185_20200721 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(11, 22, 68);

  float w, h;
  for ( int i = 0; i < 40; i++ ) {
    w = random(width);
    h = random(height);
    pushMatrix();
    translate(w, h);
    rotate((int)random(0, 4)*HALF_PI);
    decsquare(0, 0, random(80, 280));
    popMatrix();
  }
}


void decsquare(float x, float y, float l) {

  final color[] cs = {
    color( 78, 103, 176), 
    color( 24,  68, 142), 
    color(233,  78, 102), 
    color(192, 133, 184), 
    color(222, 200,  36), 
    color(233,  84, 100)
  };

  noStroke();

  if ( random(5) < 1 ) {
    blendMode(BLEND);
    fill(11, 22, 68, 240);
    square(x, y, 2*l);
  } else {
    blendMode(ADD);
    fill(cs[(int)random(cs.length)], 2);
    for ( float r = l; r > 0; r -= random(0.6, 1.2) ) {
      square(x+random(-3, 3), y+random(-3, 3), 2*r);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("185.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
