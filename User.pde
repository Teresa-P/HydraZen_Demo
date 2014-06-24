class User
{
  String name;
  int group;
  String picture;
  int user_goal;
  //int goal;
  int daily_level;
  int min_counter;
  int med_counter;
  int goal_counter;
  int button;
  int open_flower;
  int min_achieved;
  int med_achieved;
  int goal_achieved;
  int first;
  Boolean open=false;
  int lost_petals;
  int not_min;
  int background;
  PImage user_pic;
  String group_name;
  PImage thumb_leaf0 = loadImage("leaf1.png");
  PImage thumb_leaf1 = loadImage("leaf2.png");
  PImage thumb_leaf2 = loadImage("leaf3.png");
  PImage thumb_leaf3 = loadImage("leaf4.png");
  PImage thumb_button = loadImage("thumb_button.png");
  PImage level1 = loadImage("level1.png");
  PImage level2 = loadImage("level2.png");
  PImage level3 = loadImage("level3.png");
  int message;
  Boolean level_up=false;

  
  //constructor
  User(String n, int grp, String pic, int g, int f, int ma, int mda, int ga, int nm, int mc, int medc, int gc, int b, int o, int bg, int dl, int lp)
  {
    name=n;
    group=grp;
    picture = pic;
    user_goal = g;
    first = f;
    min_achieved = ma;
    med_achieved = mda;
    goal_achieved = ga;
    not_min = nm;
    min_counter=mc;
    med_counter=medc;
    goal_counter=gc;
    button=b;
    open_flower=o;
    background=bg;
    daily_level=dl;
    lost_petals = lp;
    
    user_pic = loadImage(picture);
    
    if (group == 1)
    {
      group_name = "PATH Student";
    }
     if (group == 2)
    {
      group_name = "Professor";
    }
     if (group == 3)
    {
      group_name = "MCS student";
    }
     if (group == 4)
    {
      group_name = "Admin";
    }
     if (group == 5)
    {
      group_name="MHCI Student";
    }
     if (group == 6)
    {
      group_name = "MET Student";
    }
     if (group == 7)
    {
      group_name = "Researcher";
    }
    
    
  }
  
  //method that displays user info
  void display()
  {
    /*initially the profile is displayed with a little and brown leaf, it will grow and change 
    color along time, also a white swan is displayed, as daily levels will be achieved
    the swan will show the evolution */
    
    image(loadImage("background960" + background + ".jpg"),0,0);
       
    //invoking the method that enables displaying the flower at its actual stage
    load_flower();
    info=false;
    fall_petal=true;
    
    // displaying the user info
    fill(0);
    textFont(font,20);
    text (name,140,110);
    text (group_name,140,140);
    image(user_pic,55,90);  
    screen=get();
  }
       
  
  //method that executes the daily evolution
  void daily_levels()
  {
     //image(screen,0,0);
     //petal.load();
     //petal.move();
    textFont(font,18);
    daily_level++;//increases the user daily level so it can be measured
    load_flower();
    
    if (daily_level<user_goal*0.5)//while user don't reach minimum level
    {
      if (first==0)
      {
        text ("Welcome!",55,185);//offers a welcome message
        text ("Thank you for using",55,210);
        text ("HydraZen!",55,235);

        first=1;//variable first informs if is the 1st time on the day that the user is using the app
      }
      else if (first==1)//welcomes back the user since is not already the first time is filling the cup
      {
         text ("Welcome back!",55,185);
         message= int(random(1,8));
         messages();
      }
    }
      
    if (daily_level>=user_goal*0.5 && daily_level<user_goal*0.75)//if the user reaches the minimum level
    {
      image(level1,0,0);//the leaf is now displayed a bit bigger. The swan shows the evolution with blue color
      
      load_flower();
     
      if (min_achieved==0)
      {
         sounds[0].loop(0);
         min_counter++;//increases the amount of minimum levels achieved so far--> this will be a help to the plant evolution process
         min_achieved=1;
         //println ("min_achieved is now as " + min_achieved);
         text ("Well done!",55,185);
         message = int(random(9,10));
         //println(min_counter);
          if (lost_petals>0) //if the user has lost petals on the previous days...
          {
            lost_petals--;//since the daily minimum was achieved, the plant have now one less lost petal
            //and open_flower can "grow" again
            message=11;
            open_flower++;
          }
          if (background==1)
          {
            background=0; //this will display the blue background just in case it was gray before
            message=12;
          }
          
          sounds[0].play();
       }
       else if (min_achieved==1)//this avoids not increasing the variable min_achieved since it only can happen once a day
       {
         text ("Welcome back!",55,185);
         message= int(random(1,8));
       }
       messages();
     }  
      
      
     else if (daily_level>=user_goal*0.75 && daily_level<user_goal)//similar procedure as the minimum level, but for the medium level
     {
       image(level2,0,0);
       
       load_flower();
       
       if (med_achieved==0)
       {
           sounds[0].loop(0);
           med_counter++;
           med_achieved=1;
           message=int(random(13,14));
        }
        else if (med_achieved==1)
        {
           text ("Welcome back!",55,185);
           message = int(random(1,8));
         }
         messages();
       }
      
      
    else if (daily_level>=user_goal)//the user reaches his/her goal! Similar procedure as the previous levels
    {
      image(level3,0,0);
      load_flower();
 
      if (goal_achieved==0)
      {
        sounds[1].loop(0);
        goal_counter++;
        if (goal_counter==5)
        {
          text ("You have a visit!",55,185);
          text ("A reward by keeping",55,210);
          text ("healthy habits!",55,235);
        }
        if (goal_counter==15)
        {
          text ("You kept good work!",55,185);
          text ("Your goal is now " + (user_goal+1),55,210);
          text ("Congratulations!",55,235);
        }
        if (goal_counter!=5 && goal_counter!=15)
        {
         text ("Congratulations!",55,185);
         text ("Daily Goal Achieved!",55,210);
        }
      goal_achieved=1;
      }
      else 
      {
        text ("Well done!",55,185);
        text ("You're above your daily",55,210);
        text ("goal.",55,235);
      }
    }
  }
  
  void new_day()//instrunctions that simulates a new day
  {
    
    daily_level=0;
    first = 0;
    
    if (min_achieved == 0)//when the user don't achieve the minimum level increases a variable that counts the number of days without minimum level achieved
    {
      not_min++;
    }
    
    else if (min_achieved == 1)
    {
      min_achieved=0;//sets the min_achieved to false again to start a new day
    }
     //set the other daily levels as false to start a new day
     med_achieved=0;
     goal_achieved=0;
     
     // sets the open variable as false to start a new day and reset the daily levels achieved to start counting again to the next petal
     if (open==true)
     {
       open = false;
       if (med_counter==1 || goal_counter==1)
       {
         med_counter=0;
         goal_counter=0;
       }
     }
    
     //if the user has already 3 days without achieveing the minimum level
     if (not_min==3)
     {
       background = 1;// variable that will set the background as "gray" 
       min_counter=0;
       med_counter=0;
       goal_counter=0;
      
       if (open_flower>0)//and if the flower is already open, the plant will start losing petals
       {
         open_flower--;
         lost_petals++;
       }
            
       not_min=0;//resets the counter to 0 to start again counting days without daily minimum level achieved
     }
     if (goal_counter>=15)
     {
       goal_counter=0;
     } 
  }
  
  void button()//function that will enable the button
  {
    if (button==0 && open_flower==0)
    {
      if (min_counter==5)//the button takes 5 days to appear (with at least minimum level achieved)
      {
        button=1;
        min_counter=0;
        med_counter=0;
        goal_counter=0;
      }
    }
  }

  void open_flower()//function that will enable the flower to open and grow
  {
  //when the button is already activated, 3 days after the flower will open (again if the minimum level was achieved)
  if (button==1 && open_flower==0 && open==false)
  {
    if (min_counter==3)
    {
      button=0;//disables the button
    
      open_flower=1;//the flower at its 1st stage appears
    
      //resets counters to start counting for the next stage
      min_counter=0;
      med_counter=0;
      goal_counter=0;
    
      //informs that one stage was already achieved on the current day
      open=true;
     }
    }
  
    //after the flower opening, it will start appearing new petals
    else if (button==0 && open_flower>0 && open_flower<20 && open==false)
    {
    if (min_counter==3)//3 days of minimum levels achieved, it will ofer a new petal
    {
      open_flower++;
      
      min_counter=0;
      med_counter=0;
      goal_counter=0;
      level_up=false;
      open=true;
     }
      
     else if (med_counter==2)//after completing 2 days with medium level achieved, the user gets one petal
     {
       open_flower++;
       min_counter=0;
       med_counter=0;
       goal_counter=0;
       open=true;
      
      }
      else if (goal_counter==1)//but if the user achieves his/her goal on that day, it gets one petal
      {
        open_flower++;
        min_counter=0;
        med_counter=0;
        goal_counter=0;
        open=true;
      }
    }
    if (open_flower==20)
    {
      if (goal_counter>=5 && goal_counter<15)
      {
        fall_petal=false;
        prize=1;
        if (goal_counter==5)
        {
          sounds[6].loop(0);
        }
            
      }
      if (goal_counter>=15)
      {
        fall_petal=false;
        prize=2;
        sounds[6].loop(0);
        if (level_up==false)
        {
          user_goal++;
          //println("your kept good work. Is time to level up your goal to" + user_goal);
          level_up=true;   
        }
      }
    }
    
    if (open_flower==0 && lost_petals>0)//if the user has lost all the petals, the plant "dies" and all start from the begining again (just the leaf)
    {
      restart();
    }
  }

  //displaying the flower
  void load_flower()
  {
    if (info==true)
    {
      
      if (min_achieved==1)
      {
        image(level1,0,0);
      }
      if (med_achieved==1)
      {
        image(level2,0,0);
      }
      if (goal_achieved==1)
      {
        image(level3,0,0);
      }
    }
    
    if (button==1)//if the button is activated, it displays the button}
    {
      image(loadImage("button.png"),0,0);
      message=15;
    }
      if(open_flower>0)//but if the flower is already open, it will display it together with lost petals if is the case
      {
        image(openFlowers[open_flower],0,0);
     
        //this loop is to show all the lost petals so far
        for (int i=lost_petals; i>0; i--)
        {
          image(petals[(open_flower+lost_petals)-i],0,0);
        }
      }
    }
  

  void restart()//when the user let the plant "die" losing all petals, all start again from scratch just with the leaf
  {
    open_flower=0;
    button=0;
    lost_petals=0;
    min_counter=0;
    med_counter=0;
    goal_counter=0;
    user_goal--;
    message=16;
  }
  
  
   void groups()//updating groups information along the daily evolution of each user
  { 
    if (group == 1)
    {
    group1_sum = group1_sum + 1;      
    }
    if (group == 2)
    {
    group2_sum = group2_sum + 1;      
    }
      if (group == 3)
    {
    group3_sum = group3_sum + 1;      
    }
      if (group == 4)
    {
    group4_sum = group4_sum + 1;      
    }
      if (group == 5)
    {
    group5_sum = group5_sum + 1;      
    }
      if (group == 6)
    {
    group6_sum = group6_sum + 1;      
    }
      if (group == 7)
    {
    group7_sum = group7_sum + 1;      
    }
  }
 
  void load_thumbs()
  {
    int x = 220;
    int y = 160;
    fill(0);
    textFont(font,20);
    text (name,140,120);
    text (group_name,140,150);
    image(user_pic,55,90);
    message = int(random(1,8));
    messages();
    
    image(thumb_leaf0,x,y); 
    if (min_achieved==0)
    {
      sounds[2].loop(0);
    }
    if (min_achieved==1 && med_achieved==0)
    {
      image(thumb_leaf1,x,y);
      sounds[3].loop(0);
    }
    if (med_achieved==1 && goal_achieved==0)
    {
      image(thumb_leaf2,x,y);
      sounds[4].loop(0);
    }
    if (goal_achieved==1)
    {
      image(thumb_leaf3,x,y);
      sounds[5].loop(0);
    }
   
    if (button==1)//if the button is activated, it displays the button}
    {
      image(thumb_button,x+8,y-5);
    }
      if(open_flower>0)//but if the flower is already open, it will display it together with lost petals if is the case
      {
        image(thumbs[open_flower],x+8,y-5);
      }
    }
  
  void messages()
  {
    textFont(font,18);
    if (message==1)
    {
      text ("Water helps balance",55,210);
      text ("your body fluids.",55,235); 
    }
    if (message==2)
    {
      text ("Water can help",55,210);
      text ("control calories.",55,235);
    }
    if (message==3)
    {
      text ("Water helps energize",55,210);
      text ("muscles.",55,235); 
    }
    if (message==4)
    {
      text ("Water helps skin",55,210);
      text ("looking good.",55,235); 
    }
    if (message==5)
    {
      text ("Water helps skin",55,210);
      text ("looking good.",55,235); 
    }
     if (message==6)
    {
      text ("Water helps your",55,210);
      text ("kidneys.",55,235); 
    }
     if (message==7)
    {
      text ("Water helps maintain",55,210);
      text ("normal bowel function.",55,235); 
    }
     if (message==8)
    {
      text ("Water improves",55,210);
      text ("your concentration.",55,235); 
    }
    if (message==9)
    {
      text ("You've just reached 50%",55,210);
      text ("of your daily goal!",55,235);
    }
    if (message==10)
    {
      text ("You're just half way",55,210);
      text ("from your daily goal!",55,235);
    }
    if (message==11)
    {
      text ("Your flower have",55,210);
      text ("now one petal back!",55,235);
    }
    if (message==12)
    {
      text ("I'm glad you're back!",55,210);
    }
    if (message==13)
    {
      text ("You're doing great!",55,185);
      text ("Just 25% more to go!",55,210);
    }
    if (message==14)
    {
      text ("Just a bit more and soon",55,185);
      text ("you'll reach your goal!",55,210);
    }
    if (message==15)
    {
      text ("you start now seing",55,185);
      text ("results. Congratulations!",55,210);
    }
    if (message==16)
    {
      text ("Your flower died. Time",55,185);
      text ("to restart with goal " + user_goal,55,210);
      text ("Good luck!" + user_goal,55,235);
    }
  }
 } 


