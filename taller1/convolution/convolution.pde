PGraphics pg1;
PGraphics pg2;
PImage img;
PImage des;

float[][] matrix = { { -1, -1, -1 },
                     { -1, 9, -1 },
                     { -1, -1, -1 }  };

void setup(){
  size(1295, 490);
  background(0);
  img = loadImage("gato.jpg");
  des = createImage(img.width, img.height, RGB);
  pg1 = createGraphics(640, 480);
  pg2 = createGraphics(640, 480);
}

void draw(){
  
  pg1.beginDraw();
  pg1.imageMode(CORNERS);
  pg1.image(img, 0, 0, 640, 480);
  pg1.endDraw();
  
  int matrixsize = 3;
  
  for(int x = 0; x < img.width; x++){
    for(int y = 0; y < img.height; y++){
      color c = convolution(x,y,matrix,matrixsize,img);
      int i = x + y * img.width;
      des.pixels[i] = c;
    }
  } 
  
  pg2.beginDraw();
  pg2.imageMode(CORNERS);
  pg2.image(des, 0, 0, 640, 480);
  pg2.endDraw();
  
  image(pg1, 5, 5);
  image(pg2, 650, 5);
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img){
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for(int i = 0; i < matrixsize; i++){
    for(int j = 0; j < matrixsize; j++){
      int xi = x + i - offset;
      int yi = y + j - offset;
      int ind = xi + img.width * yi;
      ind = constrain(ind, 0, img.pixels.length-1);
      
      rtotal += (red(img.pixels[ind]) * matrix[i][j]);
      gtotal += (green(img.pixels[ind]) * matrix[i][j]);
      btotal += (blue(img.pixels[ind]) * matrix[i][j]);     
    }
  }
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  return color(rtotal, gtotal, btotal);
}
