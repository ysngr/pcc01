/* 169_20200621 */

final color PDC = color(  0,   0,   0);
final color RBC = color(242, 241, 245);

ArrayList<Point> ps;


void setup() {
  size(1150, 800);
  noLoop();
  strokeWeight(1.4);
  noFill();
}


void draw() {
  predraw();
  initPoints();
  flow();
  diffCircles(2);
}


void predraw() {

  background(255);
  stroke(PDC);
  for ( int i = 0; i < 12; i++ ) {
    circle(random(width), random(height), random(80, 400));
  }

  return ;
}


void initPoints() {

  ps = new ArrayList<Point>();

  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      if ( isNearlyEqualCol(get(w, h), PDC) ) {
        ps.add(new Point(w, h));
      }
    }
  }

  return ;
}


boolean isNearlyEqualCol(color c1, color c2) {

  final float e = 20;

  if ( abs(red(c1) - red(c2)) > e ) {
    return false;
  }
  if ( abs(green(c1) - green(c2)) > e ) {
    return false;
  }
  if ( abs(blue(c1) - blue(c2)) > e ) {
    return false;
  }

  return true;
}


void flow() {

  background(RBC);
  
  for ( int i = 0; i < 2000; i++ ) {
    for ( Point p : ps ) {
      p.plot();
      p.update();
    }
  }

  return ;
}


void diffCircles(int n) {

  blendMode(DIFFERENCE);
  noStroke();
  fill(RBC, 220);

  for ( int i = 0; i < n; i++ ) {
    circle(random(width), random(height), random(80, 400));
  }
  
  blendMode(BLEND);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("169.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
