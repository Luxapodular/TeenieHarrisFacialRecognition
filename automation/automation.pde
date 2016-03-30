// Script created for processing 3

import java.awt.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.util.List; 
import java.awt.MouseInfo;
import java.awt.Point;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.awt.MouseInfo; 

boolean start = false; 
boolean record = false; 
List<Action> actions = new ArrayList<Action>(); 

Robot r;

void setup() {
  try {
    r = new Robot();
  } catch (AWTException e) {
    println("Error creating robot.");
  }
  
  testRun(r); 
}

void draw() {
  Point p = MouseInfo.getPointerInfo().getLocation(); 
  
  println(p.x + " " + p.y);

}

void keyPressed() {
  switch(key) {
    case 'r':
      record = true; 
      println("RECORDING"); 
      break; 
    case 's':
      record = false; 
      println("STOPPED RECORDING");
      break; 
    case 'e':
      actions.clear(); 
      println("CLEARED ACTIONS"); 
      break; 
    case 'p':
      exit();
      break; 
  }
}

void testRun(Robot r) {
  //actions.add(new Loc("MoveToWindow", 300, 250,r)); 
  //actions.add(new Click("CLICK", r, 300, true, false)); 
  //actions.add(new Scroll("Scroll", r, 300, 1500, -1));
  //actions.add(new Drag("SCROLL", 388, 220, 388, 290, r, 400));
  
  for (Action a : actions) {
    a.act(); 
  }
  
  
  
  
}