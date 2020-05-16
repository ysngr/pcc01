/* 130_20200517 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(215, 210, 220);

  final color[] cs = {
    color(184, 27, 48), 
    color(17, 6, 10), 
    color(206, 182, 88), 
    color(202, 70, 73), 
    color(78, 73, 82), 
    color(220, 210, 169), 
    color(105, 0, 34), 
    color(115, 79, 135)
  };

  int n = 1;
  for ( float h = 0; h < height; h += 100 ) {
    for ( float w = 0; w < width; w += 100 ) {
      stroke(cs[(int)random(cs.length)]);
      pushMatrix();
      translate(w+50, h+50);
      rotate(n*PI/25);
      for ( int i = 0; i < n; i++ ) {
        strokeWeight(random(2));
        line(-30, -30, 30, 30);
        rotate(PI/100);
      }
      popMatrix();
      n++;
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("130.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
