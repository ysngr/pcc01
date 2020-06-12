/* 153_20200530 */

final color[][] cs = {
  {color(252, 203, 186), color(255, 204, 190)}, 
  {color(254, 103, 112), color(242,  80, 101)}, 
  {color(159,  88,  84), color(124,  60,  76)}, 
  {color(255, 135,  85), color(245, 100,  69)}, 
  {color(250,  87,  70), color(251, 100,  79)}
};

final color[] ics = {
  color( 98, 229, 215), 
  color(156, 186,  96), 
  color(158, 221, 230), 
  color(247, 234, 129), 
  color( 24,  49, 133), 
  color(130, 109, 230)
};


void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(255);
  translate(width/2, height/2);
  
  fback();

  for ( int i = 0; i < ics.length; i++ ) {
    shole(random(-width/2, width/2), random(-height/2, height/2), random(100, 400), ics[i], random(120, 180));
  }

  float r, t, nt, d;
  t = 0;
  for ( int i = 0; i < cs.length; i++ ) {
    for ( int j = 0; j < random(3, 5); j++ ) {
      r = random(200, 540);
      d = random(80, 550);
      nt = random(-1, 1) * PI/8;
      hole(r*cos(t+nt), r*sin(t+nt), d, cs[i][(int)random(cs[i].length)], random(80, 120));
      t += random(TWO_PI/12, TWO_PI/4);
    }
  }
}


void fback() {

  final float dt = TWO_PI / 5;

  noStroke();

  float a;
  int i = 0;
  for ( float t = 0; t < TWO_PI; t += dt ) {
    a = 255;
    for ( float r = 0; r < 520; r++ ) {
      fill(cs[i][(int)random(cs[i].length)], a);
      circle(width/2, 0, 2*r);
      r += random(2);
      a -= random(2);
    }
    i++;
    rotate(dt);
  }

  return ;
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
