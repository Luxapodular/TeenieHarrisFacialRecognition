class Click implements Action {
  Loc l; 
  int wait; 
  
  Click(String n, int x, int y, Robot r, int wait) {
    super(n);
    l = new Loc(x,y,r); 
    this.wait = wait; 
  }
  
  public void act() {
    waitAndClick(); 
  }
  
  public String toString() {
    return "Click Action! At " + 
    "(" + Integer.toString(x) "," + Integer.toString(y) + ") Wait Of " 
        + Integer.toString(wait) + "milliseconds.";
  }
  
}

// A class designed to move to and click on a location with a robot. 
class ClickLoc extends Loc {
  Robot r; 
  int wait; // milliseconds to wait. 
  
  // A location on the screen. 
  ClickLoc(int x, int y, Robot r, int wait) {
    super(x,y,r); 
    this.wait = wait;
  }
  
  // Change the amount of time this location waits before clicking. 
  void setWait(int wait) {
    this.wait = wait;
  }
  
  // Move the robot to our location, wait the specified amount of time
  // and click. 
  void waitAndClick() {
    moveTo(); 
    wait(this.wait);
    click();
  }
    
  // Wait a specified amount of time in milliseconds. 
  private void wait(int ms) {
    try {
      Thread.sleep(ms); // In milliseconds
    } catch(InterruptedException ex) {
      Thread.currentThread().interrupt();
    }
  }
  
  // Click the position which this robot is located. 
  private void click() {
    if (this.getRobot() != null) {
      this.getRobot().mousePress(InputEvent.BUTTON1_MASK);
      this.getRobot().mouseRelease(InputEvent.BUTTON1_MASK);
    } else {
      println("ROBOT NULL"); 
    }
  }
  
}