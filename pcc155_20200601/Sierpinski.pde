/* Sierpiinski */

class Sierpinski {

  final color[] cs = {
    color(234,  85,  75), 
    color( 82, 177, 187), 
    color(251, 203, 103), 
    color(175,  98, 154), 
    color(192, 184,  95), 
    color(159, 192, 141), 
    color(179, 120,  85), 
    color(150, 205, 196), 
    color(134, 107,  49), 
    color(232,  56,  40), 
    color(103, 190, 141), 
    color(248, 181,   0), 
    color(252, 212, 117), 
    color(174, 211, 237), 
    color(207,   0,  96), 
    color(  0, 124,  69), 
  };
  final float D = 1.2;

  int mod;
  float th, dh;
  float s;
  ArrayList<PVector> ps;
  color c;


  Sierpinski(float tx, float ty, float by, int mod) {
    this.mod = mod;
    this.th = abs(by - ty);
    this.dh = th / D;
    this.s = ( ty < by )? 1.0 : -1.0;
    ps = new ArrayList<PVector>();
    this.initializePoints(tx, ty+s*D, 1);
    this.setColor();
  }


  void initializePoints(float x, float y, int dpt) {

    for ( int i = 0; i < dpt; i++ ) {
      if ( i == 0 || i == dpt-1 ) {
        ps.add(new PVector(x+s*D*i, y, 1));
      } else {
        ps.add(new PVector(x+s*D*i, y, getSumModOf(dpt, i)));
      }
    }

    if ( (dpt+1)*sqrt(3)*D/2 < this.th ) {
      initializePoints(x-s*D/2, y+s*D*sqrt(3)/2, dpt+1);
    }

    return ;
  }


  int getNumOf(int d, int c) {
    return (int)(ps.get((int)((d-1)*d/2+c)).z);
  }


  int getSumModOf(int d, int c) {
    return (getNumOf(d-1, c-1) + getNumOf(d-1, c)) % mod;
  }


  void setColor() {
    this.c = cs[(int)random(cs.length)];
    return ;
  }


  void plot() {

    PVector p;
    for ( int i = 0; i < ps.size(); i++ ) {
      p = ps.get(i);
      noStroke();
      this.plotColor((int)p.z);
      circle(p.x, p.y, D);
    }

    return ;
  }


  void plotColor(int num) {

    if ( num % mod == 0 ) {
      fill(this.c, 255);
    } else {
      noFill();
    }

    return ;
  }
}
