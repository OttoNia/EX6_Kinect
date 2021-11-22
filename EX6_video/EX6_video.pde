import processing.video.*; 

Capture cam; 

PImage preFrame; 
float threshold = 50;

void setup(){ 
  size(640, 480); 
  smooth(); 

  String[] cameras = Capture.list(); 

  cam = new Capture(this, width, height, 30); 
  preFrame = createImage(cam.width, cam.height, RGB); 
  cam.start(); 
}

void draw(){ 
  if(cam.available() == true){ 
    preFrame.copy(cam, 0, 0, cam.width, cam.height, 0, 0, cam.width, cam.height); 
    preFrame.updatePixels(); 
    cam.read(); 
}

loadPixels(); 
cam.loadPixels(); 
preFrame.loadPixels();
  for(int x = 0; x < cam.width; x++){ 
  for(int y = 0; y < cam.height; y++){
    
int loc = x + y * cam.width; 

color current = cam.pixels[loc]; 
color previous = preFrame.pixels[loc];

float r1 = red(current); 
float g1 = green(current); 
float b1 = blue(current); 
float r2 = red(previous); 
float g2 = green(previous); 
float b2 = blue(previous); 

float diff = dist(r1, g1, b1, r2, g2, b2);

  if(diff > threshold){ 
  pixels[loc] = color(0); 
  } else { 
  pixels[loc] = color(255); 
  } 
 } 
} 
updatePixels(); 
} 
