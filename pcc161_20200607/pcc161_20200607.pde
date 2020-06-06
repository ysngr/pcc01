/* 161_20200607 */

void setup() {
  size(1150, 800);
  noLoop();
  strokeWeight(0.75);
}


void draw() {
  background(50);
  sky();
  for ( int i = 0; i < 30; i++ ) {
    moon(random(width), random(height), random(120, 140));
  }
}


void sky() {

  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      stroke(
        map(noise(w/width/2, h/height/2), 0, 1, 40, 220), 
        random(120, 160), 
        map(noise(w/width, h/height), 0, 1, 20, 240), 
        random(120, 240)
      );
      point(w, h);
    }
  }

  return ;
}


void moon(float x, float y, float d) {

  final color[] cs = {
    color(235,  92,  50), 
    color(253, 211,  92), 
    color( 54,  54,  98), 
    color(200, 139, 169), 
    color(118, 102, 141), 
    color(  0, 126, 118), 
    color(201, 202, 202)
  };

  color c = cs[(int)random(cs.length)];

  noStroke();
  fill(c, random(180, 200));
  circle(x, y, d);
  carveCrater(x, y, d, c);

  noFill();
  for ( int a = (int)random(120, 140); a > 0; a-- ) {
    stroke(c, a);
    circle(x, y, d++);
  }

  return ;
}


void carveCrater(float x, float y, float d, color c) {

  float px, py;

  for ( float t = 0; t < TWO_PI; t += PI/128 ) {
    for ( float r = 0; r < d/2; r++ ) {
      px = x + r*cos(t);
      py = y + r*sin(t);
      stroke(
        red(c) * map(noise(px/width, py/height), 0, 1, 200, 255), 
        green(c) * map(noise(px/2*width, py/2*height), 0, 1, 0, 100), 
        blue(c) * map(noise(px/3*width, py/3*height), 0, 1, 100, 255), 
        random(30, 80)
      );
      point(px, py);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("161.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
