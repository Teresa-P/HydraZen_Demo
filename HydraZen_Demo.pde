/*
HydraZen - Application that stimulates water consumption at MITI
Application developed by Teresa Paulino, Ana Canha, Pedro Santos, Dino Nunes and Joel Rodrigues
Interface & Interaction Design - 2013
*/

//Programmed by Teresa Paulino
//16-03-2013
//v.1.0

//Global variables
Butterfly[] butterfly = new Butterfly[3] ;
Dragonfly[] dragonfly = new Dragonfly[2] ;
Leaf[] leaves = new Leaf[7];
PImage[] swan= new PImage[19];
PImage openFlowers[] = new PImage[21];
PImage petals[]= new PImage[20];
PImage thumbs[] = new PImage[21];
String[] lines;
int total_users=60;
User[] users = new User[total_users];
int userID[][] = new int[7][9];
String[] dataLines;
int user;
Boolean display_profile = false;
Boolean display_once = false;
PFont font; 
Boolean reset = false;
PImage screen;
PImage screen1;
PImage groups_list;
int x = 0;
int prize = 0;
int group1_counter = 0;
float group1_goal = 0;
int group2_counter = 0;
float group2_goal = 0;
int group3_counter = 0;
float group3_goal = 0;
int group4_counter=0;
float group4_goal = 0;
int group5_counter = 0;
float group5_goal = 0;
int group6_counter = 0;
float group6_goal = 0;
int group7_counter = 0;
float group7_goal = 0;
int user_goal;
int user_Dlevel;
float group1_sum = 0;
float group2_sum = 0;
float group3_sum = 0;
float group4_sum = 0;
float group5_sum = 0;
float group6_sum = 0;
float group7_sum = 0;
int group;
Boolean groupScreen = true;
int percent = 0;
Boolean listInactive = true;
Boolean listActive = false;
int var1 = 0;
int var2 = 0;
int var3 = 0;
int var4 = 0;
int var5 = 0;
int var6 = 0;
int var7 = 0;
int group_code;
Swan swanI;
String line;
Boolean info = false;
Petal petal;
Boolean fall_petal = false;
int seq_petal = 0;



//using ddf.minim library in order to be possible to play sounds
import ddf.minim.*;
Minim minim;
AudioPlayer sounds[] = new AudioPlayer[7];




void setup()
{
  size(960,540);
  screen = loadImage("background960.jpg");
  //the use of two variables are needed for the background, screen1 keeps the same along all
  //program, screen will change in order to be possible the use of animated images
  screen1 = loadImage("background960.jpg");
  groups_list = loadImage("groups_list.png");
  
  image(screen,0,0);
  smooth();
  font = loadFont("TempusSansITC.vlw");
  lines = loadStrings("users_list.txt");
  
  //reading the lines from the text file "users_list.txt" and filling the array with users
  for (int i=0; i<lines.length; i++)
      {
        dataLines = split(lines[i], ',');
        users[i] = new User(dataLines[0],int(dataLines[1]),(dataLines[2]),int(dataLines[3]),int(dataLines[4]), int(dataLines[5]),int(dataLines[6]),int(dataLines[7]),int(dataLines[8]),int(dataLines[9]),int(dataLines[10]),int(dataLines[11]),int(dataLines[12]),int(dataLines[13]),int(dataLines[14]),int(dataLines[15]),int(dataLines[16]));
        group = int(dataLines[1]);
        user_goal = int(dataLines[3]);
        user_Dlevel = int(dataLines[15]);
        //invoking the method that will split information by group
        groups_data();

      }
        
          //filling the array swan with images
   for (int r=0;r<19;r++)
   {
   swan[r] = loadImage("swan"+ r + ".png");
   }    
   
   petal = new Petal("petal.png",int(random(500,600)),int(random(150,350)));
   
   //filling the array openFlowers 
   for (int s=1; s <= 20; s ++)
   {
   openFlowers[s] = loadImage("openFlower" + s + ".png");
   }   
   
   //filling the array thumbs
   for (int a=1; a <= 20; a ++)
   {
   thumbs[a] = loadImage("thumb_openFlower" + a + ".png");
   }   
   
   //filling the array petals 
   for (int t=1; t < 20; t ++)
   {
   petals[t] = loadImage("petal" + t + ".png");
   }   
   
   //filling the butterfly and dragonfly arrays with images
   
   butterfly[0] = new Butterfly("butterfly1.png",480, 300);
   butterfly[1] = new Butterfly("butterfly2.png",480, 300);
   butterfly[2] = new Butterfly("butterfly3.png",480, 300);
   
   dragonfly[0] = new Dragonfly("dragonfly1.png",400, 250);
   dragonfly[1] = new Dragonfly("dragonfly2.png",400, 250);
   
   //enabling sound and filling the array sounds
   minim = new Minim(this);
   sounds[0] = minim.loadFile("sound0.wav");
   sounds[1] = minim.loadFile("sound1.wav");
   sounds[2] = minim.loadFile("sound2.wav");
   sounds[3] = minim.loadFile("sound3.wav");
   sounds[4] = minim.loadFile("sound4.wav");
   sounds[5] = minim.loadFile("sound5.wav");
   sounds[6] = minim.loadFile("sound6.wav");


// if something-something break;

   
 }
 
 void draw()
 {
    
   if (groupScreen == true)//displaying groups leaves screen
   {
     frameRate(8);
     info=true;
     image(screen,0,0);
     petal.load();
     petal.move();
     if (display_once == false)
       {
         image(screen1,0,0);
         if (seq_petal == 0)
         {
            users[int(random(1,59))].load_thumbs();
         }
        if (seq_petal == 1)
         {
           seq_petal = 2;
           image(screen,0,0);
         }
         if (seq_petal == 3)
         {
           seq_petal = 4;
           image(screen,0,0);
         }
         if (seq_petal == 5)
         {
           seq_petal = 6;
           image(screen,0,0);
         }
       
       
       
       //updating groups information
         
       groups_data_update();
       
       
       //displaying leaves
       for (int x=0; x<7; x++)
       {
         leaves[x].display_leaves();
       }
       screen=get();
       display_once=true;
       
       }
     
   }
   
  if (reset == true)//if a new day is activated resets the daily_level values for all users
   {
     if (display_once == false)
     {
       for (int i=1; i<total_users; i++)
       {
         users[i].new_day();
        
         
         
       }
        //writing_data();
        reset = false;
        display_once = true;  
        
     }
     exit();
   }

   if (display_profile == true)//displaying the user profile considering the levels achieved so far
   {
     frameRate(8);
     if (display_once == false)//this alows the profile to appear only once and not looping trough frames
     {

        //println(user);
        users[user].display();
        users[user].daily_levels();
        users[user].button();
        users[user].open_flower();
        users[user].groups();
        //reading the actual pixels on the screen to be used with animation sequence
        screen=get();
               
           
     }
     
     display_once = true;
           
    }
    
    
    if (prize == 1) 
    {
      butterfly_anim();
    }
    if (prize==2) 
    {
      dragonfly_anim();
    }
    
    if (fall_petal == true)
    {
      image(screen,0,0);
      petal.load();
      petal.move();
    }
    
 }
  

 
 void keyPressed()
 {
   
   if (keyPressed == true)
   prize = 0;
   groupScreen = false;
   {
     if (key =='f'||key == 'F')//pressing the f key will simulate someone randomly fill the cup
     {       
       user = int(random(1,total_users));
       groupScreen = false;
       display_profile = true;  //enables the profile display
       display_once = false;  //avoids looping many times the same procedure
       fall_petal = true;
       
       
     }
     else if(key == 'n'||key == 'N')//instruction for a new day
     {
       //image(loadImage("background960.jpg"),0,0);
       
       //display_once=false;
       //resets daily groups information
       group1_sum = 0;
       group2_sum = 0;
       group3_sum = 0;
       group4_sum = 0;
       group5_sum = 0;
       group6_sum = 0;
       group7_sum = 0;
       //groupScreen = true;
       display_once = false;
       reset = true;
       //groupScreen = false;
      
     }
     
     else if(key == '1')//user number 1 fill the cup
     {
       user = 1;
       groupScreen = false;
       display_profile = true;  //enables the profile display
       display_once = false;  //avoids looping many times the same procedure
     }
     else if(key == '2')//user number 1 fill the cup
     {
       user = 2;
       groupScreen = false;
       display_profile = true;  //enables the profile display
       display_once = false;  //avoids looping many times the same procedure
     }
     else if(key == '3')//user number 1 fill the cup
     {
       user = 3;
       groupScreen = false;
       display_profile = true;  //enables the profile display
       display_once = false;  //avoids looping many times the same procedure
     }
     
     else if(key == 'g'|| key == 'G')//groups screen is activated
     {
       reset = false;
       groupScreen = true;
       display_once = false;
       image(screen1,0,0); 
       listInactive = true;
       listActive = false;
       seq_petal = 0;     
     }
   }
 }
 
 void butterfly_anim()//butterfly animation
  {
    frameRate(8);
    
  if (x<3)//changing sequential images to simulate the animation
   {
     image(screen,0,0);
     butterfly[x].load();
    
     x++;
   }
   else
   {
     x = 0;
   }
  }
 
 void dragonfly_anim()//dragonfly animation
  {
    frameRate(24);
  if (x<2)//changing sequential images to simulate the animation
   {
     image(screen,0,0);
     dragonfly[x].load();
     x++;
   }
   else
   {
     x = 0;
   }
  }
void groups_data()//method that splits information by group
{
  
  if (group == 1)
  {
    group1_counter++;//counting the number of users belonging to this group
    group1_goal = group1_goal + user_goal;//full group goal
    group1_sum = group1_sum + user_Dlevel;//full group 
    leaves[0] = new Leaf(group1_counter, group1_goal, group1_sum, 40, 380 );
  }
  
  else if (group == 2)
  {
    group2_counter++;
    
    group2_goal = group2_goal + user_goal;
    group2_sum = group2_sum + user_Dlevel;
    leaves[1] = new Leaf(group2_counter, group2_goal, group2_sum, 175, 350 );
  }
  else if (group==3)
  {
    group3_counter++;
    
    group3_goal = group3_goal + user_goal;
    group3_sum = group3_sum + user_Dlevel;
    leaves[2] = new Leaf(group3_counter, group3_goal, group3_sum, 275, 405 );
  }
   else if (group==4)
  {
    group4_counter++;
    
    group4_goal = group4_goal + user_goal;
    group4_sum = group4_sum + user_Dlevel;
    leaves[3] = new Leaf(group4_counter, group4_goal, group4_sum, 340, 347 );
  }
    else if (group==5)
  {
    group5_counter++;
    
    group5_goal = group5_goal + user_goal;
    group5_sum = group5_sum + user_Dlevel;
    leaves[4] = new Leaf(group5_counter, group5_goal, group5_sum, 480, 345 );
  }
  else if (group==6)
  {
    group6_counter++;
    
    group6_goal = group6_goal + user_goal;
    group6_sum = group6_sum + user_Dlevel;
    leaves[5] = new Leaf(group6_counter, group6_goal, group6_sum, 420, 410 );
  }
   else if (group==7)
  {
    group7_counter++;
    
    group7_goal = group7_goal + user_goal;
    group7_sum = group7_sum + user_Dlevel;
    leaves[6] = new Leaf(group7_counter, group7_goal, group7_sum, 570, 407 );
  }
  
}


void groups_data_update()//updating the groups information on each change
{
  //updating the objects leaves, one per group with the variables updated
  leaves[0] = new Leaf(group1_counter, group1_goal, group1_sum, 40, 380 );
  leaves[1] = new Leaf(group2_counter, group2_goal, group2_sum, 175, 350 );
  leaves[2] = new Leaf(group3_counter, group3_goal, group3_sum, 275, 405 );
  leaves[3] = new Leaf(group4_counter, group4_goal, group4_sum, 340, 347 );
  leaves[4] = new Leaf(group5_counter, group5_goal, group5_sum, 480, 345 );
  leaves[5] = new Leaf(group6_counter, group6_goal, group6_sum, 420, 410 );
  leaves[6] = new Leaf(group7_counter, group7_goal, group7_sum, 570, 407 );
  }

void mousePressed()//when mouse is pressed
{
    if (mousePressed)
    {
     int x = mouseX;
     int y = mouseY;
     textFont(font,30);
     
     if (listInactive==true)
     {
        fall_petal=false;
        groupScreen = false;
        fill(0);
        textFont(font,35);
        listInactive = false;
        int var1 = 0;
        int var2 = 0;
        int var3 = 0;
        int var4 = 0;
        int var5 = 0;
        int var6 = 0;
        int var7 = 0;
                
         if (x > 75 && x < 175 && y > 395 && y < 445)//if you press on the first leaf...
         {
           group_code = 0;
           int xC = 100;
           int yC = 170;
           image(groups_list,0,0);//displays the panel with the list of users belonging to group 1
           text ("PHAT students",100,110);
           for (int i = 1; i<total_users; i++)
           {
             //lists the names
           if (users[i].group == 1)
           {
              textFont(font,30);
              percent = int((users[i].daily_level*100)/group1_goal);//calculating individual contribution to group goal
              text (users[i].name,xC,yC);
              text (percent + " %", (xC+310), yC);
              yC = yC+45;  
              userID[0][var1] = i;//filling the array userID that will help to connect the name  on the list to the array users            
              if (yC>400)//in case the column is already long, continues listing on the next column
              {
                xC = xC+400;
                yC = 170;
              }
              listActive = true;
              swanI = new Swan(group1_goal, group1_sum);
              swanI.display_swan();
              var1++;
            }                                   
          }
        }
        
        if(x>210 && x<310 && y>375 && y<425)//same procedure to the other leaves
        {
          group_code = 1;
          int xC = 100;
          int yC = 170;
          image(groups_list,0,0);
          text ("Professors",100,110);
          textFont(font,30);
          for (int i = 0; i<total_users; i++)
          {
             if (users[i].group ==2)
             {
                percent = int((users[i].daily_level*100)/group2_goal);
                text (users[i].name,xC,yC);
                text (percent + " %", (xC+310), yC);
                yC = yC+45;
                userID[1][var2] = i;
                if (yC > 400)//in case the column is already long, continues listing on the next column
                {
                  xC = xC+400;
                  yC = 170;
                }
                listActive = true;
                swanI = new Swan(group2_goal, group2_sum);
                swanI.display_swan();
                var2++;
             }
            }
         }
         
         if(x>310 && x<410 && y>430 && y<480)
         {
            int xC = 100;
            int yC = 170;
            group_code = 2;
            image(groups_list,0,0);
            text ("MCS Students",100,110);
            textFont(font,30);
            for (int i = 0; i<total_users; i++)
            {
               if (users[i].group == 3)
               {
                  percent = int((users[i].daily_level*100)/group3_goal);
                  text (users[i].name,xC,yC);
                  text (percent + " %", (xC+310), yC);
                  yC = yC+45;
                  userID[2][var3] = i;
                  if (yC>400)//in case the column is already long, continues listing on the next column
                  {
                    xC = xC+400;
                    yC = 170;
                   }
                   listActive = true;
                   swanI = new Swan(group3_goal, group3_sum);
                   swanI.display_swan();
                   var3++;
                }
             }
           }
           if(x > 375 && x < 435 && y > 375 && y < 425)
           {
              int xC = 100;
              int yC = 170;
              image(groups_list,0,0);
              group_code = 3;
              text ("Admin",100,110);
              textFont(font,30);
              for (int i = 0; i<total_users; i++)
              {
                 if (users[i].group == 4)
                 {
                    percent = int((users[i].daily_level*100)/group4_goal);
                    text (users[i].name,xC,yC);
                    text (percent + " %", (xC+310), yC);
                    yC=yC+45;
                    userID[3][var4] = i;
                    if (yC>400)//in case the column is already long, continues listing on the next column
                    {
                      xC = xC+400;
                      yC = 170;
                    }
                    
                    listActive = true;
                    swanI = new Swan(group4_goal, group4_sum);
                    swanI.display_swan();
                    var4++;
                  }
               }
     
            }
            if(x>515 && x<615 && y > 370 && y < 420)
            {
              int xC = 100;
              int yC = 170;
              image(groups_list,0,0);
              group_code = 4;
              text ("MHCI Students",100,110);
              textFont(font,30);
              for (int i = 0; i<total_users; i++)
              {      
                if (users[i].group == 5)
                {
                  percent = int((users[i].daily_level*100)/group5_goal);
                  text (users[i].name,xC,yC);
                  text (percent + " %", (xC+310), yC);
                  yC = yC+45;
                  userID[4][var5] = i;
                  if (yC>400)//in case the column is already long, continues listing on the next column
                  {
                    xC = xC+400;
                    yC = 170;
                  }
                  
                  listActive = true;
                  swanI = new Swan(group5_goal, group5_sum);
                  swanI.display_swan();
                  var5++;
                 }
               }
             }
             if(x>455 && x<555 && y > 435 && y < 485)
             {
                int xC = 100;
                int yC = 170;
                image(groups_list,0,0);
                group_code = 5;
                text ("MET Students",100,110);
                textFont(font,30);
                for (int i = 0; i < total_users; i++)
                {
                  if (users[i].group == 6)
                  {
                    percent = int((users[i].daily_level*100)/group6_goal);
                    text (users[i].name,xC,yC);
                    text (percent + " %", (xC+310), yC);
                    yC = yC+45;
                    userID[5][var6] = i;
                    if (yC>400)//in case the column is already long, continues listing on the next column
                    {
                      xC = xC+400;
                      yC = 170;
                     }
                     
                     listActive = true;
                     swanI = new Swan(group6_goal, group6_sum);
                     swanI.display_swan();
                     var6++;
                   }
                }
              }
              if(x > 605 && x < 705 && y > 430 && y < 480)
              {
                int xC = 100;
                int yC = 170;
                image(groups_list,0,0);
                group_code = 6;
                text ("Researchers",100,110);
                textFont(font,30);
                for (int i = 0; i<total_users; i++)
                {
                   if (users[i].group == 7)
                   {
                      percent = int((users[i].daily_level*100)/group7_goal);
                      text (users[i].name,xC,yC);
                      text (percent + " %", (xC+320), yC);
                      yC = yC+45;
                      userID[6][var7] = i;
                      if (yC > 400)//in case the column is already long, continues listing on the next column
                      {
                        xC = xC+400;
                        yC = 170;
                      }
                      
                      listActive = true;
                      swanI = new Swan(group7_goal, group7_sum);
                      swanI.display_swan();
                      var7++;
                    }
                 }
              }
          
        }
 
        if (listActive == true)
        {
          info = true;
          
          
          if (x > 100 && x < 200)
          {
             if (y > 150 && y < 170)
             {
               users[userID[group_code][0]].display();  
               listInactive = true;
               listActive = false;
                              
             }
             else if (y > 195 && y < 215)
             {
               users[userID[group_code][1]].display();
               listInactive = true;
               listActive = false;
             }
             else if (y > 240 && y < 260)
             {
               users[userID[group_code][2]].display();
               listInactive = true;
               listActive = false;
             }
             else if (y > 285 && y < 305)
             {
               users[userID[group_code][3]].display();
               listInactive = true;
               listActive = false;
             }
             else if (y > 330 && y < 350)
             {
               users[userID[group_code][4]].display();
               listInactive = true;
               listActive = false;
             }
             else if (y > 375 && y < 395)
             {
               users[userID[group_code][5]].display();
               listInactive = true;
               listActive = false;
             }
             
          }
          if (x > 500 && x < 600)
          {
            if (y > 150 && y < 170)
            {
              //users[userID[group_code][6]].groups();
              users[userID[group_code][6]].display();
              listInactive = true;
              listActive = false;
            }
            else if (y > 195 && y < 215)
            {
              //users[userID[group_code][7]].groups();
              users[userID[group_code][7]].display();
              listInactive = true;
              listActive = false;
            }
            else if (y > 240 && y < 260)
            {
               //users[userID[group_code][8]].groups();
               users[userID[group_code][8]].display();
               listInactive = true;
               listActive = false;
            }
          }
          if (x > 860)
          {
            display_once = false;
            groupScreen = true;
            image(screen1,0,0);
            listInactive = true;
            listActive = false;
            //fall_petal=true;
          }
        }
      }  
}

//saving data on the external file
void writing_data()
{
  for (int i = 0; i < total_users; i++)
  {
    line = (users[i].name +"," + Integer.toString(users[i].group) +"," + users[i].picture +"," + Integer.toString(users[i].user_goal) + "," +Integer.toString(users[i].first) + "," + Integer.toString(users[i].min_achieved)+ "," +Integer.toString(users[i].med_achieved)+ "," +Integer.toString(users[i].goal_achieved) + "," +Integer.toString(users[i].not_min) +"," + Integer.toString(users[i].min_counter) + "," +Integer.toString(users[i].med_counter) +"," + Integer.toString(users[i].goal_counter) +"," + Integer.toString(users[i].button) + "," + Integer.toString(users[i].open_flower) + "," + Integer.toString(users[i].background)+ "," + Integer.toString(users[i].daily_level)+ "," + Integer.toString(users[i].lost_petals));
    lines[i] = line;
  }
  saveStrings("users_list.txt", lines); 
}

//stoping the sounds
void stop()
{
  for (int i = 0; i < 7; i++)
  {
    sounds[i].close();
  }
  minim.stop();
  super.stop();
}


void exit()
{
  //when exit save data     
  writing_data();
  super.exit();
}

