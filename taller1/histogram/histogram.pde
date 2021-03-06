PGraphics pg1;
PGraphics pg2;
PImage img;
int[] hist;

void setup(){
  size(1295, 490);
  background(0);
  img = loadImage("gato.jpg");
  pg1 = createGraphics(640, 480);
  pg2 = createGraphics(640, 480);
  hist = new int[256];
  noLoop();
}

void draw(){
  
  pg1.beginDraw();
  pg1.imageMode(CORNERS);
  pg1.image(img, 0, 0, 640, 480);
  pg1.endDraw();
  
  for(int i = 0; i < img.pixels.length; i++){
    float r = red(img.pixels[i]);
    float g = green(img.pixels[i]);
    float b = blue(img.pixels[i]);
    
    float c = 0.212*r+0.701*g+0.087*b;
    
    img.pixels[i] = color(c);
  }
  
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      int bright = int(brightness(img.get(i, j)));
      hist[bright]++; 
    }
  }
  
  int histMax = max(hist);
  
  pg2.beginDraw();
  pg2.imageMode(CORNERS);
  pg2.image(img, 0, 0, 640, 480);
  
  pg2.stroke(255);
  for(int i = 0; i < pg2.width; i+= 2){
    int which = int(map(i, 0, pg2.width, 0, 255));
    int y = int(map(hist[which], 0, histMax, pg2.height, 0));
    pg2.line(i, pg2.height, i, y);
  }
  pg2.endDraw();
  
  image(pg1, 5, 5);
  image(pg2, 650, 5);
}
