/* 144_20200521 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(235, 230, 237);
  for ( int i = 0; i < 32; i++ ) {
    drawCube(random(width), random(height), random(10, 140));
  }
}


void drawCube(float x, float y, float l) {

  float dl;

  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));

  noStroke();
  fill(235, 230, 237);
  beginShape();
  vertex(0, 0);
  vertex(l*cos(-PI/6), l*sin(-PI/6));
  vertex(0, -l);
  vertex(l*cos(-5*PI/6), l*sin(-5*PI/6));
  endShape(CLOSE);

  noStroke();
  fill(selectColor(), random(80, 180));
  beginShape();
  vertex(0, 0);
  vertex(l*cos(-PI/6), l*sin(-PI/6));
  vertex(0, -l);
  vertex(l*cos(-5*PI/6), l*sin(-5*PI/6));
  endShape(CLOSE);

  noStroke();
  fill(235, 230, 237);
  beginShape();
  vertex(0, 0);
  vertex(l*cos(-PI/6), l*sin(-PI/6));
  vertex(l*cos(-PI/6), l*sin(-PI/6)+l);
  vertex(0, l);
  vertex(l*cos(-5*PI/6), l*sin(-5*PI/6)+l);
  vertex(l*cos(-5*PI/6), l*sin(-5*PI/6));
  endShape(CLOSE);

  strokeWeight(random(1.2, 3.2));
  stroke(selectColor());
  dl = random(0.01, 0.08) * l;
  for ( float w = 0; w <= l; w += dl ) {
    line(w*cos(-PI/6), w*sin(-PI/6), w*cos(-PI/6), w*sin(-PI/6)+l);
  }

  strokeWeight(random(1.2, 3.2));
  stroke(selectColor());
  dl = random(0.01, 0.08) * l;
  for ( float w = 0; w <= l; w += dl ) {
    line(w*cos(-5*PI/6), w*sin(-5*PI/6), w*cos(-5*PI/6), w*sin(-5*PI/6)+l);
  }

  popMatrix();

  return ;
}


color selectColor() {

  final color[] cs = {
    color(213, 206, 220), 
    color(178, 177, 187), 
    color(243, 174, 204), 
    color(200, 139, 169), 
    color(231, 214, 222), 
    color(114, 126, 154), 
    color(118, 102, 141), 
    color(185, 157, 185)
  };

  return cs[(int)random(cs.length)];
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("144.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
