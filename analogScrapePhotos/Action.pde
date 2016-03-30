// Define a standard for creating actions which can be anything from a click, drag to
// a keystroke. 
public interface Action {
  String name; 
  Robot r; 
  
  Action(String n, Robot r) {
    this.name = n; 
  }
  
  public void act() {}
  
  public String toString() { return "Action! " + name; }
  
  public Robot getRobot() {
    return r;
  }
   
  // Move the robot to our location, wait the specified amount of time
  // and click. 
  private void waitAndClick(Loc l, int wait) {
    l.moveTo(); 
    wait(wait);
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