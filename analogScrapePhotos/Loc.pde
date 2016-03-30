// A class designed to move a robot to a position.
class Loc {
  int x; 
  int y; 
  Robot r; 
  
  Loc(int x, int y, Robot r) {
    this.x = x; 
    this.y = y; 
    this.r = r;
  }
  
  // Move a robot to this location.
  void moveTo() {
    this.r.mouseMove(this.x, this.y); 
  }
  
  // Print the location to console. 
  void getLocation() {
    println(Integer.toString(this.x) + " " + Integer.toString(this.y)); 
  }
  
  Robot getRobot() {
    return this.r; 
  }
}