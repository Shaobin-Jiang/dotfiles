import Foundation
import Cocoa
import CoreGraphics

func moveMouse(direction: String?, position: String?) {
    let screenFrame = NSScreen.main?.frame ?? NSRect(x: 0, y: 0, width: 1920, height: 1080)
    let centerPoint = NSPoint(x: screenFrame.midX, y: screenFrame.midY)
    var currentMouseLocation = NSEvent.mouseLocation
    currentMouseLocation.y = screenFrame.height - currentMouseLocation.y // convert to Cocoa coordinates
    
    var newPoint: NSPoint
    
    if let pos = position {
        let components = pos.components(separatedBy: ",")
        if components.count == 2,
           let x = Int(components[0]),
           let y = Int(components[1]) {
            newPoint = NSPoint(x: CGFloat(x), y: CGFloat(y))
        } else {
            print("Invalid position format. Use x,y")
            return
        }
    } else if let dir = direction?.lowercased() {
        let distance: CGFloat = 200
        switch dir {
            case "up":
                newPoint = NSPoint(x: currentMouseLocation.x, y: currentMouseLocation.y - distance)
            case "down":
                newPoint = NSPoint(x: currentMouseLocation.x, y: currentMouseLocation.y + distance)
            case "left":
                newPoint = NSPoint(x: currentMouseLocation.x - distance, y: currentMouseLocation.y)
            case "right":
                newPoint = NSPoint(x: currentMouseLocation.x + distance, y: currentMouseLocation.y)
            case "center":
                newPoint = centerPoint
            default:
                print("Invalid direction. Use up/down/left/right/center")
                return
        }
    } else {
        print("No direction or position specified")
        return
    }
    
    newPoint.x = max(0, min(screenFrame.width, newPoint.x))
    newPoint.y = max(0, min(screenFrame.height, newPoint.y))
    
    let event = CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: newPoint, mouseButton: .left)
    event?.post(tap: .cghidEventTap)
}

func clickMouse() {
    guard let currentMouseLocation = CGEvent(source: nil)?.location else {
        print("Cannot get cursor position")
        return
    }
    
    let mouseDownEvent = CGEvent(mouseEventSource: nil, mouseType: .leftMouseDown, mouseCursorPosition: currentMouseLocation, mouseButton: .left)
    let mouseUpEvent = CGEvent(mouseEventSource: nil, mouseType: .leftMouseUp, mouseCursorPosition: currentMouseLocation, mouseButton: .left)
    
    mouseDownEvent?.post(tap: .cghidEventTap)
    mouseUpEvent?.post(tap: .cghidEventTap)
}

let help = """
Usage:
swift cursor.swift [up|down|left|right|center]
swift cursor.swift position x,y
swift cursor.swift click
"""

if CommandLine.arguments.count > 1 {
    let argument = CommandLine.arguments[1].lowercased()
    
    if ["up", "down", "left", "right", "center"].contains(argument) {
        moveMouse(direction: argument, position: nil)
    } else if argument == "position" && CommandLine.arguments.count > 2 {
        moveMouse(direction: nil, position: CommandLine.arguments[2])
    } else if argument == "click" {
        clickMouse()
    } else {
        print(help)
    }
} else {
    print(help)
}
