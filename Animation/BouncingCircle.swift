//
//  EmptySketch.swift
//  Animation
//
//  Created by Russell Gordon on 2020-06-08.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class BouncingCircle: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
   
   
  
    var x1 = Int.random(in: 1...500)
    var y1 = Int.random(in: 1...500)
    var dx1 = 1
    var dy1 = 1
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        canvas.drawShapesWithBorders = false
    }
    
    // This function runs repeatedly, forever, to create the animated effect

    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
    
        let int = Int.random(in: 1...500)
        let int2 = Int.random(in: 1...500)
        let rainbow = Color(hue: int2, saturation: int, brightness: int, alpha: int)
      
//        canvas.fillColor = Color.black
        canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 0, alpha: 10)
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: 500, height: 500)

    canvas.fillColor = rainbow
     
    y1 += dy1
    x1 += dx1
      
    
       
    canvas.drawEllipse(at: Point(x: x1, y: y1), width: 30, height: 30)
        
    if x1 >= 500 {
        dx1 = -1
        
    } else if x1 <= 0 {
        dx1 = Int.random(in: -5...175)
        
    }  else if y1 >= 500 {
            dy1 = -1
        
    }   else if y1 <= 0 {
        dy1 = +1
    }

 

    }


    
}

    

//    func draw() {
//        let offWhite = Color(hue: 81, saturation: 5, brightness: 88, alpha: 100)
//        canvas.drawRectangle(at: Point(x: 300, y: 300), width: 800, height: 800,anchoredBy: AnchorPosition.centre)
//        canvas.borderColor =  offWhite
//        canvas.defaultBorderWidth = 10
//        y3 -= 1
//        x3 -= 1
//        canvas.drawEllipse(at: Point(x: x3, y: y3), width: 50, height: 50)
//        if x3 > 500 || x3 < 0{
//            x3 += 1
//            y3 += 2
//        }else if
//            y3 > 500 || y3 < 0{
//            y3 += 1
//            x3 += 2
//        }
//
//
//    }
//
//}
