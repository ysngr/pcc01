/* 138_20200518 */

void setup() {
  size(1150, 800);
  noLoop();
  strokeWeight(0.5);
  noFill();
}


void draw() {
  background(211, 210, 191);
  
  for ( int i = 0; i < 2; i++ ) {
    releaseSnake(color(217, 117,  86));
    releaseSnake(color(224, 140, 122));
    releaseSnake(color(241, 173,  95));
  }
  releaseSnake(color(225, 198, 192));
  releaseSnake(color(149, 155, 169));
  releaseSnake(color( 62,  87, 112));
}


void releaseSnake(color c) {

  boolean isRotate;
  float d, a, t, dt, w, h, rh;

  isRotate = ( random(3) < 2 )? true : false;

  if ( isRotate ) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(random(-PI, PI));
    translate(-width/2, -height/2);
  }

  d = random(10, 40);
  a = random(20, 40);
  t = 0;
  dt = map(a, 20, 40, PI/64, PI/128);
  w = width;
  rh = random(height);
  for ( int i = 0; i < 550; i++ ) {
    h = rh + a * cos(t);
    stroke(c, map(i, 550, 0, 1, 180));
    circle(w, h, d);
    t += dt;
    w -= 1.5;
    d += random(0.4);
  }

  if ( isRotate ) {
    popMatrix();
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("138.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
