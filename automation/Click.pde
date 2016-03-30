class Click extends Action {
  Robot r; 
  int wait; 
  boolean shift; 
  boolean doubleClick; 
  
  Click(String n, Robot r, int wait, boolean doubleClick, boolean shift) {
    super(n, r);
    this.wait = wait; 
    this.r = r; 
    this.wait = wait; 
    this.shift = shift; 
  }
  
  @Override
  public void act() {
    if (shift) {
      this.r.keyPress(KeyEvent.VK_SHIFT); 
    }
    
    wait(wait); 
    click(); 
    if (doubleClick) {
      click(); 
    }
    
    
    if (shift) {
      this.r.keyRelease(KeyEvent.VK_SHIFT); 
    }
  }
  
  @Override 
  public String toString() {
    return "Click Action!";
  }
  
}
  
  