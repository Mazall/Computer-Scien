//: [Previous](@previous) / [Next](@next)
//: # Blank canvas to copy
//:
//: ## To duplicate this page
//:
//: Place your cursor on line 19 of this page, press `Command-A` to select all text, and then `Command-C` to copy.
//:
//: Two-finger tap on the playground, then choose **New Playground Page**:
//:
//: ![new-playground](new-playground.png "New Playground")
//:
//: Move to the new page and press `Command-A` to select all text there, then `Command-V` to paste.
//:
/*:
 ## Canvas size
 
 
 Set the size of your desired canvas by adjusting the constants on lines 19 and 20.
 */
let preferredWidth = 400
let preferredHeight = 600
/*:
 ## Required code
 
 
 Lines 28 to 36 are required to make the playground run.
 
 
 Please do not remove.
 */
import Cocoa
import PlaygroundSupport
import CanvasGraphics

// Create canvas
let canvas = Canvas(width: preferredWidth, height: preferredHeight)

// Show the canvas in the playground's live view
PlaygroundPage.current.liveView = canvas
/*:
 ## Add your code
 
 
 Beginning on line 48, write a meaningful comment.
 
 
 You can remove the code on line 49 and begin writing your own code.
 
 
 [Documentation](http://russellgordon.ca/CanvasGraphics/Documentation/) is available.
 
 */

// Color constants
let offWhite = Color(hue: 81, saturation: 5, brightness: 88, alpha: 100)
let limeGreen = Color(hue: 106, saturation: 64, brightness: 73, alpha: 100)


// Turn off borders
canvas.drawShapesWithBorders = false

// Green background
canvas.fillColor = limeGreen
canvas.drawRectangle(at: Point(x: 0, y: 0), width: 400, height: 600)

// Black background for bottom part
canvas.fillColor = Color.black
canvas.drawRectangle(at: Point(x: 0, y: 0), width: 400, height: 400)



// Draw all the circles
canvas.fillColor = limeGreen
for y in stride(from: 0, through: 400, by: 40) {
    for x in stride(from: 0, through: 400, by: 40) {
        
        
        // Set the fill
        if x == 0 || x == 400 || y == 0 || y == 400 || y + x > 400 || y == 20{
            canvas.fillColor = limeGreen
       } else {
            canvas.fillColor = offWhite
        }
        
        // Draw the circles
        canvas.drawEllipse(at: Point(x: x, y: y), width: 35, height: 35)

        
    }
    
    
}


//top left text including big pixies

canvas.fillColor = Color.white
canvas.drawText(message: "pixies", at: Point(x: 10, y: 410), size: 65, kerning: 1)
canvas.drawText(message: "saturday", at: Point(x: 10, y: 545), size: 10, kerning: 1)
canvas.drawText(message: "december 13 1986", at: Point(x: 10, y: 530), size: 10, kerning: 1)
canvas.drawText(message: "9 pm over 21", at: Point(x: 10, y: 515), size: 10, kerning: 1)

//top right text

canvas.drawText(message: "at the rat", at: Point(x: 270, y: 545), size: 10, kerning: 1)
canvas.drawText(message: "528 commonwealth", at: Point(x: 270, y: 530), size: 10, kerning: 1)
canvas.drawText(message: "boston, mass.", at: Point(x: 270, y: 515), size: 10, kerning: 1)

//bottom right text

canvas.textColor = offWhite

canvas.drawText(message: "with", at: Point(x: 270, y: 460), size: 13, kerning: 1)
canvas.drawText(message: "throwing muses", at: Point(x: 270, y: 445), size: 13, kerning: 1)
canvas.drawText(message: "big dipper", at: Point(x: 270, y: 430), size: 13, kerning: 1)


canvas.drawAxes(withScale: true, by: 50)


/*:
 ## Show the Assistant Editor
 Don't see any results?
 
 
 Remember to show the Assistant Editor (1), and then switch to Live View (2):
 
 
 ![timeline](timeline.png "Timeline")
 
 ## Use source control
 To keep your work organized, receive feedback, and earn a high grade in this course, regular use of source control is a must.
 
 
 Please commit and push your work often.
 
 
 ![source_control](source-control.png "Source Control")
 */

