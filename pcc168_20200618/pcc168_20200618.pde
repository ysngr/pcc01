/* 168_20200618 */

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  background(255);
  backaurora();
  diagTile();
}


void backaurora() {

  float rw = random(500, 1000);
  float rh = random(500, 1000);
  float gw = random(500, 1000);
  float gh = random(500, 1000);
  float bw = random(500, 1000);
  float bh = random(500, 1000);

  blendMode(BLEND);
  strokeWeight(2.0);
  for ( float h = 0; h < height; h++ ) {
    for ( float w = 0; w < width; w++ ) {
      stroke(
        noise(w/rw, h/rh) * 255, 
        noise(w/gw, h/gh) * 255, 
        noise(w/bw, h/bh) * 255
      );
      point(w, h);
    }
  }

  return ;
}


void diagTile() {

  final float TILESIZE = 25.0;

  blendMode(LIGHTEST);

  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/8);

  strokeWeight(2.2);
  stroke(204, 224, 244);
  for ( float h = -sqrt(2)*height/2; h < sqrt(2)*height/2; h += TILESIZE ) {
    for ( float w = -sqrt(2)*width/2; w < sqrt(2)*width/2; w += TILESIZE ) {
      fill(selectColor());
      if ( noise(w/width, h/height) < 0.5 && random(2) < 1 ) {
        square(w, h, TILESIZE);
      } else {
        square(w, h, TILESIZE*map(noise(w*h), 0, 1, 0.1, 0.6));
      }
    }
  }

  popMatrix();

  return ;
}


color selectColor() {

  final color[] cs = {
    color(135, 194, 231), 
    color( 94, 160, 215), 
    color(234, 241, 244), 
    color(241, 156, 166), 
    color(247, 186, 139), 
    color(255, 247, 153), 
    color(165, 212, 173), 
    color(130, 205, 219), 
    color(113, 140, 199)
  };

  return cs[(int)random(cs.length)];
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("168.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
