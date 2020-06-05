/* 159_20200605 */

ArrayList<float[]> ps;

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(232, 240, 235);
  ps = new ArrayList<float[]>();
  rdivArea(
    random(0.05, 0.10)*width, random(0.05, 0.10)*height, 
    (1-random(0.05, 0.10))*width, random(0.05, 0.10)*height, 
    (1-random(0.05, 0.10))*width, (1-random(0.05, 0.10))*height, 
    random(0.05, 0.10)*width, (1-random(0.05, 0.10))*height
    );
  drawArea();
}


void rdivArea(float tlX, float tlY, float trX, float trY, float brX, float brY, float blX, float blY) {

  float wr, br, lr, rr, cx, cy;

  float uw = trX - tlX;
  float uh = trY - tlY;
  float bw = brX - blX;
  float bh = brY - blY; 
  float lw = blX - tlX;
  float lh = blY - tlY;
  float rw = brX - trX;
  float rh = brY - trY;

  if ( uw < 10 || bw < 10 || lh < 10 || rh < 10 || random(10) < 1.5 ) {
    float[] p = {tlX, tlY, trX, trY, brX, brY, blX, blY};
    ps.add(p);
    return ;
  }

  wr = random(0.35, 0.65);
  br = random(0.35, 0.65);  
  lr = random(0.35, 0.65);
  rr = random(0.35, 0.65);
  cx = (tlX+uw*wr + blX+bw*br) / 2; 
  cy = (tlY+lh*lr + trY+rh*rr) / 2;

  rdivArea(tlX, tlY, tlX+uw*wr, tlY+uh*wr, cx, cy, tlX+lw*lr, tlY+lh*lr);
  rdivArea(tlX+uw*wr, tlY+uh*wr, trX, trY, trX+rw*rr, trY+rh*rr, cx, cy);
  rdivArea(cx, cy, trX+rw*rr, trY+rh*rr, brX, brY, blX+bw*br, blY+bh*br);
  rdivArea(tlX+lw*lr, tlY+lh*lr, cx, cy, blX+bw*br, blY+bh*br, blX, blY);

  return ;
}


void drawArea() {

  final color[] cs = {
    color(248, 247, 240), 
    color(245, 243, 223), 
    color(246, 227, 231), 
    color(231, 203, 219), 
    color(228, 243, 245), 
    color(181, 223, 226), 
    color(221, 220, 214), 
    color(151, 202, 208), 
    color(209, 169, 188)
  };

  float[] p;

  stroke(240);
  for ( int i = 0; i < ps.size(); i++ ) {
    p = ps.get(i);
    strokeWeight(random(0.8, 1.6));
    fill(cs[(int)random(cs.length)]);
    beginShape();
    vertex(p[0], p[1]);
    vertex(p[2], p[3]);
    vertex(p[4], p[5]);
    vertex(p[6], p[7]);
    endShape();
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("159.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
