/* 151_20200529 */

void setup() {
  size(1150, 740);
  noLoop();
  noFill();
}


void draw() {
  background(235, 239, 244);

  final color[] cs = {color(56, 158, 169), color(0, 132, 168), color(158, 181, 210)};

  for ( int i = 0; i < 3; i++ ) {
    flow(random(9999), cs[i]);
    flow(random(9999), cs[i]);
  }
}


void flow(float s, color c) {

  final float dh = 140;
  final float hr = random(0.30, 0.40);
  float n, sn;

  translate(0, random(-0.05, 0.10)*height);
  stroke(c, random(14, 36));

  sn = s;
  for ( float h = hr*height; h < (1-hr)*height; h++ ) {
    beginShape();
    n = sn;
    for ( int w = 0; w < width; w++ ) {
      curveVertex(w, map(noise(w/1997, n), 0, 1, h-dh, h+dh));
      n += 0.01;
    }
    sn += random(-0.01, 0.01);
    endShape();
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("151.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
