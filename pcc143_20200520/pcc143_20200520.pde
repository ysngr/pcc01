/* 143_20200520 */

void setup() {
  size(1000, 1000);
  noLoop();
  strokeCap(PROJECT);
}


void draw() {
  background(255);
  translate(width/2, height/2);
  rotate(random(PI/4));

  final float W = sq(2)*width/2, H = sq(2)*height/2;
  final float L = 90;
  final color[] cs = {
    color(173, 128, 175), 
    color(246, 237,  67), 
    color(244, 159,  58), 
    color( 78, 191, 213), 
    color(232,  68, 126), 
    color(182, 212,  88), 
    color(250, 250, 245), 
    color( 83,  78, 138), 
    color(  3,  20,  43)
  };

  blendMode(BLEND);
  for ( float h = -H; h < H; h += L ) {
    for ( float w = -W; w < W; w += L ) {
      noStroke();
      fill(cs[(int)random(cs.length)]);
      square(w, h, L);
      if ( random(5) < 4 ) {
        strokeWeight(random(0.8, 3.2));
        stroke(cs[(int)random(cs.length)]);
        drawLines(w, h, L);
      }
    }
  }

  blendMode(DIFFERENCE);
  noStroke();
  for ( int i = 0; i < 32; i++ ) {
    rotate(random(PI));
    fill(cs[(int)random(cs.length)], random(120, 220));
    square(random(-width/2, width/2), random(-height/2, height/2), random(20, 120));
  }
}


void drawLines(float w, float h, float len) {

  final boolean isVert = ( random(2) < 1 )? true : false;
  final float dl = random(0.02, 0.15) * len;

  for ( float l = 0; l < len; l += dl ) {
    if ( isVert ) {
      line(w+l, h, w+l, h+len);
    } else {
      line(w, h+l, w+len, h+l);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("143.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
