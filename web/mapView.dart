library mapView;

import 'dart:html';
import 'dart:core';
import './hero.dart';

const GRID = true;

var tileWidth = 30;
var tileHeight = 30;

var sizeFieldX = 10;
var sizeFieldY = 10;
int tileX = 0;
int tileY = 0;

class MapView {

  /**
   * 
   * Draws the whole map
   * 
   * @return void
   */
  void drawMap(CanvasRenderingContext2D context) {
    
    for(var x = 0; x < sizeFieldX; x++) {
      for(var y = 0; y < sizeFieldY; y++){
        drawTile(context, x, y);
      }
    }
    
    if(GRID == true){
      for(var x = 0; x < sizeFieldX; x++) {
        for(var y = 0; y < sizeFieldY; y++){
          drawGrid(context, x, y);
        }
      }
    }
  
  }
  
  /**
   * 
   * Draws one single tile of the map
   * 
   * @return void
   */
  void drawTile(CanvasRenderingContext2D context, int x, int y) {
    
    //clear the tiles
    //context.clearRect(x*tileWidth, y*tileHeight, tileWidth, tileHeight)
    
    context.fillStyle = "lightGreen";
    context.fillRect(x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  }
  
  /**
   * 
   * Draw the grid for the map
   * 
   */
  void drawGrid(CanvasRenderingContext2D context, int x, int y){
    
    //clear the gridfield
    //context.clearRect(x*tileWidth, y*tileHeight, tileWidth, tileHeight);
    
    context.strokeStyle = 'black';
    context.lineWidth = 1;
    context.strokeRect(x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  }
  
  /**
   * 
   * Draw hover on mousepoint
   * 
   **/
  void drawHoverOnMouseOver(CanvasRenderingContext2D context, mouseX, mouseY) {
    int xCoord = ((mouseX/tileWidth).floor()*tileWidth).toInt();
    int yCoord = ((mouseY/tileHeight).floor()*tileHeight).toInt();
    
    if(xCoord != tileX || yCoord != tileY){
      //draw new
      this.drawTile(context, (tileX/tileWidth).floor().toInt(), (tileY/tileHeight).floor().toInt());
      this.drawGrid(context, (tileX/tileWidth).floor().toInt(), (tileY/tileHeight).floor().toInt());
      tileX = xCoord;
      tileY = yCoord;
    }   
    
    //clear the mouseover
    //context.clearRect(xCoord, yCoord, tileWidth, tileHeight);
    
    context.fillStyle = 'white';
    context.fillRect(xCoord, yCoord, tileWidth, tileHeight);
  }
  
  /**
   * draw hero 
   */
  Hero paintHero(CanvasRenderingContext2D context, Hero h){
    ImageElement image = h.getImage();
    image.on.load.add((e){
      context.drawImage(image, h.getX()*tileWidth, h.getY()*tileHeight, image.width, image.height);
    });
    
    this.drawTile(context, h.getOldX(), h.getOldY());
    this.drawGrid(context, h.getOldX(), h.getOldY());
    h.setOldCoords();
    context.drawImage(image, h.getX()*tileWidth, h.getY()*tileHeight, image.width, image.height);
    return h;
  }
}
