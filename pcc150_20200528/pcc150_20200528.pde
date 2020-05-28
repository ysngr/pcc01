/* 150_20200528 */

ArrayList<float[]> ps;

void setup() {
  size(1150, 800);
  noLoop();
  textFont(loadFont("BradleyHandITC-48.vlw"), 64);
  textAlign(CENTER, CENTER);
}


void draw() {
  background(255, 246, 233);

  final String s = "HappyBirthdaytoYou";
  final color[] cs = {
    color(241, 205, 189), 
    color(195, 144, 150), 
    color(153,  89, 110), 
    color(245, 175, 120), 
    color(253, 225, 176), 
    color(244, 170, 150), 
    color(101,  89,  93), 
    color( 79,  50,  53)
  };

  float[] p;

  ps = new ArrayList<float[]>();
  recDiv(0.15*width, 0.15*height, 0.7*width, 0.7*height);

  for ( int i = 0; i < ps.size(); i++ ) {
    fill(cs[(int)random(cs.length)]);
    p = ps.get(i);
    textSize(min(p[2], p[3]));
    text(s.charAt((int)random(s.length())), p[0]+p[2]/2, p[1]+p[3]/2);
  }
}


void recDiv(float x, float y, float w, float h) {

  if ( w < 100 && h < 100 ) {
    if ( w < 80 || h < 80 || random(10) < 2 ) {
      float[] np = {x, y, w, h};
      ps.add(np);
      return ;
    }
  }

  float wr = random(0.3, 0.7);
  float hr = random(0.3, 0.7);
  
  recDiv(x     , y     , w*wr    , h*hr    );
  recDiv(x+w*wr, y     , w*(1-wr), h*hr    );
  recDiv(x     , y+h*hr, w*wr    , h*(1-hr));
  recDiv(x+w*wr, y+h*hr, w*(1-wr), h*(1-hr));

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("150.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
