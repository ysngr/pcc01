/* 194_20200726 */

void setup() {
  size(1150, 800);
  noLoop();
  stroke(240);
}


void draw() {
  background(242, 244, 238);
  translate(width/2, height/2);
  rotate(PI/128);
  translate(-width/2, -height/2);

  final color[] cs = {
    color(131, 198,  97), 
    color( 87, 170,  90), 
    color( 62, 107,  53), 
    color(175, 214, 152), 
    color(204, 223, 162), 
    color( 79, 141,  81), 
    color(100, 157, 112), 
    color(174, 211, 161), 
    color(113, 183, 132)
  };
  final float l = 200, dw = 0.36*l, dh = 1.04*l;

  for ( float w = random(-1.5, -1.0)*dw; w < width+dw; w += dw ) {
    for ( float h = random(-1, -0.5)*dh; h < height; h += dh ) {
      fill(cs[(int)random(cs.length)]);
      bamboo(w, h, l);
    }
  }
}


void bamboo(float w, float h, float l) {

  float sw = l/18, sh = l/5, ll = l/8, d = 3;

  pushMatrix();
  translate(w, h);

  // leaf (left upper)
  leaf(d, 0.3*sh, ll, PI+PI/6);
  leaf(d, 0.3*sh, ll, PI);
  // leaf (left lower)
  leaf(d, 2.6*sh, ll, PI+PI/4);
  leaf(d, 2.6*sh, ll, PI);
  leaf(d, 2.6*sh, ll, PI-PI/4);
  // leaf (right upper)
  leaf(2*l/9-d, 1.5*sh, ll, -PI/6);
  leaf(2*l/9-d, 1.5*sh, ll, 0);
  leaf(2*l/9-d, 1.5*sh, ll, PI/6);
  // leaf (right upper)
  leaf(2*l/9-d, 3.5*sh, ll, -PI/6);
  leaf(2*l/9-d, 3.5*sh, ll, 0);
  leaf(2*l/9-d, 3.5*sh, ll, PI/6);

  // stem (left)
  rect(0, 0, sw, 1.6*sh);
  rect(0, 1.7*sh, sw, sh);
  rect(0, 2.8*sh, sw, 2.2*sh);
  // stem (center)
  rect(3*l/36, 0.3*sh, sw, 1.4*sh);
  rect(3*l/36, 1.8*sh, sw, 0.8*sh);
  rect(3*l/36, 2.7*sh, sw, 2.6*sh);
  // stem (right)
  rect(l/6, 0, sw, 1.6*sh);
  rect(l/6, 1.7*sh, sw, 1.4*sh);
  rect(l/6, 3.2*sh, sw, 1.8*sh);

  popMatrix();

  return ;
}


void leaf(float x, float y, float r, float t) {

  float ct = random(PI/12, PI/6);

  bezier(
    x                , y                , 
    x+2*r/5*cos(t-ct), y+2*r/5*sin(t-ct), 
    x+3*r/5*cos(t-ct), y+3*r/5*sin(t-ct), 
    x+r*cos(t)       , y+r*sin(t)
  );
  bezier(
    x                , y                , 
    x+2*r/5*cos(t+ct), y+2*r/5*sin(t+ct), 
    x+3*r/5*cos(t+ct), y+3*r/5*sin(t+ct), 
    x+r*cos(t)       , y+r*sin(t)
  );

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("194.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
