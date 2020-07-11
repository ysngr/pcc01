/* 179_20200712 */

final color BGCOL = color(225, 223, 232);

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(BGCOL);
  colorShadows(26);
  waves();
  colorShadows(12);
}


void colorShadows(int n) {

  for ( int i = 0; i < n; i++ ) {
    noiseSeed((long)random(9999));
    pushMatrix();
    translate(random(width), random(height));
    rotate(random(-PI, PI));
    colorShadow(-random(80, 320), random(80, 320), 0, random(60, 320));
    popMatrix();
  }

  return ;
}


void colorShadow(float l, float r, float h, float a) {

  final color[] cs = {
    color(117, 129, 179), 
    color(139, 163, 199), 
    color(217, 200, 223), 
    color(158, 200, 168), 
    color(246, 217, 230), 
    color(251, 235, 175), 
    color(179, 127, 144), 
    color(214, 130, 131)
  };

  float d = abs(r-l);
  float t = 0;
  float s;

  noStroke();
  fill(cs[(int)random(cs.length)]);

  beginShape();
  s = random(-PI, PI);
  for ( float w = l; w < r; w++ ) {
    vertex(w, h+a*sin(t)*noise(cos(s)));
    t += PI / d;
    s += PI / d;
  }
  s = random(-PI, PI);
  for ( float w = r; w > l; w-- ) {
    vertex(w, h+a*sin(t)*noise(cos(s)));
    t += PI / d;
    s += PI / d;
  }
  endShape(CLOSE);

  return ;
}


void wave(int w, int h, color c) {

  float x, y, t, ta, a, al;
  int n;

  x = w;
  y = h;
  ta = map(noise(x/width, y/height), 0, 1, 6, 14);
  a = random(5);
  al = random(120, 180);
  n = (int)random(20, 120);

  for ( int i = 0; i < n; i++ ) {
    strokeWeight(map(noise(x/width, y/height), 0, 1, 1.0, 2.8));
    stroke(c, al);
    point(x, y);
    t = ta * noise(x/width, y/height);
    x += a * cos(t);
    y += a * sin(t);
    a += random(0.02);
    al -= random(0.5, 2.0);
  }

  return ;
}


void waves() {

  color c;

  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      c = get(w, h);
      if ( c != BGCOL && random(10) < 2 ) {
        wave(w, h, c);
      }
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("179.png");
    System.exit(0);
  }
}
