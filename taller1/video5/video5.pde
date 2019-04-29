import processing.video.*;

Movie movie;

void setup() {
  size(352, 288);  
  background(0);  
  movie = new Movie(this, "video.mp4");
  movie.loop();
  frameRate(30);
}

void movieEvent(Movie movie) {  
  movie.read();
}

void draw() {  
  image(movie, 0, 0);
  println(frameRate);
  println(frameCount);
}
