library hero;

import 'dart:html';

class Hero {

  int x = 10;
  int y = 10;
  int oldX = 0;
  int oldY = 0;
  String name = "";
  int speed = 0;
  ImageElement image = new ImageElement(src:"./img/Hero.gif", width:18, height:31);

    
  Hero(int x, int y, int speed){
    this.x = x;
    this.y = y;
    this.oldX = x;
    this.oldY = y;
    this.speed = speed;
  }
  
  //TODO spriteschneiden
  
  void moveUp(){
    this.y--;
  }
  
  void moveDown(){
    this.y++;
  }
  
  void moveLeft(){
    this.x--;
  }
  
  void moveRight(){
    this.x++;
  }
  
  void setOldCoords(){
    this.oldX = x;
    this.oldY = y;
  }
  
  ImageElement getImage(){
    return this.image;
  }
  
  int getX(){
    return this.x;
  }
  
  int getY(){
    return this.y;
  }
  
  int getOldX(){
    return this.oldX;
  }
  
  int getOldY(){
    return this.oldY;
  }
  
}
