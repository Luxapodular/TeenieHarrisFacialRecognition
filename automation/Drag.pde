// Not complete 
class Drag extends Action {
  Loc l; 
  int x1; 
  int y1; 
  int x2; 
  int y2; 
  int wait; 
  Robot r; 
  
  Drag (String n, int x1, int y1, int x2, int y2, Robot r, int wait) {
    super(n, r); 
    this.x1 = x1; 
    this.y1 = y1; 
    this.x2 = x2; 
    this.y2 = y2; 
    l = new Loc(n,x1,y1,r); 
    this.r = r; 
    this.wait = wait; 
  }
  
  @Override
  public void act() {
    wait(this.wait);
    l.moveTo(); 
    this.r.mousePress(InputEvent.BUTTON1_MASK);
    wait(this.wait);
    r.mouseWheel(-100);
    
    
    //int nx = x1; 
    //int ny = y1; 
    //float interpolation = .1; 
    //int totalPositions = 100; 
    //int numTimes = int(totalPositions * interpolation);
    //for (int i = 0; i < ; i++) {
    //  wait(this.wait);
      
    //  //nx = int(lerp(nx, x2, interpolation));
    //  //ny = int(lerp(ny, y2, interpolation));
    //  //l.setLoc(nx, ny);
    //  //l.moveTo(); 
    //}
    
    this.r.mouseRelease(InputEvent.BUTTON1_MASK); 
  }
  
}
  
  
    