class Dragonfly
{
  PImage image;
  int xPos;
  int yPos;
 
  //constructor
  Dragonfly (String img, int x, int y)
  {
    xPos = x;
    yPos = y;
    image = loadImage(img);
    
  }
  
  //method that will display the dragonfly
  void load()
  {
    image(image, xPos, yPos);
  }
 

}
