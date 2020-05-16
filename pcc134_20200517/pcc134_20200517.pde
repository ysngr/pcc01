/* 134_20200517 */

void setup() {
  size(1100, 700);
  noLoop();
}


void draw() {
  background(230, 229, 215);

  final color[] cs = {
    color(  0, 165, 213), 
    color( 89, 195, 225), 
    color(161, 216, 225), 
    color( 76, 187, 180), 
    color(134, 202, 182), 
    color( 91, 164, 105), 
    color(250, 238, 222), 
    color(247, 242, 244)
  };

  float dw, h, dh, r, t, wh;

  for ( color c : cs ) {
    strokeWeight(random(1.0, 3.2));
    stroke(c, 200);
    dw = random(40, 80);
    h = random(height);
    dh = random(20, 80);
    r = random(10, 70);
    t = random(-PI, PI);
    for ( float w = -dw; w < width+dw; w += random(0.5, 1.2) ) {
      wh = r * cos(t);
      line(w, h+wh, w+dw, h+dh+wh);
      t += random(PI/64, PI/32);
    }
    for ( int i = 0; i < 5; i++ ) {
      strokeWeight(random(1.2, 2.8));
      stroke(c, random(120, 220));
      h = random(height);
      line(0, h, width, h);
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("134.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
