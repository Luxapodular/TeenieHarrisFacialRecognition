class Wait extends Action {
  int wait; 
  
  Wait(int wait, Robot r) {
    super("Wait", r); 
    this.wait = wait; 
  }
  
  @Override 
  public void act() {
    wait(this.wait); 
  }
  
}