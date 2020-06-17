/* 167_2020 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(0);
  auroraback();
  decCircle(25);
}


void auroraback() {

  strokeWeight(2.0);

  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      stroke(
        noise(w/400, h/200) * 255, 
        noise(w/300, h/300) * 255, 
        noise(w/200, h/400) * 255
        );
      point(w, h);
    }
  }

  return ;
}


void decCircle(int n) {

  final color[] cs = {
    color(240, 145, 153), 
    color(242, 160, 161), 
    color(254, 244, 244), 
    color(239, 132, 104), 
    color(244, 165, 131), 
    color(252, 226, 196), 
    color(185,  64,  71)
  };

  float x, y, r, mr;

  noStroke();
  for ( int i = 0; i < n; i++ ) {
    fill(cs[(int)random(cs.length)], 5);
    x = random(width);
    y = random(height);
    r = random(120, 240);
    mr = random(10, r/4);
    while ( r > mr ) {
      circle(x, y, 2*r);
      r -= random(1, 3);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("167.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
