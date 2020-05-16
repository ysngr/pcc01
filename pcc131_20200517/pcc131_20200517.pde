/* 131_20200517 */

void setup() {
  size(1150, 780);
  noLoop();
  strokeWeight(10);
}


void draw() {
  background(54, 54, 98);

  final color[][] cs = {
    {color(253, 211,  92), color(234, 230, 192)}, 
    {color(202, 162,  86), color(242, 233, 114)}, 
    {color(196, 154, 114), color(100,  70,  48)}, 
    {color(245, 243, 223), color( 52,  55,  58)}, 
    {color( 87,  98, 105), color(220, 221, 210)}, 
    {color(135, 121, 109), color(202, 196, 172)}
  };

  int idx;
  float x, y, dy, r, t;

  for ( int i = 0; i < 120; i++ ) {
    idx = (int)random(cs.length);
    stroke(cs[idx][0], 15);
    fill(cs[idx][1], 15);
    circle(random(width), random(height), random(50, 80));
  }

  x = 0;
  y = 0;
  for ( color[] c : cs ) {
    x += random(0.6, 1.2) * width / cs.length;
    y += random(0.6, 1.2) * height / cs.length;
    dy = random(-70, 70);
    for ( int i = 0; i < 60; i++ ) {
      stroke(c[0]);
      fill(c[1]);
      r = random(50, 180);
      t = random(-PI, PI);
      circle(x+r*cos(t), y+dy+r*sin(t), random(60, 120));
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("131.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
