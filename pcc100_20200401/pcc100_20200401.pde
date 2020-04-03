/* 100_20200401 */

void setup() {
  size(1000, 1000);
  background(240);
  noLoop();
  noStroke();
}


void draw() {
  digHole(width/2, height/2, 450);
}


void digHole(float x, float y, float r) {

  final float DT = TWO_PI / 80;
  final float YRATIO = 0.85;

  int count;
  float rx, ry, it;

  count = 0;
  for ( rx = r; rx > 0.15*r; rx *= 0.88 ) {
    ry = rx * YRATIO;
    fill(240 - (240 - map(rx, 0.15*r, r, 0, 240)));
    ellipse(x, y, 2*rx, 2*ry);

    fill(0);
    it = ( count++ % 2 == 0 )? 0 : DT;
    for ( float t = it; t < it+TWO_PI; t += 2*DT ) {
      triangle(x, y+0.32*ry, x+rx*cos(t), y+ry*sin(t), x+rx*cos(t+DT), y+ry*sin(t+DT));
    }

    x += 0.035 * rx;
    y += 0.045 * rx;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("100.png");
    System.exit(0);
  }
}
