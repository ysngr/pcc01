/* 104_20200410 */

void setup() {
  size(1000, 800);
  noLoop();
  noStroke();
}


void draw() {
  background(0);

  final float DW = 70.0, DH = 80.0;
  final float TRIWIDTH = 60.0, TRIHEIGHT = 60.0;
  final float GUTTER = 6.5;

  color cu, cl;

  for ( float h = -random(DH-TRIHEIGHT); h < height+DH; h += DH ) {
    cu = color(random(0, 128), random(0, 128), random(0, 128));
    cl = color(random(230, 260), random(230, 260), random(230, 260));
    for ( float w = -DW-random(DW-TRIWIDTH); w < width+DW; w += DW ) {
      fill(cu);
      cu = color(red(cu)+random(10, 20), green(cu)+random(10, 20), blue(cu)+random(10, 20));
      triangle(w, h, w+TRIWIDTH, h, w+TRIWIDTH/2, h-TRIHEIGHT);
      h += GUTTER;
      fill(cl);
      cl = color(red(cl)-random(15), green(cl)-random(15), blue(cl)-random(15));
      triangle(w+DW/2, h, w+DW/2+TRIWIDTH, h, w+DW/2+TRIWIDTH/2, h+TRIHEIGHT);
      h -= GUTTER;
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("104.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
