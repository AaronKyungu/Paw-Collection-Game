class bearTrap
{
  float x, y;
  int c1r = 125;
  PImage bearT1;
  bearTrap(float x, float y)
  {
    bearT1 =  loadImage("./sprites/beartrap0.png");
    this.x = x;
    this.y = y;
    c1r = 125;
  } // end of component bear

  void render()
  {
    beartrapanimation();
  } // end of render

  void beartrapanimation()
  {
    imageMode(CENTER);
    image(bearT1, this.x, this.y);
  }// end of void
} // end of bt class
