/* 126_20200510 */

final String[] code = {
  "import Prelude hiding (length, sequence)", 
  "", 
  "pair :: Int -> Int -> Int", 
  "pair x y = (x+y) * (x+y+1) `div` 2 + x + 1", 
  "", 
  "left :: Int -> Int", 
  "left z | z == 0    = 0", 
  "       | otherwise = head [ x | x <- [0..z], y <- [0..z], pair x y == z ]", 
  "", 
  "right :: Int -> Int", 
  "right z | z == 0    = 0", 
  "        | otherwise = head [ y | x <- [0..z], y <- [0..z], pair x y == z ]", 
  "", 
  "encode :: [Int] -> Int", 
  "encode xs | null xs   = 0", 
  "          | otherwise = pair (head xs) (encode $ tail xs)", 
  "", 
  "decode :: Int -> [Int]", 
  "decode a | a == 0    = []", 
  "         | otherwise = (left a) : (decode $ right a)", 
  "", 
  "element :: Int -> Int -> Int", 
  "element a i | i == 1    = left a", 
  "            | otherwise = element (right a) (i-1)", 
  "", 
  "length :: Int -> Int", 
  "length a = foldl (\\n _ -> n+1) 0 (decode a)", 
  "", 
  "replace :: Int -> Int -> Int -> Int", 
  "replace a i x | i == 1    = pair x (right a)", 
  "              | otherwise = pair (left a) (replace (right a) (i-1) x)", 
  "", 
  "sequence :: Int -> Int -> Int", 
  "sequence x k | k == 0    = 0", 
  "             | otherwise = pair x (sequence x (k-1))"
};

final int FS = 21;


void setup() {
  size(1150, 800);
  noLoop();
  textFont(loadFont("Consolas-48.vlw"), FS);
  textAlign(LEFT, CENTER);
  rectMode(CENTER);
}


void draw() {
  background(40);

  float w, h;

  h = 12;
  for ( int i = 0; i < code.length; i++ ) {
    w = 40;    
    fill(220);
    text(String.format("%02d", i+1), 5, h);
    for ( int j = 0; j < code[i].length(); j++ ) {
      pushMatrix();
      translate(w+map(noise(w), 0, 1, -2.5, 2.5), h+map(noise(h), 0, 1, -4.5, 4.5));
      rotate(map(noise(j), 0, 1, -PI/8, PI/4));
      scale(map(noise(i+j), 0, 1, 0.9, 1.4));
      fill(map(noise(w+h), 0, 1, 180, 255));
      text(code[i].charAt(j), 0, 0);
      popMatrix();
      w += FS/2;
    }
    h += FS + 1.5;
  }

  fill(220);
  rect(FS*code[code.length-1].length()/2+28, (FS+1.5)*(code.length-1)+13.5, 13, 25);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("126.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
