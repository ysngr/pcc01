/* 163_20200610 */

ArrayList<PVector> ps;
ArrayList<PVector> cps;
ArrayList<PVector> rps;


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(225, 235, 214);
  initPoints();
  plot();
}


void initPoints() {

  final float sr = 0.1, er = 0.9;
  final int ROWNUM = 200;
  final float dw = 0.5;
  final float dh = (er - sr) * height / ROWNUM;

  ps = new ArrayList<PVector>();
  cps = new ArrayList<PVector>();
  rps = new ArrayList<PVector>();

  float r, t;
  for ( float h = sr*height; h <= er*height; h += dh ) {
    r = random(40);
    t = 0;
    for ( float w = sr*width; w < er*width; w += dw ) {
      ps.add(new PVector(w, h+r*cos(t)));
      t += PI/32;
    }
  }

  float ww, dww, wh, wr;
  for ( int i = 0; i < 10; i++ ) {
    ww =  random(sr, er) * width;
    dww = (( ww < width/2 )? 1.0 : -1.0) * random(5);
    wr = random(10, 20);
    for ( wh = sr*height; wh <= er*height; wh += dh ) {
      for ( int j = 0; j < ps.size(); j++ ) {
        if ( dist(ps.get(j).x, ps.get(j).y, ww, wh) < wr ) {
          if ( i == 0 ) {
            rps.add(ps.get(j));
          } else {
            cps.add(ps.get(j));
          }
          ps.remove(j--);
        }
      }
      ww += dww;
    }
  }

  return ;
}


void plot() {

  final color[] cs = {
    color(141, 198,  97), 
    color( 87, 170,  90), 
    color( 62, 107,  53), 
    color(175, 214, 152), 
    color(204, 223, 162), 
    color( 79, 141,  81), 
    color(196, 187, 161), 
    color( 56,  91,  65)
  };
  final color[] ccs = {
    color(163, 214, 206), 
    color(100, 187, 186), 
    color( 63, 171, 155), 
    color(133, 203, 191), 
    color(165, 213, 183), 
    color( 89, 188, 157), 
    color(100, 157, 112), 
    color( 48, 128, 152), 
    color( 74, 172, 188)
  };

  strokeWeight(2.0);
  
  for ( int i = 0; i < ps.size(); i++ ) {
    stroke(cs[(int)map(noise(ps.get(i).y), 0, 1, 0, cs.length-1)], random(100, 200));
    point(ps.get(i).x, ps.get(i).y);
  }

  for ( int i = 0; i < cps.size(); i++ ) {
    stroke(ccs[(int)map(noise(ps.get(i).y), 0, 1, 0, ccs.length-1)]);
    point(cps.get(i).x, cps.get(i).y);
  }

  for ( int i = 0; i < rps.size(); i++ ) {
    stroke(212, 62, 113, 140);
    point(rps.get(i).x, rps.get(i).y);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("163.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
