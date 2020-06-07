/* 162_20200608 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(255);
  noisyBackground(244, 246, 241);

  final float L = 100;
  float l;

  translate(width/2, height/2);
  rotate(PI/19);
  translate(-width/2, -height/2);

  for ( float h = L/2; h < height; h += L ) {
    for ( float w = L/2; w < width; w += L ) {
      l = map(noise(w/width, h/height), 0, 1, 0.5, 1.4) * L;
      switch( (int)random(3.8) ) {
        case 0 : trif(w, h, l); break;
        case 1 : sqrf(w, h, l); break;
        case 2 : hxgf(w, h, l); break;
        default :
      }
    }
  }
}


void noisyBackground(float r, float g, float b) {

  strokeWeight(1.5);
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      stroke(
        map(noise(w/200, h/200), 0, 1, 0.5*r, r), 
        map(noise(w/200, h/200), 0, 1, 0.5*g, g), 
        map(noise(w/200, h/200), 0, 1, 0.5*b, b),
        random(100, 240)
        );
      point(w, h);
    }
  }

  return ;
}


void trif(float x, float y, float l) {

  final int maxidx = 3;

  IntList funcidx = new IntList(0, 1, 2, 3);
  float tr = random(0.4*l, 0.6*l);
  float cr = random(1.4*tr, 1.8*tr);
  float sw = random(1.8, 5.5);
  color sc = selectColor();
  color fc = selectColor();

  do {
    funcidx.shuffle();
  } while ( funcidx.get(0) == maxidx || funcidx.get(maxidx) == maxidx );

  for ( int i : funcidx ) {
    switch( i ) {
    case 0 : 
      strokeWeight(sw);
      stroke(sc);
      line(x, y-tr, x+sqrt(3)*tr/2, y+tr/2);
      break;
    case 1 :
      strokeWeight(sw);
      stroke(sc);
      line(x+sqrt(3)*tr/2, y+tr/2, x-sqrt(3)*tr/2, y+tr/2);
      break;
    case 2 : 
      strokeWeight(sw);
      stroke(sc);
      line(x-sqrt(3)*tr/2, y+tr/2, x, y-tr);
      break;
    case 3 :
      noStroke();
      fill(fc);
      circle(x, y, cr);
      break;
    }
  }

  return ;
}


void sqrf(float x, float y, float l) {

  final int maxidx = 4;

  IntList funcidx = new IntList(0, 1, 2, 3, 4);
  float sr = random(0.32*l, 0.46*l);
  float cr = random(2.2*sr, 2.7*sr);
  float sw = random(1.8, 5.5);
  color sc = selectColor();
  color fc = selectColor();

  do {
    funcidx.shuffle();
  } while ( funcidx.get(0) == maxidx || funcidx.get(maxidx) == maxidx );

  for ( int i : funcidx ) {
    switch( i ) {
    case 0 : 
      strokeWeight(sw);
      stroke(sc);
      line(x-sr, y-sr, x+sr, y-sr);
      break;
    case 1 :
      strokeWeight(sw);
      stroke(sc);
      line(x+sr, y-sr, x+sr, y+sr);
      break;
    case 2 : 
      strokeWeight(sw);
      stroke(sc);
      line(x+sr, y+sr, x-sr, y+sr);
      break;
    case 3 :
      strokeWeight(sw);
      stroke(sc);
      line(x-sr, y+sr, x-sr, y-sr);
      break;
    case 4 :
      noStroke();
      fill(fc);
      circle(x, y, cr);
      break;
    }
  }

  return ;
}


void hxgf(float x, float y, float l) {

  final int maxidx = 6;

  IntList funcidx = new IntList(0, 1, 2, 3, 4, 5, 6);
  float tr = random(0.32*l, 0.46*l);
  float cr = random(1.88*tr, 2.05*tr);
  float sw = random(3.5, 5.5);
  color sc = selectColor();
  color fc = selectColor();

  do {
    funcidx.shuffle();
  } while ( funcidx.get(0) == maxidx || funcidx.get(maxidx) == maxidx );

  for ( int i : funcidx ) {
    switch( i ) {
    case 0 : 
      strokeWeight(sw);
      stroke(sc);
      line(x, y-tr, x+tr*sqrt(3)/2, y-tr/2);
      break;
    case 1 :
      strokeWeight(sw);
      stroke(sc);
      line(x+tr*sqrt(3)/2, y-tr/2, x+tr*sqrt(3)/2, y+tr/2);
      break;
    case 2 : 
      strokeWeight(sw);
      stroke(sc);
      line(x+tr*sqrt(3)/2, y+tr/2, x, y+tr);
      break;
    case 3 :
      strokeWeight(sw);
      stroke(sc);
      line(x, y+tr, x-tr*sqrt(3)/2, y+tr/2);
      break;
    case 4 :
      strokeWeight(sw);
      stroke(sc);
      line(x-tr*sqrt(3)/2, y+tr/2, x-tr*sqrt(3)/2, y-tr/2);
      break;
    case 5 :
      strokeWeight(sw);
      stroke(sc);
      line(x-tr*sqrt(3)/2, y-tr/2, x, y-tr);
      break;
    case 6 :
      noStroke();
      fill(fc);
      circle(x, y, cr);
      break;
    }
  }

  return ;
}


color selectColor() {

  final color cs[] = {
    color(184,  27,  48), 
    color( 17,   6,  10), 
    color(206, 182,  88), 
    color(202,  70,  73), 
    color( 78,  73,  82), 
    color(220, 210, 169), 
    color(105,   0,  34), 
    color(215, 210, 220), 
    color(115,  79, 135)
  };

  return cs[(int)random(cs.length)];
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("162.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
