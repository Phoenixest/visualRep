PGraphics pg1;
PGraphics pg2;
PImage img;

void setup(){
  size(1295, 490);
  background(0);
  img = loadImage("gato.jpg");
  pg1 = createGraphics(640, 480);
  pg2 = createGraphics(640, 480);
}

void draw(){
  
  pg1.beginDraw();
  pg1.imageMode(CORNERS);
  pg1.image(img, 0, 0, 640, 480);
  pg1.endDraw();
  
  img.loadPixels();
  for(int i = 0; i < img.pixels.length; i++){
    float r = red(img.pixels[i]);
    float g = green(img.pixels[i]);
    float b = blue(img.pixels[i]);
    
    float c = 0.212*r+0.701*g+0.087*b;
    
    img.pixels[i] = color(c);
  }
  img.updatePixels();
  
  
  pg2.beginDraw();
  pg2.imageMode(CORNERS);
  pg2.image(img, 0, 0, 640, 480);
  pg2.endDraw();
  
  image(pg1, 5, 5);
  image(pg2, 650, 5);
}
