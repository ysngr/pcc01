/* 139_20200518 */

void setup() {
  size(1000, 1000);
  noLoop();
  noFill();
}


void draw() {
  background(255);
  backsmoke();
  divArea(0, 0, width, height);
}


void divArea(float x, float y, float w, float h) {

  if ( w < 500 && h < 500 ) {
    if ( w < 12.5 || h < 12.5 || random(100) < 20 ) {
      drawNet(x, y, w, h);
      return ;
    }
  }

  divArea(x    , y    , w/2, h/2);  
  divArea(x+w/2, y    , w/2, h/2);  
  divArea(x    , y+w/2, w/2, h/2);  
  divArea(x+w/2, y+w/2, w/2, h/2);

  return ;
}


void drawNet(float sw, float sh, float lw, float lh) {

  final color[] cs = {
    color(235, 230, 237), 
    color(213, 206, 220), 
    color(178, 177, 187), 
    color(243, 174, 204), 
    color(200, 139, 169), 
    color(231, 214, 222), 
    color(114, 126, 154), 
    color(118, 102, 141), 
    color(185, 157, 185), 
  };

  float dw = map(noise(0.5*sw/width, 0.5*sh/height), 0, 1, 0.001, 0.020) * lw;

  pushMatrix();
  translate(sw, sh);

  if ( (lw >= 50 || lh >= 50) && random(100) < 15 ) {
    noStroke();
    fill(235, 239, 244, 200);
    rect(0, 0, lw, lh);
  }

  strokeWeight(0.5);
  noFill();
  if ( random(10) < 1 ) {
    stroke(cs[(int)random(cs.length)]);
  } else {
    stroke(cs[(int)map(noise(sw/1.1*width, sh/1.1*height), 0, 1, 0, cs.length-1)], random(180, 220));
  }

  for ( float w = 0; w < lw; w += dw ) {
    beginShape();
    vertex(w   , 0   );
    vertex(lw  , w   );
    vertex(lw-w, lh  );
    vertex(0   , lh-w);
    endShape(CLOSE);
  }

  popMatrix();

  return ;
}


void backsmoke() {

  strokeWeight(2.5);
  
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      stroke(
        map(noise(w/300, h/300), 0, 1, 0.6, 1.0) * 255, 
        map(noise(w/300, h/300), 0, 1, 0.6, 1.0) * 255, 
        map(noise(w/300, h/300), 0, 1, 0.6, 1.0) * 255, 
        random(60, 120)
        );
      point(w, h);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("139.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
