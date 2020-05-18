/* 139_20200518 */

void setup() {
  size(1200, 780);
  noLoop();
  blendMode(ADD);
  strokeWeight(0.5);
  noFill();
}


void draw() {
  background(147, 85, 108);

  final color[] cs = {
    color(231, 212, 228), 
    color(167, 117, 165), 
    color(132,  81, 129), 
    color(105,  57,  76)
  };

  for ( color c : cs ) {
    stroke(c, 18);
    for ( int i = 0; i < 2; i++ ) {
      drawNet(random(width/2), random(height/2), random(width/2, width), random(height/2, height));
    }
  }
}


void drawNet(float sw, float sh, float lw, float lh) {

  pushMatrix();
  translate(sw, sh);

  for ( float w = 0; w < sw+lw; w += 2 ) {
    beginShape();
    vertex(w   , 0   );
    vertex(lw  , w   );
    vertex(lw-w, lh  );
    vertex(0   , lh-w);
    endShape(CLOSE);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("139.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
