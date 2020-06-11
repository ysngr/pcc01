/* 166_20200612 */

final color[] cs = {
  color(167,  55, 106), 
  color(196, 117, 144), 
  color(219,  78, 120), 
  color(221, 107,  71), 
  color(234, 153, 135), 
  color(229, 185, 147), 
  color(212,  62, 113), 
  color(125,   0,  74), 
  color(117,  55,  64)
};

float cx, cy, or;


void setup() {
  size(1150, 800);
  noLoop();
  noFill();
}


void draw() {
  background(79, 53, 39);

  for ( int i = 0; i < 6; i++ ) {
    cx = random(width);
    cy = random(height);
    pushMatrix();
    translate(cx, cy);
    initPoint();
    orbit();
    popMatrix();
  }
}


void initPoint() {

  final float[][] cs = {
    {0    , 0     }, 
    {width, 0     }, 
    {0    , height}, 
    {width, height}
  };

  float d;

  or = 0;
  for ( int i = 0; i < cs.length; i++ ) {
    if ( (d = dist(cs[i][0], cs[i][1], cx, cy)) > or ) {
      or = d;
    }
  }

  return ;
}


void orbit() {

  final float dt = PI / 2048;

  float st;

  for ( float r = random(0.4*or); r < or; r += random(3, 10) ) {
    initStroke();
    st = random(-PI, PI);
    for ( float t = st; t < st+TWO_PI; t += dt ) {
      if ( random(100) < 1 ) {
        t += random(PI/6);
        initStroke();
      }
      point(r*cos(t), r*sin(t));
    }
  }

  return ;
}


void initStroke() {
  
  if ( random(10) < 2 ) {
    blendMode(ADD);
  } else {
    blendMode(BLEND);
  }
  
  strokeWeight(random(2.2, 6.2));
  stroke(cs[(int)random(cs.length)], random(10, 80));

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("166.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
