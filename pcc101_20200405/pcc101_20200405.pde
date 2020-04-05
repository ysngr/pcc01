/* 101_20200405 */

void setup() {
  size(1170, 820);
  background(0);
  noLoop();
}


void draw() {
  for ( float h = 10; h < height; h += 90 ) {
    for ( float w = -random(120); w < width; w += 120 ) {
      octaveKey(w, h);
    }
  }
}


void octaveKey(float sx, float sy) {

  final float WIDTHWU = 10.0  , HEIGHTWU = 50.0;
  final float WIDTHWL = 17.143, HEIGHTWL = 30.0;
  final float WIDTHB  = 10.0  , HEIGHTB  = 50.0;
  final float KEYHEIGHT = HEIGHTWU + HEIGHTWL;

  float x;

  /* key */
  noStroke();
  // upper (C ~ E)
  x = sx;
  for ( int i = 0; i < 2; i++ ) { 
    x += brect(x, sy, WIDTHWU, HEIGHTWU);
    x += wrect(x, sy, WIDTHB , HEIGHTB );
  }
  x += brect(x, sy, WIDTHWU, HEIGHTWU);
  // upper (F ~ H)
  for ( int i = 0; i < 3; i++ ) {
    x += brect(x, sy, WIDTHWU, HEIGHTWU);
    x += wrect(x, sy, WIDTHB , HEIGHTB );
  }
  brect(x, sy, WIDTHWU, HEIGHTWU);
  // lower
  x = sx;
  for ( int i = 0; i < 7; i++ ) {
    x += brect(x, sy+HEIGHTB, WIDTHWL, HEIGHTWL);
  }

  /* line */
  stroke(0);
  x = sx;
  for ( int i = 0; i < 8; i++ ) {
    line(x, sy, x, sy+KEYHEIGHT);
    x += WIDTHWL;
  }
  line(sx, sy          , sx+7*WIDTHWL, sy          );
  line(sx, sy+KEYHEIGHT, sx+7*WIDTHWL, sy+KEYHEIGHT);

  return ;
}


float brect(float x, float y, float w, float h) {

  fill(240);
  rect(x, y, w, h);

  return w;
}


float wrect(float x, float y, float w, float h) {

  fill(0);
  rect(x, y, w, h);

  return w;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("101.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
