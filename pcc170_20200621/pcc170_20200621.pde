/* 170_20200621 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(45, 44, 45);
  for ( int i = 0; i < 38; i++ ) {
    dcircle(random(width), random(height), random(320, 420));
  }
}


void dcircle(float x, float y, float d) {

  color[] cs = selectColor(5);
  float r, dx, dy, xs, ys;
  int ci;

  noStroke();
  r = d / 2;
  ci = 0;
  xs = random(999);
  ys = random(999);

  while ( r > 10 ) {
    dx = map(noise(xs), 0, 1, -4, 4);
    dy = map(noise(ys), 0, 1, -4, 4);
    fill(cs[ci], 3);
    circle(x+dx, y+dy, 2*r);
    ci = (ci + 1) % cs.length;
    r -= random(0.7, 1.0);
    xs += 0.001;
    ys += 0.001;
  }

  return ;
}


color[] selectColor(int n) {

  final color[][] cd = {
    {
      color(116, 143,  95), 
      color( 97, 104,  53), 
      color( 92,  87,  50), 
      color(132, 141, 127), 
      color( 28,  73,  54), 
      color( 52,  55,  52), 
      color(210, 105,  52), 
      color(175,  78,  33), 
      color(230, 230, 212)
    }, 
    {
      color(241, 205, 189), 
      color(195, 144, 150), 
      color(153,  89, 110), 
      color(245, 175, 120), 
      color(253, 225, 176), 
      color(244, 170, 150), 
      color(101,  89,  93), 
      color(255, 246, 233), 
      color( 79,  50,  53)
    }, 
    {
      color(243, 226, 207), 
      color(227, 205, 186), 
      color(255, 252, 242), 
      color(227, 240, 250), 
      color(190, 204, 221), 
      color(157, 174, 189), 
      color(193, 185, 179), 
      color(154, 139, 125), 
      color(123,  97,  84)
    }
  };

  int[] is = new int[n];
  color[] cs = cd[(int)random(cd.length)];
  color[] c = new color[n];

  for ( int i = 0; i < is.length; i++ ) {
    do {
      is[i] = (int)random(cs.length);
    } while ( hasSameNum(is, i) );
  }

  for ( int i = 0; i < c.length; i++ ) {
    c[i] = cs[is[i]];
  }

  return c;
}


boolean hasSameNum(int[] xs, int idx) {

  for ( int i = 0; i <= idx; i++ ) {
    for ( int j = 0; j < i; j++ ) {
      if ( xs[i] == xs[j] ) {
        return true;
      }
    }
  }

  return false;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("170.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
