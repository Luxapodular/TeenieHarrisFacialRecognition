// Script created for processing 3

import java.awt.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.awt.MouseInfo;
import java.awt.Point;
import java.awt.event.InputEvent;

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
  
  testRun(50,50, r, 500); 
}

void draw() {
  
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
  }
}

void mousePressed() {
  if (record) {
    

void testRun(int x, int y, Robot r, int ms) {
  ClickLoc cl = new ClickLoc(x,y,r,ms);
  cl.waitAndClick(); 
}



  
  