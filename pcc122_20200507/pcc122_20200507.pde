/* 122_20200507 */

void setup() {
  size(1000, 1000);
  noLoop();
  rectMode(CENTER);
  noFill();
}


void draw() {
  background(0);
  
  for ( int i = 0; i < 20; i++ ) {
    drawRecSq(random(width), random(height), random(100, 200), 0);
  }
  drawRecCir(random(width), random(height), random(600, 700), 0);
}


void drawRecSq(float x, float y, float l, int d) {

  blendMode(LIGHTEST);
  fill(random(255), random(255), random(255), random(100, 200));
  square(x, y, l);

  if ( d > 4 ) {
    return ;
  } else {
    drawRecSq(x-l/2, y-l/2, random(l/3, l/2), d+1);
    drawRecSq(x+l/2, y-l/2, random(l/3, l/2), d+1);
    drawRecSq(x-l/2, y+l/2, random(l/3, l/2), d+1);
    drawRecSq(x+l/2, y+l/2, random(l/3, l/2), d+1);
  }

  return ;
}


void drawRecCir(float x, float y, float r, int d) {

  blendMode(ADD);
  fill(random(255), random(255), random(255), random(180, 220));
  circle(x, y, r);

  if ( d > 4 ) {
    return ;
  } else {
    drawRecCir(x-r/2, y-r/2, random(r/3, r/2), d+1);
    drawRecCir(x+r/2, y-r/2, random(r/3, r/2), d+1);
    drawRecCir(x-r/2, y+r/2, random(r/3, r/2), d+1);
    drawRecCir(x+r/2, y+r/2, random(r/3, r/2), d+1);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("122.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
