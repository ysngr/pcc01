class Point {

  final color[] cs = {
    color(218,  65,  72), 
    color(208,  15,  49), 
    color(165,  26,  41), 
    color( 79,  53,  39), 
    color( 68,  81,  54), 
    color( 33,  22,  10), 
    color(240, 208, 129), 
  };

  PVector p;
  color c;
  float amp, t;

  Point(float x, float y) {
    p = new PVector(x, y);
    c = cs[(int)random(cs.length)];
    amp = 0;
  }

  void plot() {
    stroke(c, 220);
    point(p.x, p.y);
  }

  void update() {
    t = 10 * noise(p.x/width, p.y/height);
    p.x += amp * cos(t);
    p.y += amp * sin(t);
    amp += random(0.002);
  }
}
