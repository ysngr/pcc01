/* 129_20200517 */

void setup() {
  size(1150, 800);
  noLoop();
  noFill();
}


void draw() {
  background(251, 250, 243);

  final color[] cs = {
    color(232, 56, 40), 
    color(103, 190, 141), 
    color(248, 181, 0), 
    color(252, 212, 117), 
    color(174, 211, 237), 
    color(207, 0, 96), 
    color(0, 124, 69), 
    color(42, 33, 32)
  };

  for ( color c : cs ) {
    for ( int i = 0; i < 2; i++ ) {
      drawing(c);
    }
  }
}


void drawing(color c) {

  final float mind = 20, maxd = 65;

  float x, y, d, s;

  x = random(width);
  y = random(height);
  d = random(mind, maxd);

  strokeWeight(map(d, mind, maxd, 1.8, 6.8));
  stroke(c, map(d, mind, maxd, 200, 120));

  for ( int i = 0; i < 320; i++ ) {
    if ( ! isInCanvas(x, y) ) {
      break;
    }
    
    s = ( random(2) < 1 )? 1.0 : -1.0;
    switch( (int)random(5) ) {
    case 0 : 
      line(x, y, x+s*d, y);
      x += s*d;
      break;
    case 1 :
      line(x, y, x, y+s*d);
      y += s*d;
      break;
    case 2 :
      if ( random(2) < 1 ) {
        arc(x, y+d/2, d, d, -3*HALF_PI, -HALF_PI);
      } else {
        arc(x, y+d/2, d, d, -HALF_PI, HALF_PI);
      }
      y += d;
      break;
    case 3 :
      if ( random(2) < 1 ) {
        arc(x, y-d/2, d, d, -HALF_PI, HALF_PI);
      } else {
        arc(x, y-d/2, d, d, HALF_PI, 3*HALF_PI);
      }
      y -= d;
      break;
    case 4 :
      if ( random(2) < 1 ) {
        arc(x+s*d/2, y, d, d, 0, PI);
      } else {
        arc(x+s*d/2, y, d, d, -PI, 0);
      }
      x += s*d;
      break;
    }
  }

  return ;
}


boolean isInCanvas(float x, float y) {

  if ( x < 0 || width < x ) {
    return false;
  }
  if ( y < 0 || height < y ) {
    return false;
  }

  return true;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("129.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
