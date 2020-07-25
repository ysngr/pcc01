class Point {

  private float x, y, px, py;
  private float vx, vy;
  private float ax, ay;
  private color c;
  private float a, da;


  Point(float x, float y, float vx, float vy, color c) {
    this.x = x;
    this.y = y;
    this.px = x;
    this.py = y;
    this.vx = vx;
    this.vy = vy;
    this.ax = 0;
    this.ay = random(0.05, 0.10);
    this.c = c;
    this.a = 220;
    this.da = 4;
  }


  public void update() {

    this.px = x;
    this.py = y;
    this.x += vx;
    this.y += vy;
    this.vx += ax;
    this.vy += ay;
    if ( (this.a += da) >= 255 ) {
      this.da = -5;
    }

    return ;
  }


  public void plot() {

    stroke(c, a);
    line(px, py, x, y);

    return ;
  }
}
