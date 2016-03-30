// A class designed to move a robot to a position.
class Loc extends Action {
  int x; 
  int y; 
  Robot r; 
  
  Loc(String n, int x, int y, Robot r) {
    super(n, r); 
    this.x = x; 
    this.y = y; 
    this.r = r;
  }
  
  @Override 
  public void act() {
    this.moveTo(); 
  }
  
  // Move a robot to this location.
  void moveTo() {
    this.r.mouseMove(this.x, this.y); 
  }
  
  void setLoc(int x, int y) {
    this.x = x; 
    this.y = y;
  }
  // Print the location to console. 
  void getLocation() {
    println(Integer.toString(this.x) + " " + Integer.toString(this.y)); 
  }
  
  Robot getRobot() {
    return this.r; 
  }
}