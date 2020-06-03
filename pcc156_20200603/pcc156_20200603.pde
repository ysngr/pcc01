/* 156_20200603 */

final float MIND = 10, MAXD = 170;

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(242, 226, 238);

  float x, y, dx, dy;

  for ( int i = 0; i < 8; i++ ) {
    x = random(width);
    y = random(height);
    for ( int j = 0; j < 20; j++ ) {
      noiseDecCircle(x, y, map(noise(x, y), 0, 1, MIND, MAXD));
      dx = random(-1, 1) * MAXD;
      dy = random(-1, 1) * MAXD;
      line(x, y, x+dx, y+dy);
      x += dx;
      y += dy;
    }
    noiseDecCircle(x, y, map(noise(x, y), 0, 1, MIND, MAXD));
  }
}



void noiseDecCircle(float x, float y, float d) {

  float r, st, nr, rs;

  pushMatrix();
  translate(x, y);
  strokeWeight(random(0.2, 1.4));
  selectColor();

  for ( r = d/2; r > 10; r -= random(5)) { 
    st = random(-PI, PI);
    rs = random(999);
    beginShape();
    for ( float t = st; t < st+TWO_PI; t += random(PI/128) ) {
      nr = r + map(noise(rs), 0, 1, -1, 1) * 0.6 * d;
      vertex(nr*cos(t), nr*sin(t));
      rs += random(-1, 1) * 0.02;
    }
    endShape(CLOSE);
  }

  popMatrix();

  return ;
}


void selectColor() {

  final color[]  cs = {
    color(198, 183, 217), 
    color(166, 111, 167), 
    color(131,  92, 143), 
    color(242, 226, 238), 
    color(209, 172, 175), 
    color(174, 150, 165), 
    color(205, 200, 185), 
    color(211, 177, 141), 
    color(151, 129, 127)
  };

  stroke(cs[(int)random(cs.length)], 200);
  fill(cs[(int)random(cs.length)], 20);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("156.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
