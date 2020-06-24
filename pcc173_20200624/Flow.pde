class Flow {

  private ArrayList<float[]> ps;


  Flow(float lx, float ly, float rx, float ry) {
    initPoints(lx, ly, rx, ry);
  }


  private void initPoints(float lx, float ly, float rx, float ry) {

    float x, y, t;
    color c;
    float d = dist(lx, ly, rx, ry);
    float dx = (rx - lx) / d;
    float dy = (ry - ly) / d;

    ps = new ArrayList<float[]>();

    for ( x = lx, y = ly; !isNearlyEqual(x, y, rx, ry); x += dx, y += dy) {
      if ( ! isInCanvas(x, y) ) {
        break;
      }
      t = map(noise(x/width, y/height), 0, 1, 9, 11);
      c = get((int)x, (int)y);
      float[] p = {x, y, t, 0, red(c), green(c), blue(c)};
      ps.add(p);
    }

    return ;
  }


  private boolean isNearlyEqual(float x1, float y1, float x2, float y2) {

    final float epsilon = 1.0;

    if ( abs(x1 - x2) > epsilon ) {
      return false;
    }
    if ( abs(y1 - y2) > epsilon ) {
      return false;
    }

    return true;
  }


  private boolean isInCanvas(float x, float y) {

    if ( x < 0 || width < x ) {
      return false;
    }
    if ( y < 0 || height < y ) {
      return false;
    }

    return true;
  }


  public void plot() {

    float[] p; 

    for ( int i = 0; i < ps.size(); i++ ) {
      p = ps.get(i);
      stroke(p[4], p[5], p[6]);
      point(p[0], p[1]);
    }

    return ;
  }


  public void update() {

    float[] p;
    float t;

    for ( int i = 0; i < ps.size(); i++ ) {
      p = ps.get(i);
      t = p[2] * noise(p[0]/width, p[1]/height);
      p[0] += p[3] * cos(t);
      p[1] += p[3] * sin(t);
      p[3] += random(0.002);
    }

    return ;
  }
}
