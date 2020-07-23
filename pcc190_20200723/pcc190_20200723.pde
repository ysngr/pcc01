/* 190_20200723 */

final color BGCOL = color(242, 248, 237);

void setup() {
  size(1150, 800);
  noLoop();
  noStroke();
}


void draw() {
  background(BGCOL);

  final color[] cs = {
    color(130, 166, 113), 
    color(132, 161, 188), 
    color(186, 161, 188), 
    color(229, 191, 127), 
    color(219, 216, 232), 
    color( 52,  97,  78), 
    color(217, 117,  86), 
    color(  0, 149, 128)
  };

  for ( color c : cs ) {
    fill(c);
    pushMatrix();
    translate(random(width), random(height));
    rotate(random(-PI, PI));
    pentaflake(0, 0, random(180, 260));
    popMatrix();
  }
  
  flow();
}


void pentaflake(float x, float y, float l) {

  if ( l < 1 ) {
    pentagon(x, y, l);
    return ;
  }

  final float t = 3 * PI / 10;

  float nl = l / (2*sin(t) + 1);

  pushMatrix();
  translate(x, y);
  for ( int i = 0; i < 5; i++ ) {
    rotate(TWO_PI/5);
    pentaflake(2*sin(t)*nl, 0, nl);
  }
  rotate(PI);
  pentaflake(0, 0, nl);
  popMatrix();

  return ;
}


void pentagon(float x, float y, float l) {

  noStroke();

  beginShape();
  for ( float t = 0; t < TWO_PI; t += TWO_PI/5 ) {
    vertex(x+l*cos(t), y+l*sin(t));
  }
  endShape(CLOSE);

  return ;
}


void flow() {

  color c;
  float x, y;
  int n;

  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      if ( random(500) < 1 && (c = get(w, h)) != BGCOL ) {
        stroke(c, 160);
        n = (int)random(800, 1200);
        x = 0;
        y = 0;
        for ( int i = 0; i < n; i++ ) {
          x += random(-4, 4);
          y += random(-4, 4);
          point(w+x, h+y);
        }
      }
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("190.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
