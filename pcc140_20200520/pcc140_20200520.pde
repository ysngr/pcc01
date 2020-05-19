/* 140_20200520 */

void setup() {
  size(1200, 780);
  noLoop();
  strokeCap(PROJECT);
  noFill();
}


void draw() {
  background(177, 196, 203);

  final color[] cs = {
    color(185, 188, 176), 
    color(230, 230, 230), 
    color(201, 202, 202), 
    color(159, 160, 160), 
    color( 89,  87,  87), 
    color( 54,  82, 110), 
    color( 53, 108, 156), 
    color( 66, 123, 191)
  };

  for ( color c : cs ) {
    drawArc(c);
    drawArc(c);
  }
}


void drawArc(color c) {

  float w, h, d;

  pushMatrix();
  translate(width/2, height/2);
  rotate(random(-PI, PI));
  translate(-width/2, -height/2);

  strokeWeight(random(4.0, 12.0));
  stroke(c);

  w = 0;
  h = random(height);

  while ( w < width ) {
    d = random(5, 120);
    w += d/2;
    if ( random(2) < 1 ) {
      arc(w, h, d, d, 0, PI);
    } else {
      arc(w, h, d, d, PI, TWO_PI);
    }
    w += d/2;
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("140.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
