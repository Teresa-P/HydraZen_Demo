class Butterfly
{
  PImage image;
  int xPos;
  int yPos;
 
  //constructor
  Butterfly (String img, int x, int y)
  {
    xPos = x;
    yPos = y;
    image = loadImage(img);
    
  }
  
  //method that will display the butterfly
  void load()
  {
    image(image, xPos, yPos);
  }
 

}
