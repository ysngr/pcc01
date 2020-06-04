/* 158_20200604 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(242, 237, 226);
  for ( int i = 0; i < 22; i++ ) {
    spiralnet();
  }
}


void spiralnet() {

  float x, y, r, dr, pr, t, dt, pt, w, dw;
  ArrayList<PVector> ps;
  int n;
  color c;

  x = random(width);
  y = random(height);
  r = random(20);
  dr = random(4);
  t = random(-PI, PI);
  dt = random(PI/16, PI/8);
  w = random(r/4, r);
  dw = random(0.5);
  ps = new ArrayList<PVector>();

  for ( int i = 0; i < 50; i++ ) {
    n = (int)random(1, 10);
    for ( int j = 0; j < n; j++ ) {
      pr = random(r-w, r+w);
      pt = random(-1, 1) * PI/32;
      ps.add(new PVector(x+pr*cos(t+pt), y+pr*sin(t+pt)));
    }
    r += dr;
    t += dt;
    w += dw;
  }

  c = selectColor();
  for ( int i = 0; i < ps.size(); i++ ) {
    for ( int j = i+1; j < ps.size(); j++ ) {
      if ( dist(ps.get(i).x, ps.get(i).y, ps.get(j).x, ps.get(j).y) < map(i, 0, ps.size(), 10, r/2.2) && random(5) < 2 ) {
        strokeWeight(random(1.2, 2.4));
        stroke(c, random(80, 180));
        line(ps.get(i).x, ps.get(i).y, ps.get(j).x, ps.get(j).y);
      }
    }
  }

  return ;
}


color selectColor() {

  final color[] cs = {
    color(157, 170, 189), 
    color(162, 190, 202), 
    color(192, 184, 176), 
    color( 76,  91, 102), 
    color(185, 139, 105), 
    color( 85,  63,  43), 
    color(211, 215, 217), 
    color(111, 131, 150), 
    color(103, 103, 130), 
    color(183, 178, 204), 
    color(189, 155, 183), 
    color(110,  93, 136)
  };

  return cs[(int)random(cs.length)];
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("158.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
