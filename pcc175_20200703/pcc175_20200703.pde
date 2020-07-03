/* 175_20200703 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(50);
  aurora();
  rstars(3800);
  milkyway();
  rwindsocks();
}


void aurora() {

  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      stroke(
        noise(w/200, h/300) * 120, 
        noise(w/300, h/200) * 140, 
        random(120, 200)
      );
      point(w, h);
    }
  }

  return ;
}


void rstars(int n) {

  for ( int i = 0; i < n; i++ ) {
    star(random(width), random(height));
  }

  return ;
}


void star(float x, float y) {

  final color[] cs = {
    color(248, 181, 0), 
    color(238, 235, 221), 
    color(234, 235, 229), 
    color(244, 246, 241)
  };
  final String s = "'+*,.";

  fill(cs[(int)random(cs.length)], random(180, 255));
  textSize(random(6, 14));
  text(s.charAt((int)random(s.length())), x, y);

  return ;
}


void milkyway() {

  float w, h;

  for ( w = 0; w < width; w += random(2, 10) ) {
    h = height/(1 + exp(-6*(w-width/2)/width));
    for ( int i = 0; i < 80; i++ ) {
      star(w+random(-40, 40), h+random(-200, 200));
    }
  }

  return ;
}


void rwindsocks() {

  final color[] cs = {
    color(234,  85,  75), 
    color(251, 203, 103), 
    color(159, 192, 141), 
    color( 82, 177, 187), 
    color(150, 205, 196), 
    color(175,  98, 154)
  };

  for ( color c : cs ) {
    windsock(random(width), random(height), random(150, 220), c);
  }

  return ;
}


void windsock(float x, float y, float d, color c) {

  float a, w, h, amp, t;

  noiseSeed(3701);

  for ( int i = 0; i < 200; i++ ) {
    a = 1;
    w = x + random(-120, 120);
    h = y + random(-120, 120);
    amp = random(10);
    for ( int j = 0; j < 100; j++ ) {
      stroke(c, a);
      point(w, h); 
      t = 10 * noise(w/width, h/height); 
      a += random(4, 8);
      w -= amp * cos(t); 
      h += amp * sin(t); 
      amp += random(0.02);
    }
  }

  deccircle(x, y, d, c);

  return;
}


void deccircle(float x, float y, float r, color c) {

  float mr; 

  noStroke(); 
  fill(c, 5); 

  for ( int i = 0; i < 50; i++ ) {
    mr = random(10, r/4); 
    while ( r > mr ) {
      circle(x, y, 2*r); 
      x += random(-1, 1); 
      y += random(-1, 1); 
      r -= random(1, 3);
    }
  }

  return;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("175.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
