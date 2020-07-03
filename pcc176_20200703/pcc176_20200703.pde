/* 176_20200703 */

final color BGC = color(230, 230, 230);

void setup() {
  size(1150, 800);
  noLoop();
  textFont(createFont("HGS教科書体", 16));
}


void draw() {
  background(BGC);
  composeWaka();
  flow();
}


void composeWaka() {

  final color[] cs = {
    color(218,  65,  72), 
    color(208,  15,  49), 
    color(165,  26,  41), 
    color( 79,  53,  39), 
    color( 68,  81,  54), 
    color( 33,  22,  10), 
    color(240, 208, 129)
  };
  final String s = "夜久毛多都伊豆毛夜幣賀岐都麻碁微爾夜幣賀岐都久流曾能夜幣賀岐袁";

  for ( int i = 0; i < s.length(); i++ ) {
    for ( int j = 0; j < 4; j++ ) {
      fill(cs[(int)random(cs.length)]);
      textSize(random(24, 128));
      text(s.charAt(i), random(width), random(height));
    }
  }

  return ;
}


void initFlow(ArrayList<PVector> ps) {

  for ( int h = 0; h < height; h++ ) {
    for ( int w = 0; w < width; w++ ) {
      if ( get(w, h) != BGC && random(10) < 1 ) {
        ps.add(new PVector(w, h));
      }
    }
  }

  return ;
}


void flow() {

  ArrayList<PVector> ps = new ArrayList<PVector>();
  PVector p;
  color c;
  float alp, amp, ta, t;

  initFlow(ps);

  for ( int i = 0; i < ps.size(); i++ ) {
    p = ps.get(i);
    c = get((int)p.x, (int)p.y);
    alp = 220;
    amp = random(2);
    ta = 100 * noise(p.x/width, p.y/height);
    for ( int j = 0; j < 220; j++ ) {
      stroke(c, alp);
      point(p.x, p.y);
      t = ta * noise(p.x/width, p.y/height);
      p.x += amp * cos(t);
      p.y += amp * sin(t);
      alp--;
      amp += random(0.02);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("176.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
