/* 149_20200526 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  final float dl = 32;
  int count = 0;
  for ( float h = 0; h < height+dl; h += 3*dl/2 ) {
    for ( float w = ( count++ % 2 == 0 )? 0 : sqrt(3)*dl/2; w < width+dl; w += sqrt(3)*dl ) {
      drawCube(w, h, dl);
    }
  }
}


void drawCube(float x, float y, float l) {

  float dl;

  pushMatrix();
  translate(x, y);

  noStroke();
  fill(235, 230, 237);
  beginShape();
  vertex(0, 0);
  vertex(l*cos(-PI/6), l*sin(-PI/6));
  vertex(0, -l);
  vertex(l*cos(-5*PI/6), l*sin(-5*PI/6));
  endShape(CLOSE);

  noStroke();
  fill(selectColor(x, y), random(80, 180));
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
  stroke(selectColor(x, y));
  dl = random(0.01, 0.08) * l;
  for ( float w = 0; w <= l; w += dl ) {
    line(w*cos(-PI/6), w*sin(-PI/6), w*cos(-PI/6), w*sin(-PI/6)+l);
  }

  strokeWeight(random(1.2, 3.2));
  stroke(selectColor(x, y));
  dl = random(0.01, 0.08) * l;
  for ( float w = 0; w <= l; w += dl ) {
    line(w*cos(-5*PI/6), w*sin(-5*PI/6), w*cos(-5*PI/6), w*sin(-5*PI/6)+l);
  }

  popMatrix();

  return ;
}


color selectColor(float w, float h) {

  final color[] cs = {
    color(184,  27,  48), 
    color( 17,   6,  10), 
    color(206, 182,  88), 
    color(202,  70,  73), 
    color( 78,  73,  82), 
    color(220, 210, 169), 
    color(105,   0,  34), 
    color(215, 210, 220), 
    color(115,  79, 135), 
  };

  return cs[(int)map(noise(w/220, h/220), 0, 1, 0, cs.length)];
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("149.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
