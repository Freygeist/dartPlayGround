library mapView;

import 'dart:html';
import 'dart:core';

const GRID = true;

var tileWidth = 30;
var tileHeight = 30;

var sizeFieldX = 10;
var sizeFieldY = 10;

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
    //context.clearRect(x*tileWidth, y*tileHeight, tileWidth, tileHeight);
    
    context.fillStyle = "lightGreen";
    context.rect(x*tileWidth, y*tileHeight, tileWidth, tileHeight);
    context.fill();
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
    var xCoord = (mouseX/tileWidth).floor()*tileWidth;
    var yCoord = (mouseY/tileHeight).floor()*tileHeight;
    
    
    //clear the mouseover
    context.clearRect(xCoord, yCoord, tileWidth, tileHeight);
    
    context.fillStyle = 'white';
    context.fillRect(xCoord, yCoord, tileWidth, tileHeight);
  }
}
