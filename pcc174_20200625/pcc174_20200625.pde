/* 174_20200625 */

void setup() {
  size(1000, 1000);
  noLoop();
  noFill();
}


void draw() {
  background(214, 210, 224);
  for ( int i = 0; i < 17; i++ ) {
    tris(random(width), random(height), (int)random(12, 16), (int)random(4));
  }
}


void tris(float x, float y, int n, int idx) {

  final color[][] cs = {
    {
      color(219, 211, 229), 
      color(188, 207, 228), 
      color(200, 210, 221), 
      color(233, 229, 219), 
      color( 65,  92, 126), 
      color( 89, 107, 128), 
      color(161, 168, 156)
    }, 
    {
      color(191, 198, 172), 
      color(219, 212, 184), 
      color(247, 226, 214), 
      color(237, 175, 167), 
      color(213, 175, 167), 
      color(213, 112, 105), 
      color(210,  65,  71), 
      color(177, 122,  93), 
      color( 90,  80,  63), 
      color( 54,  45,  51)
    }, 
    {
      color(163, 214, 206), 
      color(100, 187, 186), 
      color( 63, 171, 155), 
      color(133, 203, 191), 
      color(165, 213, 183), 
      color( 89, 188, 157), 
      color(100, 157, 112), 
      color( 74, 172, 188)
    }, 
    {
      color(198, 183, 217), 
      color(166, 111, 167), 
      color(131,  92, 143), 
      color(242, 226, 238), 
      color(209, 172, 175), 
      color(174, 150, 165), 
      color(205, 200, 185), 
      color(211, 177, 141), 
      color(151, 129, 127)
    }
  };

  if ( n < 0 ) {
    return ;
  }

  float dx1, dy1, dx2, dy2;

  dx1 = random(-1, 1) * 50;
  dy1 = random(-1, 1) * 50;
  dx2 = random(-1, 1) * 50; 
  dy2 = random(-1, 1) * 50;

  noStroke();
  fill(cs[idx][(int)random(cs[idx].length)]);
  triangle(x, y, x+dx1, y+dy1, x+dx2, y+dy2);

  if ( random(2) < 1 ) {
    tris(x, y, n-1, idx);
  }
  if ( random(2) < 1 ) {
    tris(x+dx1, y+dy1, n-1, idx);
  }
  if ( random(2) < 1 ) {
    tris(x+dx2, y+dy2, n-1, idx);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("174.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
