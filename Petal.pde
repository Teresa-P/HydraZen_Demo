class Petal
{
  PImage image;
  float xPos;
  float yPos;
  float speed;
  
  
  //constructor
  Petal (String img, float x, float y)
  {
    xPos = x;
    yPos = y;
    image = loadImage(img);
    speed = random(1.5,2);
    
    
  }
  
  //method that will display the petal
  void load()
  {
    image(image, xPos, yPos);
  }
 
 //method that will make the petal fall
  void move()
  {
   
    xPos = xPos - (random(0.1,1)*speed);
    yPos = yPos + ((random(0.5,1.5)*speed));
    if (yPos > height)
    {
       yPos=random(150,250);
       xPos = random(400,900);
       speed= random(2,3);
       if (groupScreen==true)
       {
         if (seq_petal==0)
          {
            seq_petal=1;
            display_once=false;
            screen=get();
          }
       else if (seq_petal==2)
       {
         display_once=false;
         seq_petal=3;
         screen=get();
         //println(seq_petal);
       }
       else if (seq_petal==4)
       {
         display_once=false;
         seq_petal=5;
         screen=get();
         //println(seq_petal);
        }
        else if (seq_petal==6)
        {
          display_once=false;
          seq_petal=0;
          screen=get();
          //println(seq_petal);
        }
      }
      else
      {
        image(screen,0,0);
        //screen=get();
        
        groupScreen = true;
        seq_petal=6;
       }
    }
  }
}
