/* 114_20200503 */

void setup() {
  size(1150, 800);
  noLoop();
  noFill();
  strokeWeight(0.5);
}


void draw() {
  background(240);

  for ( int i = 0; i < 28; i++ ) {
    ring();
  }
}


void ring() {

  float w, h;

  switch( (int)random(10) ) {
  case 0 : 
    blendMode(BLEND); 
    break;
  case 1 : 
    blendMode(SCREEN); 
    break;
  default : 
    blendMode(SUBTRACT);
  }

  pushMatrix();
  translate(random(width), random(height));

  stroke(random(255), random(255), random(255), 40);
  w = random(80, 800);
  h = w;
  for ( int i = 0; i < 920; i++ ) {
    ellipse(0, 0, w, h);
    w += random(-1, 1) * noise(w) * 8;
    h += random(-1, 1) * noise(h) * 8;
    if ( random(600) < 1 ) {
      rotate(random(PI/256, PI/128));
    }
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("114.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
