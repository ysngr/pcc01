/* 164_20200610 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(0);
  baurora(0, 0, width, height);
  divArea(0.1*width, 0.1*height, 0.8*width, 0.8*height);
}


void divArea(float x, float y, float w, float h) {

  if ( w < 500 || h < 500 ) {
    if ( w < 20 || h < 20 || random(10) < 3 ) {
      aurora(x, y, w, h);
      return ;
    }
  }

  float wr = random(0.4, 0.6);
  float hr = random(0.4, 0.6);

  divArea(x     , y     , w*wr    , h*hr    );
  divArea(x+w*wr, y     , w*(1-wr), h*hr    );
  divArea(x     , y+h*hr, w*wr    , h*(1-hr));
  divArea(x+w*wr, y+h*hr, w*(1-wr), h*(1-hr));

  return ;
}


void aurora(float x, float y, float w, float h) {

  float rw = random(120, 240);
  float rh = random(120, 240);
  float gw = random(120, 240);
  float gh = random(120, 240);
  float bw = random(120, 240);
  float bh = random(120, 240);

  float rs = random(  0, 128);
  float re = random(128, 255);
  float gs = random(  0, 128);
  float ge = random(128, 255);
  float bs = random(  0, 128);
  float be = random(128, 255);

  noStroke();
  fill(0);
  rect(x, y, w, h);

  blendMode(SCREEN);
  strokeWeight(2.0);
  
  for ( float ph = y; ph < y+h; ph++ ) {
    for ( float pw = x; pw < x+w; pw++ ) {
      stroke( 
        map(noise(pw/rw, ph/rh), 0, 1, rs, re), 
        map(noise(pw/gw, ph/gh), 0, 1, gs, ge), 
        map(noise(pw/bw, ph/bh), 0, 1, bs, be), 
        random(120, 180)
      );
      point(pw, ph);
    }
  }

  return ;
}


void baurora(float x, float y, float w, float h) {

  float rw = random(300, 600);
  float rh = random(300, 600);
  float gw = random(300, 600);
  float gh = random(300, 600);
  float bw = random(300, 600);
  float bh = random(300, 600);

  blendMode(BLEND);
  strokeWeight(2.0);
  
  for ( float ph = y; ph < y+h; ph++ ) {
    for ( float pw = x; pw < x+w; pw++ ) {
      stroke( 
        map(noise(pw/rw, ph/rh), 0, 1,   0, 255), 
        map(noise(pw/gw, ph/gh), 0, 1,   0, 120), 
        map(noise(pw/bw, ph/bh), 0, 1, 100, 255), 
        random(120, 180)
      );
      point(pw, ph);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("164.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
