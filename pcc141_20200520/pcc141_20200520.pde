/* 141_20200520 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(202, 204, 210);
  for ( int i = 0; i < 18; i++ ) {
    decCircle();
  }
  for ( int i = 0; i < 6; i++ ) {
    candy();
  }
}


void selectColor() {

  final color[] cs = {
    color(131, 154, 92), 
    color( 75,  45, 22), 
    color( 49, 103, 63), 
    color(114, 175, 45), 
    color(183, 203, 60)
  };

  noStroke();
  fill(cs[(int)random(cs.length)], 8);

  return ;
}


void candy() {

  float x = random(width);
  float y = random(height);
  float r = random(60, 180);
  float mr = random(10, r/4);
  float dr, t, ts;

  selectColor();

  t = random(-PI, PI);
  ts = ( random(2) < 1 )? 1.0 : -1.0;
  while ( r > mr ) {
    dr = random(1, 4);
    t += ts * random(PI/24, PI/6);
    r -= dr;
    x += dr*cos(t);
    y += dr*sin(t);
    circle(x, y, 2*r);
  }

  return ;
}


void decCircle() {

  float x = random(width);
  float y = random(height);
  float r = random(80, 220);
  float mr = random(10, r/4);

  selectColor();

  while ( r > mr ) {
    circle(x, y, 2*r);
    r -= random(1, 3);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("141.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
