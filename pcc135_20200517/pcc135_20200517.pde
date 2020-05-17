/* 135_20200517 */

void setup() {
  size(1000, 1000);
  noLoop();
  noStroke();
}


void draw() {
  background(221, 192, 206);
  disk(0, 0, 1000);
}


void disk(float w, float h, float l) {

  if ( l > 50 && random(10) < 7 ) {
    disk(w, h, l/2);
    disk(w+l/2, h, l/2);
    disk(w, h+l/2, l/2);
    disk(w+l/2, h+l/2, l/2);
    return ;
  }

  final color[] cs = {
    color(216, 65, 145), 
    color(214, 139, 185), 
    color(235, 109, 154), 
    color(251, 230, 239), 
    color(174, 128, 126), 
    color(193, 216, 128), 
    color(150, 200, 85), 
    color(145, 164, 78)
  };

  int idx, n;
  float r, st;
  float dt = random(PI/32, PI/4);

  pushMatrix();
  translate(w+l/2, h+l/2);
  idx = (int)random(cs.length);
  n = (int)random(30, 80);
  for ( int i = 0; i < n; i++ ) {
    r = random(l);
    st = random(TWO_PI);
    fill(cs[idx], random(100, 200));
    arc(0, 0, r, r, st, st+dt);
  }
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("135.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
