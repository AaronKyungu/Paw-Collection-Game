class Player
{
  float x, y;
  float speedX, speedY;
  int score = 0;

  // CIRCLE COLLISION DETECTION
  float c1r = 70; //circle1radius

  // ANIMATIONS
  PImage idleR0, idleR1, idleR2, idleR3, idleR4;
  PImage idleL0, idleL1, idleL2, idleL3, idleL4; 
  PImage walkright0, walkright1, walkright2, walkright3, walkright4, walkright5;
  PImage walkleft0, walkleft1, walkleft2, walkleft3, walkleft4, walkleft5;
  boolean lookingR;
  boolean trapCol = false;
  int animationCounter = 0; 

  Player(float x, float y, float speed)
  {
    this.speedX = speed;
    this.speedY = speed;
    this.x = x;
    this.y = y;
    reset();

    idleR0 = loadImage("./sprites/idleR0.png");
    idleR1 = loadImage("./sprites/idleR1.png");
    idleR2 = loadImage("./sprites/idleR2.png");
    idleR3 = loadImage("./sprites/idleR3.png");
    idleR4 = loadImage("./sprites/idleR4.png");

    idleL0 = loadImage("./sprites/idleleft0.png");
    idleL1 = loadImage("./sprites/idleleft1.png");
    idleL2 = loadImage("./sprites/idleleft2.png");
    idleL3 = loadImage("./sprites/idleleft3.png");
    idleL4 = loadImage("./sprites/idleleft4.png");

    walkright0 = loadImage("./sprites/right roobs walk_0.png");
    walkright1 = loadImage("./sprites/right roobs walk_1.png");
    walkright2 = loadImage("./sprites/right roobs walk_2.png");
    walkright3 = loadImage("./sprites/right roobs walk_3.png");
    walkright4 = loadImage("./sprites/right roobs walk_4.png");
    walkright5 = loadImage("./sprites/right roobs walk_5.png");

    walkleft0 = loadImage("./sprites/roobs left walk0.png");
    walkleft1 = loadImage("./sprites/roobs left walk1.png");
    walkleft2 = loadImage("./sprites/roobs left walk2.png");
    walkleft3 = loadImage("./sprites/roobs left walk3.png");
    walkleft4 = loadImage("./sprites/roobs left walk4.png");
    walkleft5 = loadImage("./sprites/roobs left walk5.png");
  } // end of constructor

  void reset()
  {
    score = 0;
    lookingR = true;
  }// end of reset void

  // PAW COLLECTING
  void checkForPawGetting()
  {
    textSize(65);
    fill(255);
    text("Score. " + score, 920, 80); // score text
    text(".", 920+160, 55); // no colon in this font
  } // end of PawGettin

  // MOVEMENT & ANIMATION
  void render()
  {
    shadow();
    animations();
    checkForPawGetting();
  }

  void shadow() //  use shadows as positioning and if they overlap u are on another object
  {
    // make x move when facing r and l
    if (lookingR == true)
    {
      noStroke();
      fill(0, 0, 0, 110);
      ellipse(this.x+10, this.y+180, 180, c1r);
    } else if (lookingR == false)
    {
      noStroke();
      fill(0, 0, 0, 110);
      ellipse(this.x-10, this.y+180, 180, c1r);
    } else
    {
      noStroke();
      fill(0, 0, 0, 110);
      ellipse(this.x, this.y+180, 180, 70);
      fill(0, 255, 255);
    }
  } // void shadow

  boolean circleCol(Paw paws)
  {
    float distXR = (this.x+10-bgX) - paws.x;
    float distXL = (this.x-10-bgX) - paws.x;
    float distY =  (this.y+180) - (paws.y+140);
    float distanceR = sqrt((distXR*distXR)+(distY*distY));
    float distanceL = sqrt((distXL*distXL)+(distY*distY));

    if (distanceR <= this.c1r+paws.c1r && lookingR == true || distanceL <= this.c1r+paws.c1r && lookingR == false) 
    {
      return true;
    }
    return false;
  } 

  boolean trapCol(bearTrap bt)
  {
    float distXR = (this.x+10-bgX) - bt.x;
    float distXL = (this.x-10-bgX) - bt.x;
    float distY =  (this.y+180) - (bt.y);
    float distanceR = sqrt((distXR*distXR)+(distY*distY));
    float distanceL = sqrt((distXL*distXL)+(distY*distY));

    if (distanceR <= this.c1r+bt.c1r && lookingR == true || distanceL <= this.c1r+bt.c1r && lookingR == false) 
    {
      return true;
    }
    return false;
  } 


  void idleL()
  {
    imageMode(CENTER);
    //cycle through images and back to image 1
    if (animationCounter >0 & animationCounter <=7)
    { 
      idleL0.resize(40*5, 81*5);
      image(idleL0, this.x, this.y);
    } else if (animationCounter >7 & animationCounter <=14)
    {
      idleL1.resize(40*5, 81*5);
      image(idleL1, this.x, this.y);
    } else if (animationCounter >14 & animationCounter <=21)
    {
      idleL2.resize(40*5, 81*5);
      image(idleL2, this.x, this.y);
    } else if (animationCounter >21 & animationCounter <=28)
    {
      idleL3.resize(40*5, 81*5);
      image(idleL3, this.x, this.y);
    } else 
    {
      idleL4.resize(40*5, 81*5);
      image(idleL4, this.x, this.y);
    }
    animationCounter = animationCounter + 1;
    if (animationCounter>35)
      animationCounter = 0;
  } // end of void 

  void idle()
  {
    //cycle through images and back to image 1
    if (animationCounter >0 & animationCounter <=7)
    { 
      idleR0.resize(40*5, 81*5);
      image(idleR0, this.x, this.y);
    } else if (animationCounter >7 & animationCounter <=14)
    {
      idleR1.resize(40*5, 81*5);
      image(idleR1, this.x, this.y);
    } else if (animationCounter >14 & animationCounter <=21)
    {
      idleR2.resize(40*5, 81*5);
      image(idleR2, this.x, this.y);
    } else if (animationCounter >21 & animationCounter <=28)
    {
      idleR3.resize(40*5, 81*5);
      image(idleR3, this.x, this.y);
    } else 
    {
      idleR4.resize(40*5, 81*5);
      image(idleR4, this.x, this.y);
    }
    animationCounter = animationCounter + 1;
    if (animationCounter>35)
      animationCounter = 0;
  } // end of void

  void walkright()
  {
    imageMode(CENTER);
    //cycle through images and back to image 1
    if (animationCounter >0 & animationCounter <=7)
    { 
      walkright0.resize(40*5, 81*5);
      image(walkright0, this.x, this.y);
    } else if (animationCounter >7 & animationCounter <=14)
    {
      walkright1.resize(40*5, 81*5);
      image(walkright1, this.x, this.y);
    } else if (animationCounter >14 & animationCounter <=21)
    {
      walkright2.resize(40*5, 81*5);
      image(walkright2, this.x, this.y);
    } else if (animationCounter >21 & animationCounter <=28)
    {
      walkright3.resize(40*5, 81*5);
      image(walkright3, this.x, this.y);
    } else if (animationCounter >28 & animationCounter <=35)
    {
      walkright4.resize(40*5, 81*5);
      image(walkright4, this.x, this.y);
    } else 
    {
      walkright5.resize(40*5, 81*5);
      image(walkright5, this.x, this.y);
    }
    animationCounter = animationCounter + 1;
    if (animationCounter>42)
      animationCounter = 0;
  } // end of void

  void walkleft()
  {
    imageMode(CENTER);
    //cycle through images and back to image 1
    if (animationCounter >0 & animationCounter <=7)
    { 
      walkleft0.resize(40*5, 81*5);
      image(walkleft0, this.x, this.y);
    } else if (animationCounter >7 & animationCounter <=14)
    {
      walkleft1.resize(40*5, 81*5);
      image(walkleft1, this.x, this.y);
    } else if (animationCounter >14 & animationCounter <=21)
    {
      walkleft2.resize(40*5, 81*5);
      image(walkleft2, this.x, this.y);
    } else if (animationCounter >21 & animationCounter <=28)
    {
      walkleft3.resize(40*5, 81*5);
      image(walkleft3, this.x, this.y);
    } else if (animationCounter >28 & animationCounter <=35)
    {
      walkleft4.resize(40*5, 81*5);
      image(walkleft4, this.x, this.y);
    } else 
    {
      walkleft5.resize(40*5, 81*5);
      image(walkleft5, this.x, this.y);
    }
    animationCounter = animationCounter + 1;
    if (animationCounter>42)
      animationCounter = 0;
  } // end of void

  void idleSS()
  {
    imageMode(CENTER);
    //cycle through images and back to image 1
    if (animationCounter >0 & animationCounter <=7)
    { 
      idleR0.resize(40*5, 81*5);
      image(idleR0, width/2, height/2);
    } else if (animationCounter >7 & animationCounter <=14)
    {
      idleR1.resize(40*5, 81*5);
      image(idleR1, width/2, height/2);
    } else if (animationCounter >14 & animationCounter <=21)
    {
      idleR2.resize(40*5, 81*5);
      image(idleR2, width/2, height/2);
    } else if (animationCounter >21 & animationCounter <=28)
    {
      idleR3.resize(40*5, 81*5);
      image(idleR3, width/2, height/2);
    } else 
    {
      idleR4.resize(40*5, 81*5);
      image(idleR4, width/2, height/2);
    }
    animationCounter = animationCounter + 1;
    if (animationCounter>35)
      animationCounter = 0;
  }//idleSS

  void animations()
  {
    if (Right)
    {
      walkright();
      lookingR = true;
      Right = true;
      //cosmetic
    } else if (Left)
    {
      walkleft();
      lookingR = false;
      Left = true;
      //cosmetic
    } else if (!Left&&!Right&&lookingR)
    {
      idle();
      lookingR = true;
      Left = false;
      Right = false;
      //comsetic
    } else if (!Left&&!Right && !lookingR)
    {
      idleL();
      lookingR = false;
      Left = false;
      Right = false;
      //cosmetic
    } else if (Left&&Right && lookingR)
    {
      idle(); 
      lookingR = true;
      Left = true;
      Right = true;
      // cosmetic
    } else if (Left&&Right && !lookingR)
    {
      idleL();
      lookingR = false;
      Left = true;
      Right = true;
      //cosmetic
    } else if (Up&&lookingR)
    {
      //walkright();
      lookingR = true;
      Up = true;
      //cosmetic
    } else if (Up&&!lookingR)
    {
      //walkleft();
      lookingR = false;
      Up = true;
      //cosmetic
    } // end of void
  }
} // end of class
