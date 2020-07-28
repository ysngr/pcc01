/* 196_2020 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(254, 249, 243);

  float w, h;
  for ( int i = 0; i < 18; i++ ) {
    w = random(width);
    h = random(height);
    noiseSeed((long)random(9999));
    for ( float d = 0; d < 420; d += 7 ) {
      nCircle(w, h, d);
    }
  }
}


void nCircle(float cx, float cy, float d) {

  final float amp = 200;
  final float dt = PI / 128;

  float x, y, nx, ny, nt;

  for ( float t = 0; t < 2*TWO_PI; t += dt ) {
    nt = noise(t/TWO_PI);
    if ( nt < 0.1 || 0.55 < nt && nt < 0.65 ) {
      continue;
    }
    x = cx + d/2*cos(t);
    y = cy + d/2*sin(t);
    nx = amp * map(noise(x/width, t/TWO_PI), 0, 1, -1, 1);
    ny = amp * map(noise(y/height, t/TWO_PI), 0, 1, -1, 1);
    stroke(
      map(noise((x+nx)/100), 0, 1, 100, 255), 
      map(noise((y+ny)/100), 0, 1, 100, 200), 
      map(noise(x/100, y/100), 0, 1, 128, 255), 
      160
    );
    point(x+nx, y+ny);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("196.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
