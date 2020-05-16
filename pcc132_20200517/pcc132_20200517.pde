/* 132_20200517 */

void setup() {
  size(1200, 780);
  noLoop();
  noStroke();
}


void draw() {
  background(188, 207, 213);

  final float dw = 5, dh = 25;
  final color[] cs = {
    color(  0,  98, 177), 
    color(  0,  59, 144), 
    color(  4,  34, 117), 
    color(252, 252, 250), 
    color(234, 238, 240), 
    color(132, 175, 201), 
    color( 83, 109, 154), 
    color(196, 193, 199)
  };

  float mh, t;

  for ( float h = 0; h < height; h += 1.35*dh ) {
    t = random(-PI, PI);
    fill(cs[(int)random(cs.length)]);
    for ( float w = 0; w < width; w += dw ) {
      mh = 0.8 * dh * cos(t);
      triangle(w, h, w, h+dh, w+dw, h+mh);
      t += random(PI / 16);
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("132.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
