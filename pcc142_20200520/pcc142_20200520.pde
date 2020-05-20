/* 142_20200520 */

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  background(242, 241, 245);

  final color[] cs = {
    color(205, 223, 233), 
    color(159, 192, 207), 
    color(136, 160, 203), 
    color(244, 241, 245), 
    color(254, 236, 204), 
    color(252, 227, 205), 
    color(217, 113, 105), 
    color(198,  83,  78)
  };
  final float G = 100.0;

  float sw, d;

  for ( float h = G; h < height-G; h += sw ) {
    sw = random(2.8, 4.5);
    strokeWeight(sw);
    stroke(cs[(int)random(cs.length)]);
    for ( float w = G; w < width-G; w += 0.5 ) {
      point(w, h+20*noise(w/100, h/100));
    }
  }

  noStroke();
  for ( color c : cs ) {
    d = random(60, 320);
    fill(c, map(d, 60, 320, 255, 5));
    circle(random(width), random(height), d);
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("142.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
