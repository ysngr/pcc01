/* 119_20200503 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(0);
  lineUpTile();
  putDiffCircle();
}


void lineUpTile() {

  final float TILESIZE = 25.0;

  blendMode(SCREEN);

  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/4);

  strokeWeight(2.8);
  stroke(30, 160, 65);
  for ( float h = -sqrt(2)*height/2; h < sqrt(2)*height/2; h += TILESIZE ) {
    for ( float w = -sqrt(2)*width/2; w < sqrt(2)*width/2; w += TILESIZE ) {
      fill(random(40, 80), random(80, 200), random(180, 255));
      square(w, h, TILESIZE*noise(w*h));
    }
  }

  popMatrix();

  return ;
}


void putDiffCircle() {

  float x, y, rad;
  color c;

  strokeWeight(3.0);

  for ( int i = 0; i < 12; i++ ) {
    if ( random(8) < 1 ) {
      blendMode(ADD);
    } else {
      blendMode(DIFFERENCE);
    }

    x = random(width);
    y = random(height);
    rad = random(40, 240);
    noStroke();
    fill(random(255), random(255), random(255), 200);
    circle(x, y, 2*rad);

    c = color(random(255), random(255), random(255));
    noFill();
    for ( float r = rad; r < rad+50; r += 0.8 ) {
      stroke(c, map(r, rad, rad+50, 150, 10));
      circle(x, y, 2*r);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("119.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
