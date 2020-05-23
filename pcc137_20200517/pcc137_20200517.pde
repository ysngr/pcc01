/* 137_20200517 */

void setup() {
  size(1000, 1000);
  noLoop();
  textAlign(CENTER, CENTER);
  textFont(createFont("HGS教科書体", 16));
}


void draw() {
  background(184, 27, 48);

  final String[] ss = {
    "八岐大蛇八岐遠呂智八俣遠呂智八俣遠呂知斐伊川草薙剣十拳剣", 
    "建速須佐之男命速須佐之男命須佐之男命素戔男尊素戔嗚尊等須佐乃袁尊神須佐能袁命須佐能乎命", 
    "夜久毛多都伊豆毛夜幣賀岐都麻碁微爾夜幣賀岐都久流曾能夜幣賀岐袁", 
  };
  final color c = color(0, 200, 160);
  final float FS = 42;

  float c1x, c1y, c2x, c2y;
  float[][] hs;
  int idx;

  blendMode(DIFFERENCE);
  textSize(FS);
  for ( float h = FS/2; h < height; h += FS ) {
    for ( float w = FS/2; w < width; w += FS ) {
      fill(c, random(60, 140));
      idx = (int)random(ss.length);
      text(ss[idx].charAt((int)random(ss[idx].length())), w, h);
    }
  }

  hs = new float[8][2];
  for ( int i = 0; i < hs.length; i++ ) {
    hs[i][0] = random(width);
    hs[i][1] = random(height);
  }

  noStroke();
  fill(c);
  for ( int i = 0; i < hs.length; i++ ) {
    for ( int j = 0; j < 20; j++ ) {
      circle(hs[i][0]+random(-40, 40), hs[i][1]+random(-40, 40), random(120, 240));
    }
  }

  noFill();
  for ( int i = 0; i < hs.length; i++ ) {
    c1x = random(width);
    c1y = random(height);
    c2x = random(width);
    c2y = random(height);
    for ( int j = i+1; j < hs.length; j++ ) {
      for ( int k = 0; k < 15; k++ ) {
        strokeWeight(random(1.0, 10.0));
        stroke(c);
        bezier(hs[i][0], hs[i][1], c1x, c1y, c2x, c2y, hs[j][0], hs[j][1]);
        c1x += random(-10, 10);
        c1y += random(-10, 10);
        c2x += random(-10, 10);
        c2y += random(-10, 10);
      }
    }
  }

  /* frame */
  blendMode(BLEND);
  strokeWeight(60);
  stroke(220, 184, 135);
  noFill();
  rect(0, 0, width, height);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("137.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
