class Leaf 
{
  PImage image1;
  PImage image2;
  PImage image3;
  PImage image4;
  PImage image5;
  int group_counter;
  float group_goal;
  float group_sum;
  
  int xPos;
  int yPos;

 
  //constructor
  Leaf (int gc, float gg, float gs, int x, int y)
  {
    group_counter = gc;
    group_goal = gg;
    group_sum = gs;
    xPos = x;
    yPos = y;
    image1 = loadImage("leaf1.png");
    image2 = loadImage("leaf2.png");
    image3 = loadImage("leaf3.png");
    image4 = loadImage("leaf4.png");
    image5 = loadImage("flower.png");

    
  }
  
  //method that will display the leaves
  void display_leaves()
  {

    if (group_sum < group_goal * 0.25)
    {
    image(image1, xPos, yPos);
    }
    else if (group_sum >= group_goal * 0.25 && group_sum < group_goal*0.50)
    {
      image(image2, xPos, yPos);
    }
    else if (group_sum >= group_goal * 0.5 && group_sum < group_goal*0.75)
    {
      image(image3, xPos, yPos);
    }
    else if (group_sum >= group_goal*0.75 && group_sum<group_goal)
    {
      image(image4, xPos, yPos);
    }
    else if (group_sum >= group_goal)
    {
      image(image4, xPos, yPos);
      image(image5,xPos+70, yPos+15);
    }

  }
 

}
