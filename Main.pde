//AARON KYUNGU, 20050297, PROGRAMMING ASSIGNMENT 

CountDown timer;
Player ruby;
Lives livehearts;

//GAME MODES 
final int STARTSCREEN = 0;
final int PLAY = 1;
final int TIMEOVER = 2;
final int GAMEOVER = 3;

//GLOBAL VARIABLES
public int gameMode = STARTSCREEN;
public boolean Left, Right, Up, Down, Space;
private int bgX = 0;
private PImage background;
public PFont bitFill;

//ARRAY LISTS
ArrayList<Paw> pawList = new ArrayList();
ArrayList<bearTrap> trapList = new ArrayList();

void setup()
{
  size(1200, 900);
  background = loadImage("./sprites/GrassPark.png");
  background.resize(2155*3, height);
  bitFill = createFont("./sprites/8bitlim.ttf", 16);

  livehearts = new Lives(30, 100);
  ruby = new Player(width/2, height/2, 8); //player
  
  Left = false;
  Right = false;
  Up = false;
  Down = false;
  Space = false;
}

void draw()
{
  //STARTSCREEN//
  if (gameMode == STARTSCREEN)
  {
    tint(120);
    drawBG();
    tint(255);
    ruby.idleSS();

    textFont(bitFill, 16);
    textSize(80);
    textAlign(CENTER);
    text("PRESS SPACE TO START", width/2, 125);

    textSize(55);
    text("Collect paws and avoid traps!", width/2, 750);

    if (keyCode == ' ')
    {
      gameMode = PLAY;
      time();
      //spawn traps
      for (int i = 0; i < 7; i++)
      {
        float tx = random(260, 6000);
        float ty = random(400, 830);
        trapList.add(new bearTrap(tx, ty));
      }
      //spawn paws
      for (int i = 0; i < 10; i++)
      {
        float px = random(260, 6000);
        float py = random(320, 670);
        pawList.add(new Paw(px, py));
      }
    }
  } // end of start screen

  //PLAYING//
  if (gameMode == PLAY)
  {
    textAlign(LEFT);
    drawBG(); // background & camera movement
    pushMatrix();
    translate(bgX, 0);

    //BEARTRAPS RENDERING 
    for (int i = 0; i < trapList.size(); i++) 
    {
      bearTrap currentTrap = trapList.get(i);
      trapList.get(i).render();

      if (ruby.trapCol(currentTrap)) 
      {
        trapList.remove(i);
        livehearts.numOfLives = livehearts.numOfLives - 1;
      }
    } // end of bearTrap for loop

    //PAWS RENDERING 
    for (int i = 0; i < pawList.size(); i++) 
    {
      Paw currentPaw = pawList.get(i);

      pawList.get(i).render();
      text(i, currentPaw.x, currentPaw.y-90);

      if (ruby.circleCol(currentPaw)) 
      {
        text("hit", width/2, height/2);
        //gameMode = FINISHED;
        pawList.remove(i);
        ruby.score = ruby.score + 1;
      }
    } // end of Paw for loop
    popMatrix();
    ruby.render();
    livehearts.render();
    timer.display();
    //IF YOU LOSE ALL LIVES
    if (livehearts.numOfLives == 0)
    {
      gameMode = GAMEOVER;
    }
    
    //IF YOU LOSE TIME
    if (timer.getRemainingTime() == 0)
    {
      gameMode = TIMEOVER;
    }
  } //end of PLAY


  if (gameMode == GAMEOVER)
  {
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(100);
    text("GAME OVER", width/2, height/2);

    fill(255);
    textSize(50);
    text("PRESS SPACE TO RESTART", width/2, 700);

    if (keyCode == ' ')
    {
      restart();
      gameMode = PLAY;
    }
  } // end of GAMEOVER

  if (gameMode == TIMEOVER)
  {
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(100);
    text("GAME OVER", width/2, height/2);

    fill(255);
    textSize(50);
    text("PRESS SPACE TO EXIT", width/2, 700);

    if (keyCode == ' ')
    {
      exit();
    }
  } // end of TIMEOVER
} // end of draw

void time()
{
  timer = new CountDown(60);
}

void drawBG()
{
  imageMode(CORNER);
  image(background, bgX, 0); //draw background twice adjacent
  // background moving when at certain x and moving forward and back

  if (ruby.x <= 260 && bgX < 0 && keyCode==LEFT)   //180   // && Left == true
  {
    bgX = bgX + 5;
  } else if (ruby.x >= 930 && bgX > -2000 - 3200 && keyCode==RIGHT) //idk why this is the right one but stick w it //-2000-3200   //Right == true
  {
    bgX = bgX - 5;     //sort this problem out
  }
}

void restart() 
{
  time();
  bgX = 0;
  livehearts = new Lives(30, 100);
  ruby = new Player(width/2, height/2, 8); //player
  ruby.score = 0;
  pawList = new ArrayList<Paw>();
  trapList = new ArrayList<bearTrap>();
  for (int i = 0; i < 7; i++)
  {
    float tx = random(260, 6000);
    float ty = random(400, 830);
    trapList.add(new bearTrap(tx, ty));
  }
      //spawn paws
  for (int i = 0; i < 10; i++)
  {
    float px = random(260, 6000);
    float py = random(320, 670);
    pawList.add(new Paw(px, py));
  }
  
  Left = false;
  Right = false;
  Up = false;
  Down = false;
  Space = false;
  
}

void keyPressed() //movement
{
  if (key==CODED)
  {
    if (keyCode==UP && ruby.y >= 320)
    {
      ruby.y= ruby.y - ruby.speedY;
      Up = true;
    } else if (keyCode==DOWN && ruby.y<=height - 255)
    {
      ruby.y= ruby.y + ruby.speedY;
      Down = true;
    } else if (keyCode==LEFT && ruby.x>=0+260)
    {
      ruby.x = ruby.x - ruby.speedX;
      Left = true;
    } else if (keyCode==RIGHT && ruby.x<=width-270)
    {
      ruby.x = ruby.x + ruby.speedX;
      Right = true;
    } 
    if (keyCode == ' ')
    {
      Space = true;
    }
  } // end of if
} // end of keyPressed

void keyReleased()
{
  if (keyCode==UP)
  {
    Up = false;
  }
  if (keyCode==DOWN)
  {
    Down = false;
  }
  if (keyCode==LEFT)
  {
    Left = false;
  }
  if (keyCode==RIGHT)
  {
    Right = false;
  }
  if (keyCode == ' ')
  {
    Space = false;
  }
} // end of keyReleased
