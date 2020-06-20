/* 171_20200621 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(228, 243, 245);
  recrect(0.05*width, 0.075*height, 0.9*width, 0.85*height);
}


void recrect(float x, float y, float lw, float lh) {

  final float MIN = 20;

  int wdn = (int)random(2, 5);
  int hdn = (int)random(2, 5);
  float dw = lw / wdn;
  float dh = lh / hdn;

  for ( int i = 0; i < hdn; i++ ) {
    for ( int j = 0; j < wdn; j++ ) {
      if ( dw < MIN || dh < MIN || random(10) < 1 ) {
        distrect(x+j*dw, y+i*dh, dw, dh);
      } else {
        recrect(x+j*dw, y+i*dh, dw, dh);
      }
    }
  }

  return ;
}



void distrect(float x, float y, float lw, float lh) {

  noStroke();
  fill(selectColor());

  beginShape();
  for ( float w = 0; w < lw; w++ ) {
    vertex(x+w, ny(x+w, y));
  }
  for ( float h = 0; h < lh; h++ ) {
    vertex(x+lw, ny(x+lw, y+h));
  }
  for ( float w = 0; w < lw; w++ ) {
    vertex(x+lw-w, ny(x+lw-w, y+lh));
  }
  for ( float h = 0; h < lh; h++ ) {
    vertex(x, ny(x, y+lh-h));
  }
  endShape(CLOSE);

  return ;
}


float ny(float w, float h) {
  return h + 15*sin(80*noise(w/width, h/height));
}


color selectColor() {

  final color[] cs = {
    color(227, 233, 242), 
    color( 98, 144, 177), 
    color(175, 212, 230), 
    color(160, 216, 239), 
    color(158, 200, 209), 
    color( 96, 154, 161), 
    color(112, 123, 153), 
    color(153, 166, 177), 
    color(239, 227, 233)
  };

  return cs[(int)random(cs.length)];
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("171.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
