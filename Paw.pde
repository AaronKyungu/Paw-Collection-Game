class Paw
{
  float x;
  float y;
  // CIRCLE COLLISION DETECTION
  float c1r = 45; //shadowcircle1

  PImage paw0, paw1, paw2, paw3, paw4;
  int animationCounter = 0; 

  Paw(float x, float y) // constructor
  {
    paw0 =  loadImage("./sprites/paw_0.png");
    paw1 =  loadImage("./sprites/paw_1.png");
    paw2 =  loadImage("./sprites/paw_2.png");
    paw3 =  loadImage("./sprites/paw_3.png");
    paw4 =  loadImage("./sprites/paw_4.png");

    this.x = x;
    this.y = y;
    c1r = 45;
  } 

  void render()
  {
    pawFloat();
    shadow();
    textSize(34);
  } // end of paw void

  void shadow() //  use shadows as positioning and if they overlap u are on another object
  {
    noStroke();
    fill(0, 0, 0, 100);
    ellipse(this.x, this.y+140, 90, c1r);
  }// can add cosmetic movement/increase/decrease of shadow

  // ANIMATION
  void pawFloat()
  {
    imageMode(CENTER);
    //cycle through images and back to image 1
    if (animationCounter >0 & animationCounter <=8)
      image(paw0, this.x, y);
    else if (animationCounter >8 & animationCounter <=16)
      image(paw1, this.x, y);
    else if (animationCounter >16 & animationCounter <=24)
      image(paw2, this.x, y);
    else if (animationCounter >24 & animationCounter <=32)
      image(paw3, this.x, y);
    else 
    image(paw4, this.x, y);

    animationCounter = animationCounter + 1;
    if (animationCounter>40)
      animationCounter = 0;
  } // end of pawFloat void
} // end of paw class
