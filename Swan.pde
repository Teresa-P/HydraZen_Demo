//this swan will display the group achievement on the list
class Swan
{
  
  float group_goal;
  float group_sum;
  int xPos=560;
  int yPos=240;
  
  Swan (float gg, float gs)
  {
    group_goal = gg;
    group_sum = gs;
   

  }
  
  void display_swan()
  {

    if (group_sum < group_goal * 0.1)
    {
    image(swan[0], xPos, yPos);
    }
    else if (group_sum >= group_goal * 0.10 && group_sum < group_goal*0.15)
    {
      image(swan[1], xPos, yPos);
    }
    else if (group_sum >= group_goal * 0.15 && group_sum < group_goal*0.20)
    {
      image(swan[2], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.2 && group_sum < group_goal*0.25)
    {
      image(swan[3], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.25 && group_sum < group_goal*0.30)
    {
      image(swan[4], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.30 && group_sum < group_goal*0.35)
    {
      image(swan[5], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.35 && group_sum < group_goal*0.40)
    {
      image(swan[6], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.4 && group_sum < group_goal*0.45)
    {
      image(swan[7], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.45 && group_sum < group_goal*0.50)
    {
      image(swan[8], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.5 && group_sum < group_goal*0.55)
    {
      image(swan[9], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.55 && group_sum < group_goal*0.60)
    {
      image(swan[10], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.6 && group_sum < group_goal*0.65)
    {
      image(swan[11], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.65 && group_sum < group_goal*0.7)
    {
      image(swan[12], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.7 && group_sum < group_goal*0.75)
    {
      image(swan[13], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.75 && group_sum < group_goal*0.8)
    {
      image(swan[14], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.8 && group_sum < group_goal*0.90)
    {
      image(swan[15], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.90 && group_sum < group_goal*0.95)
    {
      image(swan[16], xPos, yPos);
    }
    else if (group_sum >= group_goal*0.95 && group_sum < group_goal)
    {
      image(swan[17], xPos, yPos);
    }
    else if (group_sum >= group_goal)
    {
      image(swan[18], xPos, yPos);
    }
  }
}
