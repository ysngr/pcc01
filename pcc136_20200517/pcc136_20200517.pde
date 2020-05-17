/* 136_20200517 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(158, 181, 210);

  for ( int i = 0; i < 15; i++ ) {
    arrangeFlower(random(width), random(height), random(180, 700));
  }
}


void arrangeFlower(float x, float y, float l) {

  final color[] cs = {
    color(  0, 132, 168), 
    color( 56, 158, 169), 
    color(235, 239, 244), 
    color(243, 236, 227), 
    color(240, 244, 228), 
    color(247, 244, 240), 
    color( 72, 120, 127), 
    color(184, 203, 191)
  };

  int n;
  float r, s = random(1000);

  pushMatrix();
  translate(x, y);
  stroke(cs[(int)random(cs.length)], random(30, 80));
  n = (int)random(3, 8);
  for ( float t = 0; t < n*TWO_PI; t += PI/256 ) {
    r = l/2 * noise(s);
    line(0, 0, r*cos(t), r*sin(t));
    s += 0.03;
  }
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("136.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
