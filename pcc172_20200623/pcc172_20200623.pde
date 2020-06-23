/* 172_20200623 */

ArrayList<Point> ps;

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
  strokeWeight(1.4);
}


void draw() {
  background(107, 81, 70);
  for ( int i = 0; i < 3; i++ ) {
    initPoints();
    for ( Point p : ps ) {
      for ( int j = 0; j < 800; j++ ) {
        p.plot();
        p.update();
      }
    }
  }
}


void initPoints() {

  ps = new ArrayList<Point>();

  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      if ( random(500) < 1 ) {
        ps.add(new Point(w, h));
      }
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("172.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
