/* 191_20200724 */

void setup() {
  size(1150, 800);
  noLoop();
  textFont(createFont("HG正楷書体-PRO", 16));
}


void draw() {
  background(198, 175, 142);
  for ( int i = 0; i < 70; i++ ) {
    pushMatrix();
    translate(random(width), random(height));
    rotate(random(-PI, PI));
    maple(0, 0, random(220, 280));
    popMatrix();
  }
  waka();
}


void maple(float x, float y, float l) {

  final color[] cs = {
    color(226,  69,  31), 
    color(231, 117,  52), 
    color(189,  53,  41), 
    color(244, 164,  88), 
    color(226,  66,  31)
  };

  strokeWeight(5);
  stroke(cs[(int)random(cs.length)]);
  line(x, y, x+random(-10, 10), y-l/3);

  noStroke();
  fill(cs[(int)random(cs.length)]);

  float r = l/2;
  for ( float t = 0; t <= PI; t += PI/6 ) {
    leaf(x, y, r, t);
    r += (( t < HALF_PI )? 1 : -1) * l/6;
  }

  return ;
}


void leaf(float x, float y, float r, float t) {

  float ct = random(PI/12, PI/6);

  bezier(
    x                , y                , 
    x+2*r/5*cos(t-ct), y+2*r/5*sin(t-ct), 
    x+3*r/5*cos(t-ct), y+3*r/5*sin(t-ct), 
    x+r*cos(t)       , y+r*sin(t)
  );
  bezier(
    x                , y                , 
    x+2*r/5*cos(t+ct), y+2*r/5*sin(t+ct), 
    x+3*r/5*cos(t+ct), y+3*r/5*sin(t+ct), 
    x+r*cos(t)       , y+r*sin(t)
  );

  return ;
}


void waka() {

  final String waka = "このたびはぬさもとりあへず手向け山紅葉の錦神のまにまに";
  final color[] cs = {
    color(211, 210, 191), 
    color(231, 238, 243), 
    color(249, 241, 236), 
    color(244, 246, 241), 
    color(242, 243, 234), 
    color(220, 221, 210)
  };

  for ( int i = 0; i < 50; i++ ) { 
    fill(cs[(int)random(cs.length)], random(100, 200));
    textSize(random(32, 94));
    text(waka.charAt((int)random(waka.length())), random(width), random(height));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("191.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
