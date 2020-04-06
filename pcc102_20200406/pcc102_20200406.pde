/* 102_20200406 */

void setup() {
  size(1000, 1000);
  noLoop();
  noStroke();
  textFont(createFont("HGS教科書体", 16));
}


void draw() {
  background(240);

  char[] cs;
  float tsize, tcol;
  float w, h;

  cs = loadText("manajo.txt");
  tsize = random(8, 80);
  tcol = random(255);
  w = random(width);
  h = random(height);

  for ( int i = 0; i < cs.length; i++ ) {
    textSize(tsize);
    fill(tcol);
    text(cs[i], w, h);
    if ( random(10) < 1 ) {
      tcol = random(255);
    }
    if ( random(10) < 4 ) {
      tsize = random(8, 80);
    }
    w += sign() * random(tsize/2, tsize);
    h += sign() * random(tsize/2, tsize);
    if ( ! isInCanvas(w, h) ) {
      w = random(width);
      h = random(height);
    }
  }
}


char[] loadText(String filename) {

  String[] ls;
  char[] cs;
  int ci;

  ls = loadStrings(filename);
  ci = 0;
  for ( int i = 0; i < ls.length; i++ ) {
    ci += ls[i].length();
  }
  cs = new char[ci];

  ci = 0;
  for ( int i = 0; i < ls.length; i++ ) {
    for ( int j = 0; j < ls[i].length(); j++ ) {
      cs[ci++] = ls[i].charAt(j);
    }
  }

  return cs;
}


float sign() {
  return ( ( random(2) < 1 )? 1.0 : -1.0 );
}


boolean isInCanvas(float w, float h) {

  if ( w < 0 || w > width ) {
    return false;
  }
  if ( h < 0 || h > height ) {
    return false;
  }

  return true;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("102.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
