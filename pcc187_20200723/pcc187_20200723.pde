/* 187_20200723 */

final float PSLEN = 1.0;
int[] ps;

void setup() {
  size(1150, 800);
  noLoop();
  strokeWeight(PSLEN);
}


void draw() {
  background(255);
  initPoints();
  for ( int h = 0; h < height; h += PSLEN ) {
    plotPoints(h);
    updatePoints();
  }
}


void initPoints() {

  ps = new int[(int)(width/PSLEN)];
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = ( random(100) < 50 )? 0 : 1;
  }

  return ;
}


void plotPoints(float h) {

  float w;

  for ( int i = 0; i < ps.length; i++ ) {
    w = PSLEN * i;
    if ( ps[i] != 0 ) {
      stroke(
        map(noise(w/200, h/250), 0, 1, 0, 255), 
        map(noise(w/150, h/280), 0, 1, 0, 255), 
        map(noise(w/180, h/220), 0, 1, 0, 255)
      );
    } else {
      stroke(240);
    }
    point(w, h);
  }

  return ;
}


void updatePoints() {

  int[] cps = new int[ps.length];
  for ( int i = 0; i < cps.length; i++ ) {
    cps[i] = ps[i];
  }

  ps[0] = update((( random(80) < 1 )? 0 : 1), cps[0], cps[1]);
  for ( int i = 1; i < ps.length-1; i++ ) {
    ps[i] = update(cps[i-1], cps[i], cps[i+1]);
  }
  ps[ps.length-1] = update(cps[cps.length-2], cps[cps.length-1], (( random(80) < 1 )? 0 : 1));

  return ;
}


int update(int l, int t, int r) {

  final int[] rule184table = {0, 0, 0, 1, 1, 1, 0, 1};

  return rule184table[4*l+2*t+r];
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("187.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
