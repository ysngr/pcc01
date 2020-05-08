/* 109_20200422 */

void setup() {
  size(1000, 650);
  noLoop();
  textAlign(CENTER, CENTER);
}


void draw() {
  background(200);

  figure();
  for ( int i = 0; i < 30; i++ ) {
    clock();
  }
}


void figure() {

  final String s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTVWXYZ0123456789";

  for ( int i = 0; i < 1000; i++ ) {
    pushMatrix();
    translate(random(width), random(height));
    rotate(random(-PI, PI));
    fill(random(255), random(100, 200));
    textSize(random(8, 64));
    text(s.charAt((int)random(s.length())), 0, 0);
    popMatrix();
  }
  return ;
}


void clock() {

  float major, minor;
  float ratio;
  float hour, minute, second;
  float t;

  pushMatrix();
  translate(random(width), random(height));
  rotate(random(-PI, PI));

  major = random(50, 180);
  minor = random(50, 180);
  if ( major < minor ) {
    float tmp = major;
    major = minor;
    minor = tmp;
  }

  // shadow
  noStroke();
  fill(100, 80);
  ellipse(random(-25, 25), random(-25, 25), 2*minor, 2*major);
  // body
  strokeWeight(random(5, 10));
  stroke(random(180, 200), random(120, 180), random(20, 60));
  fill(random(245, 255));
  ellipse(0, 0, 2*minor, 2*major);

  // figure
  fill(0);
  int cnt = 1;
  ratio = random(0.7, 0.85);
  textSize(random(8, 20));
  for ( t = -PI/2+TWO_PI/12; t < 3*PI/2; t += TWO_PI/12 ) {
    text(cnt++, ratio*minor*cos(t), ratio*major*sin(t));
  }

  // hands
  second = 0.8 * minor;
  minute = 0.8 * minor;
  hour = 0.55 * minor;
  t = random(-PI, PI);
  strokeWeight(random(0.5, 0.8));
  stroke(0);
  line(0, 0, second*cos(t), second*sin(t));
  t = random(-PI, PI);
  strokeWeight(random(1.0, 1.5));
  line(0, 0, minute*cos(t), minute*sin(t));
  t = random(-PI, PI);
  strokeWeight(random(2.4, 3.0));
  line(0, 0, hour*cos(t), hour*sin(t));
  circle(0, 0, 3.5);

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("109.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
