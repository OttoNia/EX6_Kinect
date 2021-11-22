import processing.video.*;
import org.openkinect.processing.*;

Kinect2 Kinect2;

void setup(){
size(512,424,P3D);
Kinect2 = new Kinect2(this);
Kinect2.initDepth();
Kinect2.initDevice();
}

void draw(){
  background(0);
  
  PImage img = Kinect2.getDepthImage();
  image(img,0,0);
  
  int skip = 20;
  for (int x = 0; x < img.width; x+=skip){
    for (int y = 0; y < img.height; y+=skip){
    int index = x + y * img.width;
    float b = brightness(img.pixels[index]);
    float z = map(b,0,255,150,-150);
    
    fill(255-b);
    pushMatrix();
    translate(x,y);
    rect(0,0,skip/2,skip/2);
    popMatrix();
  }
  }
}
