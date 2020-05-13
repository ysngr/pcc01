/* 128_20200514 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
  strokeWeight(2);
}


void draw() {
  background(33, 22, 10);

  color[] cs = {
    color(218, 65, 72), 
    color(208, 15, 49), 
    color(165, 26, 41), 
    color(79, 53, 39), 
    color(68, 81, 54), 
    color(255, 240, 193), 
    color(240, 208, 129), 
    color(231, 168, 73)
  };

  for ( color c : cs ) {
    arrangeFlower(c);
  }
}


void arrangeFlower(color c) {

  pushMatrix();
  translate(random(width), random(height));

  float br, r, lt, st;

  stroke(c);
  for ( int i = 0; i < 60; i++ ) {
    br = 80 + random(-50, 100);
    lt = 0;
    st = random(PI/32);
    for ( float t = st; t < st+TWO_PI; t += PI/128 ) {
      r = (br + 20*cos(lt));
      point(r*cos(t), r*sin(t));
      lt += PI / 8;
    }
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 'r' ) {
    redraw();
  } else if ( key == 's' ) {
    saveFrame("128.png");
    System.exit(0);
  }
}
