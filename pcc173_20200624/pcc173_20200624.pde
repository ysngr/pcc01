/* 173_20200624 */

ArrayList<Flow> fs;


void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(0);
  bars();
  flow();
}


void bars() {

  final color[] cs = {
    color(234,  77,  21), 
    color(241, 142,  29), 
    color(248, 182,  52), 
    color(213, 155,  63), 
    color(253, 212, 110), 
    color(255, 252, 213), 
    color(244, 254, 240), 
    color(219,  84,  45), 
    color(168,  69,  54)
  };

  float dw;

  noStroke();
  for ( float w = 0; w < width; w += dw ) {
    dw = random(2, 20);
    fill(cs[(int)random(cs.length)], random(40, 80));
    rect(w, 0, dw, height);
  }

  return ;
}


void flow() {

  initFlow();

  for ( Flow f : fs ) {
    for ( int i = 0; i < 1000; i++ ) {
      f.plot();
      f.update();
    }
  }

  return;
}


void initFlow() {

  float x, y, dx, dy; 

  fs = new ArrayList<Flow>(); 

  for ( int i = 0; i < 15; i++ ) {
    x = random(width); 
    y = random(height); 
    dx = sgn() * random(400, 600); 
    dy = sgn() * random(400, 600); 
    fs.add(new Flow(x, y, x+dx, y+dy));
  }

  return;
}


float sgn() {
  return ( random(2) < 1 )? 1.0 : -1.0;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("173.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    noiseSeed((long)random(9999));
    redraw();
  }
}
