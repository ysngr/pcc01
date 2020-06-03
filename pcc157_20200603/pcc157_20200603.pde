/* 157_20200603 */

final color[] cs = {
  color(163, 214, 206), 
  color(100, 187, 186), 
  color( 63, 171, 155), 
  color(133, 203, 191), 
  color(165, 213, 183), 
  color( 89, 188, 157), 
  color(100, 157, 112), 
  color( 48, 128, 152), 
  color( 74, 172, 188)
};


void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(230, 230, 230);

  final float R = 50.0;
  for ( float h = R; h < height; h += 2*R ) {
    for ( float w = R; w < width; w += 2*R ) {
      circles(w, h, random(2.0, 4.0)*R);
    }
  }
}


void circles(float w, float h, float d) {

  switch( (int)random(5) ) {
  case 0 : 
    ccircle(w, h, d);
    break;
  case 1 :
    spiral(w, h, d);
    break;
  case 2 : 
    trembleCircle(w, h, d);
    break;
  case 3 :
    hole(w, h, d);
    break;
  case 4 :
    arcs(w, h, d);
    break;
  }

  return ;
}


void ccircle(float x, float y, float d) {

  if ( random(2) < 1 ) {
    strokeWeight(random(1.2, 4.5));
    stroke(cs[(int)random(cs.length)]);
  } else {
    noStroke();
  }

  if ( random(2) < 1 ) {
    fill(cs[(int)random(cs.length)], random(120, 240));
  } else {
    noFill();
  }

  circle(x, y, d);

  return ;
}


void spiral(float x, float y, float d) {

  float t = random(-PI, PI);
  float ts = ( random(2) < 1 )? 1.0 : -1.0;

  strokeWeight(random(1.0, 1.5));
  stroke(cs[(int)random(cs.length)]);

  for ( float r = d/2; r > 0; r -= 0.05 ) {
    point(x+r*cos(t), y+r*sin(t));
    t += ts * PI / 64;
  }

  return ;
}


void trembleCircle(float x, float y, float d) {

  float dr, t;

  if ( random(2) < 1 ) {
    strokeWeight(random(1.0, 2.2));
    stroke(cs[(int)random(cs.length)]);
  } else {
    noStroke();
  }

  if ( random(2) < 1 ) {
    fill(cs[(int)random(cs.length)]);
  } else {
    noFill();
  }

  while ( d > 20 ) {
    dr = random(5);
    t = random(-PI, PI);
    x += dr * cos(t);
    y += dr * sin(t);
    d -= 2* dr;
    circle(x, y, d);
  }

  return ;
}


void hole(float x, float y, float d) {

  float a = random(50, 80);
  float r = random(0.2, 0.4) * d;
  color c = cs[(int)random(cs.length)];

  noFill();
  while ( a > 0 ) {
    stroke(c, a--);
    circle(x, y, r++);
  }

  return ;
}


void arcs(float x, float y, float d) {

  float dt, ad;
  float st = random(-PI, PI);

  if ( random(2) < 1 ) {
    strokeWeight(random(1.0, 1.6));
    stroke(cs[(int)random(cs.length)]);
  } else {
    noStroke();
  }

  if ( random(2) < 1 ) {
    fill(cs[(int)random(cs.length)], random(60, 120));
  } else {
    noFill();
  }

  for ( float t = st; t < st+3*TWO_PI; t += dt ) {
    dt = random(PI/4);
    ad = random(0.2, 1.0) * d;
    arc(x, y, ad, ad, t, t+dt);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("157.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
