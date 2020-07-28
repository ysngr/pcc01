/* 198_20200729 */

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  background(254, 244, 244);

  final color[] cs = {
    color(240, 145, 153), 
    color(242, 160, 161), 
    color(239, 132, 104), 
    color(244, 165, 131), 
    color(242, 226, 196), 
    color(195, 144,  67), 
    color(134, 108,  70), 
    color(185,  64,  71)
  };

  for ( int i = 0; i < 60; i++ ) {
    blendMode(( random(20) < 1 )? SUBTRACT : BLEND);
    if ( random(10) < 3 ) {
      square(random(width), random(height), random(40, 180), cs[(int)random(cs.length)]);
    }
    decsquare(random(width), random(height), random(80, 280), cs[(int)random(cs.length)]);
  }
}


void decsquare(float sx, float sy, float sl, color c) {

  final float amp = 5.0;
  float x, y, l, dx, dy;

  x = sx;
  y = sy;
  l = sl;
  dx = amp * map(noise(sx/width), 0, 1, -1, 1);
  dy = amp * map(noise(sy/height), 0, 1, -1, 1);

  noStroke();
  fill(c, 10);

  while ( l > 0.8*sl ) {
    square(x+random(-1, 1), y+random(-1, 1), l);
    x += dx;
    y += dy;
    l -= random(1, 3);
  }

  return ;
}


void square(float cx, float cy, float l, color c) {

  noStroke();
  fill(c, 128);
  square(cx, cy, l);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("198.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
