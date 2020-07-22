/* 189_20200723 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(252, 252, 250);

  final color[] fcs = {
    color(  0,  98, 177), 
    color(  0,  59, 144), 
    color(  4,  34, 117), 
    color( 83, 109, 154)
  };
  final color[] scs = {
    color(234, 238, 240), 
    color(188, 207, 213), 
    color(132, 175, 210), 
    color(196, 193, 199)
  };

  for ( int i = 0; i < 30; i++ ) {
    strokeWeight(random(4, 8));
    stroke(scs[(int)random(scs.length)]);
    fill(fcs[(int)random(fcs.length)], random(140, 220));
    circle(random(width), random(height), random(100, 400));
  }

  float w, h, d;
  noStroke();
  fill(252, 252, 250, 4);
  for ( int i = 0; i < 15; i++ ) {
    w = random(width);
    h = random(height);
    d = random(240, 280);
    while ( d > 0 ) {
      circle(w+random(-1, 1), h+random(-1, 1), d);
      d -= random(1, 3);
    }
  }

  for ( int i = 0; i < 12; i++ ) {
    strokeWeight(random(4, 8));
    stroke(scs[(int)random(scs.length)]);
    fill(fcs[(int)random(fcs.length)], random(140, 220));
    circle(random(width), random(height), random(100, 400));
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("189.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
