class Lives
{
  int x, y;
  int numOfLives;
  PImage heart3, heart2, heart1, heart0;

  Lives(int x, int y)
  {
    heart3 = loadImage("./sprites/3heart.png");
    heart2 = loadImage("./sprites/2heart.png");
    heart1 = loadImage("./sprites/1heart.png");
    heart0 = loadImage("./sprites/0heart.png");

    numOfLives = 3; // start of lives
    this.x = x;
    this.y = y;
  } // end of component

  void render()
  { 
    livesR();
  } // end of render void

  void livesR()
  {
    imageMode(CORNER);
    if (numOfLives == 3)
      image(heart3, this.x, this.y);
    else if (numOfLives == 2)
      image(heart2, this.x, this.y);
    else if (numOfLives == 1)
      image(heart1, this.x, this.y);
    else if (numOfLives == 0)
      image(heart0, this.x, this.y);
  } //end of livesR
} //end of class
