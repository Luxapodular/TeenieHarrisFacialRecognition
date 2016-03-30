class Action {
  String name; 
  Robot r; 
  
  Action(String n, Robot r) {
    this.name = n; 
    this.r = r; 
  }
  
  public void act() {}
  
  public String toString() { return "Action! " + name; }
  
  public Robot getRobot() {
    return r;
  }
  
  // Move the robot to our location, wait the specified amount of time
  // and click. 
  public void moveAndClick(Loc l, int wait) {
    l.moveTo(); 
    wait(wait);
    click();
  }
  
  // Wait a specified amount of time in milliseconds. 
  public void wait(int ms) {
    try {
      Thread.sleep(ms); // In milliseconds
    } catch(InterruptedException ex) {
      Thread.currentThread().interrupt();
    }
  }
  
  // Click the position which this robot is located. 
  public void click() {
    if (this.getRobot() != null) {
      this.r.mousePress(InputEvent.BUTTON1_MASK);
      this.r.mouseRelease(InputEvent.BUTTON1_MASK);
    } else {
      println("ROBOT NULL"); 
    }
  }
  
}

  
  