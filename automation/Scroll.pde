class Scroll extends Action {
  int wait; 
  int amt; 
  int down; 
  Robot r; 
  
  Scroll (String n, Robot r, int wait, int scrollAmt, int down) {
    super(n, r); 
    this.r = r; 
    this.down = down; 
    this.wait = wait; 
    this.amt = scrollAmt; 
  }
  
  @Override
  public void act() {
    wait(this.wait);
    
    int scrolls = 10; 
    int scrollAmount = amt / scrolls; 
    
    if (down < 0) {
      scrollAmount = scrollAmount * -1; 
    }
    
    for  (int i = 0; i < scrolls; i++) {
      wait(this.wait);
      println(scrollAmount);
      r.mouseWheel(scrollAmount);
    }
  }
  
}
  
  
    