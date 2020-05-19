/* 141_20200520 */

void setup() {
  size(1150, 800);
  noLoop();
  noStroke();
}


void draw() {
  background(202, 204, 210);
  for ( int i = 0; i < 24; i++ ) {
    putBall();
  }
}


void selectColor() {

  color f;

  switch( (int)random(5) ) {
    case 0 : f = color(131, 154,  92); break;
    case 1 : f = color( 75,  45,  22); break;
    case 2 : f = color( 49, 103,  63); break;
    case 3 : f = color(199, 177, 131); break;
    case 4 : f = color(114, 175,  45); break;
    default : f = color(183, 203,  60); break;
  }

  fill(f, 10);

  return ;
}


void putBall() {

  float cx, cy, cl, x, y, l;
  int n;

  selectColor();

  cx = random(width);
  cy = random(height);
  cl = random(60, 180);
  x = cx;
  y = cy;
  l = cl;
  n = (int)map(l, 80, 600, 20, 120);

  for ( int i = 0; i < n; i++ ) {
    x += random(-8, 8);
    y += random(-8, 8);
    l = cl - dist(cx, cy, x, y);
    circle(x, y, 2*l);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("141.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
