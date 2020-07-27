/* 195_20200727 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  backsea();

  pushMatrix();
  translate(width/2, height/2);
  rotate(-PI/6);
  waves(40, 120, 80, 200, 180, 220);
  rotate(PI/4);
  waves(200, 240, 140, 240, 200, 220);
  popMatrix();

  for ( int i = 0; i < 7; i++ ) {
    decircle(random(width), random(height), random(80, 200));
  }
}


void backsea() {

  background(255);

  loadPixels();
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      pixels[(int)(w+h*width)] = color(
        map(noise(w/200, h/240), 0, 1, 120, 160), 
        map(noise(w/220, h/220), 0, 1, 160, 250), 
        map(noise(w/260, h/160), 0, 1, 130, 150)
      );
    }
  }
  updatePixels();

  return ;
}


void waves(float rl, float rh, float gl, float gh, float bl, float bh) {

  final float amp = 24;
  final float dh = 2.4 * amp;
  final float dt = PI / 80;

  float t, s;
  for ( float h = -height; h < height; h += dh ) {
    t = random(-PI, PI);
    s = random(999);
    for ( float w = -width; w < width; w++ ) {
      strokeWeight(map(noise(0.4*w/width, 0.4*h/height, s), 0, 1, 5, 30));
      stroke(
        map(noise(w/width), 0, 1, rl, rh), 
        map(noise(h/height), 0, 1, gl, gh), 
        map(noise(w/width, h/height), 0, 1, bl, bh), 
        map(noise(s), 0, 1, 15, 40)
      );
      point(w, h+amp*cos(t));
      t += dt;
      s += 0.02;
    }
  }

  return ;
}


void decircle(float x, float y, float l) {

  noStroke();
  fill(98, 227, 215, 3);

  for ( float r = l; r > 0; r -= random(1, 2) ) {
    circle(x+random(-1, 1), y+random(-1, 1), 2*r);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("195.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
