class CountDown
{
  public int durationSeconds;

  public CountDown(int duration)
  {
    this.durationSeconds = duration;
  }

  public int getRemainingTime() //return the seconds left on the timer or 0
  { //millis() processing command, returns time in 1000ths sec since program started
    return max(0, durationSeconds - millis()/1000) ;
  }

  // make Start Time
  
  void display()
  {
    textFont(bitFill, 16); ///////////8bit
    fill(255);
    textSize(65);
    text(timer.getRemainingTime(), 175, 80); //display seconds remaining top left + manual spacing alignment 
    text("Time.", 30, 80); 
    text(".", 142, 55);
  } // end of display
} // end of class
