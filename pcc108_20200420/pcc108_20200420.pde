/* 108_20200420 */

void setup() {
  size(1150, 800);
  noLoop();
  strokeWeight(3.2);
  noFill();
}


void draw() {
  background(180);

  float[][] ps = new float[4][2];
  
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i][0] = random(width);
    ps[i][1] = random(height);
  }

  for ( int i = 0; i < 5000; i++ ) {
    stroke(random(255), random(255), random(255));
    bezier(ps[0][1], ps[0][1], ps[1][0], ps[1][1], ps[2][0], ps[2][1], ps[3][0], ps[3][1]);
    
    for ( int j = 0; j < ps.length; j++ ) {
      ps[j][0] += random(-1, 1) * noise(ps[j][0]) * 25;
      ps[j][1] += random(-1, 1) * noise(ps[j][1]) * 25;
      if( ps[j][0] < 150 || width-150 < ps[j][0] ){
        ps[j][0] = random(width);
      }
      if( ps[j][1] < 150 || height-150 < ps[j][1] ){
        ps[j][1] = random(height);
      }
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("108.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
