//
//  BasicSketch.swift
//  Animation
//
//  Created by Russell Gordon on 2020-06-08.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation
import CanvasGraphics

class Loading: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    var x = 0
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        let int = Int.random(in: 1...500)
        let int2 = Int.random(in: 1...500)
        let rainbow = Color(hue: int2, saturation: int, brightness: int, alpha: Int(int2))
        
        canvas.drawShapesWithFill = false
        canvas.drawShapesWithBorders = true
        canvas.defaultBorderWidth = 10
        canvas.borderColor = rainbow
        
        canvas.textColor = Color.black
        canvas.drawText(message: "Loading . . .", at: Point(x: 50, y: 300), size: 30, kerning: 15)
        
        canvas.drawRectangle(at: Point(x: 5, y: 100), width: 490, height: 100)
        
        
        x += 1
        if x >= 490 {
            canvas.drawShapesWithFill = true
            canvas.drawShapesWithBorders = false
            canvas.fillColor = Color.red
            canvas.drawRectangle(at: Point(x: 0, y: 0), width: 1000, height: 1000)
            canvas.textColor = rainbow
            canvas.drawText(message: "ayooooooo", at: Point(x: 250, y: 250), size: 70, kerning: 10)
        }
        
        canvas.fillColor = Color.black
        canvas.borderColor = Color.green
        canvas.drawShapesWithFill = true
        
        canvas.drawRectangle(at: Point(x: x, y: 150), width: 30, height: 80, anchoredBy: .centre)
    }
    
}
