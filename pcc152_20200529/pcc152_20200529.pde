/* 152_20200529 */

void setup() {
  size(1000, 1000);
  noLoop();
  textFont(createFont("HGS教科書体", 16));
}


void draw() {
  background(79, 53, 39);

  final color[] cs = {
    color(218,  65,  72), 
    color(208,  15,  49), 
    color(165,  26,  41), 
    color( 68,  81,  54), 
    color( 33,  22,  10), 
    color(255, 240, 193), 
    color(240, 108, 129), 
    color(231, 168,  73)
  };

  for ( int i = 0; i < 80; i++ ) {
    chinachar(cs[(int)random(cs.length)]);
    hole(random(width), random(height), random(120, 320), cs[(int)random(cs.length)], random(160));
  }
}


void chinachar(color c) {

  final String w = "哀登毛以不部幾人盤於毛本衣天身乃以多川良尓奈利奴部幾哉";

  noStroke();
  fill(c);
  textSize(random(32, 82));
  text(w.charAt((int)random(w.length())), random(width), random(height));

  return ;
}


void hole(float x, float y, float d, color c, float alpha) {

  strokeWeight(2.0);
  noFill();

  float r = d / 2;
  for ( float a = alpha; a > 0; a-- ) {
    stroke(c, a);
    circle(x, y, 2*r);
    r++;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("152.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
