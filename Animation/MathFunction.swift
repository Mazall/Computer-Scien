//
//  IndividualSpiral.swift
//  Animation
//
//  Created by Russell Gordon on 2020-11-09.
//  Copyright © 2020 Royal St. George's College. All rights reserved.
//
import Foundation
import CanvasGraphics


// Enumeration
// Defining a list of choices that you want the user of your code to be able to select from
enum FunctionType {
    case linear
    case quadratic
    case cubic
    case squareRoot
    case absoluteValue
    case exponential
    case reciprocal
    case yoAlien
    case sine
}

// Shape type
enum ShapeType {
    case none
    case star
}
// Define a class that creates a mathematical function
// - a "class" is just a way to group data (properties) together
//   with behaviour (things that we want to happen)
class MathFunction {
    
    // 1. Properties
    //
    //    A property is something that describes the item.
    //    e.g.: A student at LCS has a house, a hair color, a height
    var lastPoint: Point
    var a: CGFloat      // Vertical stretch / compression / reflection
    var k: CGFloat      // Horizontal stretch
    var d: CGFloat      // Horizontal shift
    var c: CGFloat      // Vertical shift
    var type: FunctionType // Tell us what shape / math function to use
    var delayInSeconds: Int // How much of a delay to have before the animation begins
    var shapeType: ShapeType // What shape to draw along the path, if any
    
    
    // 2. Initializer
    //
    //    An initializer has one job: give each property an initial
    //    value
    init(a: CGFloat,
         k: CGFloat,
         d: CGFloat,
         c: CGFloat,
         canvas: Canvas,
         type : FunctionType,
         delayInSeconds: Int = 0,
         shapeType: ShapeType = .none) {
        
        // I want every function to begin at the same position
        self.lastPoint = Point(x: -1 * canvas.width / 2 - 5, y: 0)
        
        // Initialize all properties
        self.a = a
        self.k = k
        self.d = d
        self.c = c
        self.type = type
        self.delayInSeconds = delayInSeconds
        
        // I want every function to begin at the same position
        self.lastPoint = Point(x: -1 * canvas.width / 2 - 5, y: 0)
        self.shapeType = shapeType
    }
    
    // 3. Methods
    //
    //    Here we describe what behaviour we want to have happen.
    
    // Update (or draw) the position of this spiral
    
    
    
    func update(on canvas: Canvas, usingInputValue x: Int) {
        
        // Only draw on the canvas after the delay in seconds has been reached
        if canvas.frameCount > delayInSeconds * canvas.framesPerSecond {
            
            // Make sure each re-draw of all the functions begins off-screen
            if x == 0 {
                // I want every function to begin at the same position
                self.lastPoint = Point(x: -1 * canvas.width / 2 - 5, y: 0)
                
            }
            
            
            // Start drawing after the first frames
            if x > 0  && x < canvas.width {
                
                
                // Determine the next x position
                let nextX : Degrees = Degrees(x - canvas.width / 2)
                
                // Determine the next y position
                var nextY : CGFloat = 0.0
                
                // Set y usuing a quadratic function
                switch type {
                case .linear:
                    nextY = a * ((nextX - d) / k) + c
                case .quadratic:
                    nextY = a * pow((nextX - d) / k, 2.0) + c
                case .cubic:
                    nextY = a * pow((nextX - d) / k, 3.0) + c
                case .squareRoot:
                    nextY = a * sqrt((nextX - d) / k) + c
                case .reciprocal:
                    nextY = a * 1.0/((nextX - d) / k) + c
                case .absoluteValue:
                    nextY = a * abs((nextX - d) / k) + c
                case .exponential:
                    nextY = a * exp((nextX - d) / k) + c
                case .yoAlien:
                    nextY = a * 120.4/((nextX - d) / k) + c
                case .sine:
                    nextY = a * sin((nextX.asRadians() - d) / k) + c
                }
                
                
                
                // Set the next point
                let nextPoint = Point(x: nextX, y: nextY)
                //            print(nextPoint)
                
                // Set the line color
                canvas.lineColor = Color(hue: 0,
                                         saturation: 80,
                                         brightness: 90,
                                         alpha: 100)
                canvas.defaultLineWidth = 10
                // Draw a line from the last point to the next point
                
                if shapeType == .none {
                    
                    // Draw a line from the last point to the next point
                    canvas.drawLine(from: lastPoint, to: nextPoint)
                    
                    
                } else if shapeType == .star {
                  
                    // Yellow color
                    let int = Int.random(in: 1...500)
                    let int2 = Int.random(in: 1...500)
                    let rainbow = Color(hue: int2, saturation: int, brightness: 100, alpha: Int(int2))
                    
                    canvas.fillColor = rainbow
                    
                    canvas.drawShapesWithFill = true
                    
                    var star: [Point] = []
                    star.append(Point(x: nextX + 0, y: nextY - 50))
                    star.append(Point(x: nextX + 14, y: nextY - 20))
                    star.append(Point(x: nextX + 47, y: nextY - 15))
                    star.append(Point(x: nextX + 23, y: nextY + 7))
                    star.append(Point(x: nextX + 29, y: nextY + 40))
                    star.append(Point(x: nextX + 0, y: nextY + 25))
                    star.append(Point(x: nextX - 29, y: nextY + 40))
                    star.append(Point(x: nextX - 23, y: nextY + 7))
                    star.append(Point(x: nextX - 47, y: nextY - 15))
                    star.append(Point(x: nextX - 14, y: nextY - 20))
                    canvas.drawCustomShape(with: star)
                    
                    // Set the "new" last point, now that the line is drawn
                    
                    lastPoint = nextPoint
                    
                }
                
            }
            
            
            
            
            
        }
        
    }
}
