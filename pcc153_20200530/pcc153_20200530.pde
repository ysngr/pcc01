/* 153_20200530 */

final color[][] cs = {
  {color(252, 203, 186), color(255, 204, 190)}, 
  {color(254, 103, 112), color(242,  80, 101)}, 
  {color(159,  88,  84), color(124,  60,  76)}, 
  {color(255, 135,  85), color(245, 100,  69)}, 
  {color(250,  87,  70), color(251, 100,  79)}
};


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(MULTIPLY);
}


void draw() {
  background(255, 235, 235);
  translate(width/2, height/2);

  float r, t, nt, d;

  t = random(-PI, PI);
  for ( int i = 0; i < 5; i++ ) {
    for ( int j = 0; j < 18; j++ ) {
      r = random(160, 420);
      d = random(80, 160);
      nt = random(-1, 1) * PI/8;
      hs(r*cos(t+nt), r*sin(t+nt), d, cs[i][(int)random(cs[i].length)], random(30, 70));
    }
    t += TWO_PI / 5;
  }
}


void hs(float x, float y, float d, color c, float a) {
  if ( random(2) < 1 ) {
    hole(x, y, d, c, a);
  } else {
    shole(x, y, d, c, a);
  }
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


void shole(float x, float y, float d, color c, float alpha) {

  rectMode(CENTER);
  strokeWeight(2.0);
  noFill();

  float r = d / 2;
  for ( float a = alpha; a > 0; a-- ) {
    stroke(c, a);
    square(x, y, 2*r);
    r++;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("153.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
