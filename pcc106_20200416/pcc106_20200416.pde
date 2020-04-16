/* 106_20200416 */

float x, y;

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(0);

  x = random(width);
  y = random(height);
  
  // black/white
  for ( int i = 0; i < 45; i++ ) {
    growArc(color(random(80, 200)), random(60, 120));
  }
  // red
  for ( int i = 0; i < 5; i++ ) {
    growArc(color(random(180, 220), random(0, 50), random(20, 60)), random(30, 80));
  }
  // green
  for ( int i = 0; i < 5; i++ ) {
    growArc(color(random(0, 50), random(80, 140), random(40, 60)), random(40, 100));
  }
  // yellow
  for ( int i = 0; i < 5; i++ ) {
    growArc(color(random(180, 220), random(180, 220), random(40, 80)), random(10, 50));
  }
  // blue
  for ( int i = 0; i < 5; i++ ) {
    growArc(color(random(50, 80), random(100, 160), random(180, 220)), random(10, 40));
  }
}


void growArc(color c, float alpha) {

  float r = random(50, 250);
  float t = random(-PI, PI);
  float dt = (( random(2) < 1 )? 1.0 : -1.0) * random(PI/256, PI/128);
  float sw = random(1);
  float dsw = random(0.8);
  int plottime = (int)random(120, 180);

  stroke(c, alpha);
  for ( int i = 0; i < plottime; i++ ) {
    strokeWeight(sw);
    point(x+r*cos(t), y+r*sin(t));
    t += dt;
    if ( random(10) < 3 ) {
      sw += dsw;
    }
  }

  x = x + r*cos(t);
  if ( x < 0 || width < x ) {
    x = random(width);
  }
  y = y + r*sin(t);
  if ( y < 0 || height < y ) {
    y = random(height);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("106.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
