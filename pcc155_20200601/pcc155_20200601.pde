/* 155_20200601 */

void setup() {
  size(1150, 800);
  noLoop();
  noStroke();
}


void draw() {
  background(251, 250, 243);

  final float L = 160.0;
  final int MAXMOD = 50;

  float h, tl, nl;

  translate(width/2, height/2);
  rotate(PI/48);
  translate(-width/2, -height/2);

  h = random(-L, 0);
  tl = random(0.2, 1.0) * L;
  while ( h < height+L ) {
    nl = random(0.2, 1.0) * L;
    for ( float w = random(-L, 0); w < width+L; w += sqrt(3)*tl ) {
      new Sierpinski(w, h-tl, h+tl/2, (int)random(2, MAXMOD)).plot();
      new Sierpinski(w+sqrt(3)*tl/2, h+tl/2, h-tl, (int)random(2, MAXMOD)).plot();
    }
    h += tl/2 + nl;
    tl = nl;
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("155.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
