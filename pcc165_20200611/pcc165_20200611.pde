/* 165_20200611 */

void setup() {
  size(1150, 800);
  noLoop();
  noStroke();
}


void draw() {
  background(147, 85, 108);
  divTriArea(0.05*width, 0.05*height, 0.9*width, 0.9*height);
}


void divTriArea(float x, float y, float w, float h) {

  rctriangle(x, y, x, y+h, x+w, y+h);
  rctriangle(x, y, x+w, y, x+w, y+h);

  if ( w < 100 || h < 100 ) {
    if ( w < 10 || h < 10 || random(10) < 3 ) {
      return ;
    }
  }

  divTriArea(x      , y+h/4  , w/4, h/4);
  divTriArea(x+w/4  , y      , w/4, h/4);
  divTriArea(x+w/2  , y      , w/2, h/2);
  divTriArea(x      , y+h/2  , w/2, h/2);
  divTriArea(x+w/2  , y+3*h/4, w/4, h/4);
  divTriArea(x+3*w/4, y+h/2  , w/4, h/4);

  return ;
}


void rctriangle(float x1, float y1, float x2, float y2, float x3, float y3) {

  final color[] cs = {
    color(159,  33,  88), 
    color(120,  34,  85), 
    color(165, 132, 144), 
    color(236, 209, 191), 
    color(187,  85,  72), 
    color(  0, 125, 142), 
    color(107,  81,  70), 
    color( 75,  26,  71), 
    color(220, 221, 178)
  };

  fill(cs[(int)random(cs.length)]);
  triangle(x1, y1, x2, y2, x3, y3);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("165.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
