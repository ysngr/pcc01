/* 177_20200707 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(254, 247, 246);
  translate(width/2, height/2);
  rotate(PI/28);
  translate(-width/2, -height/2);
  recsq(-200, -200, 1400);
}


void recsq(float x, float y, float l) {

  if ( l < 80 && l < 500 || random(10) < 1 ) {
    noStroke();
    fill(getColor());
    square(x, y, l);
    stroke(getColor());
    noFill();
    carpet(x, y, l);
    return ;
  }

  int dn = (int)random(2, 6);
  float d = l / dn;

  for ( int i = 0; i < dn; i++ ) {
    for ( int j = 0; j < dn; j++ ) {
      recsq(x+i*d, y+j*d, d);
    }
  }

  return ;
}


void carpet(float x, float y, float l) {

  int rn = (int)random(3, 8);
  float nl = l / 3;

  for ( float u = 0; u < nl; u += nl / rn ) {
    beginShape();
    vertex(x+nl+u  , y+nl    );
    vertex(x+2*nl  , y+nl+u  );
    vertex(x+2*nl-u, y+2*nl  );
    vertex(x+nl    , y+2*nl-u);
    endShape(CLOSE);
  }

  if ( l > 20 ) {
    carpet(x     , y     , nl);
    carpet(x+nl  , y     , nl);
    carpet(x+2*nl, y     , nl);
    carpet(x     , y+nl  , nl);
    carpet(x+2*nl, y+nl  , nl);
    carpet(x     , y+2*nl, nl);
    carpet(x+nl  , y+2*nl, nl);
    carpet(x+2*nl, y+2*nl, nl);
  }

  return ;
}


color getColor() {

  final color[] cs = {
    color( 20,  13,  74), 
    color( 76,  57, 108), 
    color(158, 157, 205), 
    color( 76, 182, 121), 
    color(232,  56,  57), 
    color(249, 194, 112), 
    color(115,  55, 145), 
    color(194, 194, 225)
  };

  return cs[(int)random(cs.length)];
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("177.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
