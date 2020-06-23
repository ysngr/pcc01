class Point {

  final color[] cs = {
    color(159,  33,  88), 
    color(120,  34,  85), 
    color(165, 132, 144), 
    color(236, 209, 191), 
    color(187,  85,  72), 
    color(  0, 125, 142), 
    color( 75,  26,  71), 
    color(220, 211, 176)
  };

  PVector p;
  color c;
  float amp, ta, t;

  Point(float x, float y) {
    p = new PVector(x, y);
    c = cs[(int)random(cs.length)];
    ta = map(noise(x/width, y/height), 0, 1, 9, 11);
    amp = 0;
  }

  void plot() {
    stroke(c, 40);
    point(p.x, p.y);
  }

  void update() {
    t = ta * noise(p.x/width, p.y/height);
    p.x += amp * cos(t);
    p.y += amp * sin(t);
    amp += random(0.002);
  }
}
