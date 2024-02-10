//
//  Figures.swift
//  internTask_Framework_2
//
//  Created by Максим on 10.02.2024.
//

import Foundation

public enum FigureError: Error {
    case invalidTriangle
    case invalidCircle
}

public protocol AreaProtocol {
    func getArea() -> Float
}

public struct Circle: AreaProtocol {
    
    let radius: Float
    
    public init(radius: Float) throws {
        if radius < 0 {
            throw FigureError.invalidCircle
        } else {
            self.radius = radius
        }
    }
    
    public func getArea() -> Float {
        Float.pi * radius * radius
    }
}

public struct Triangle: AreaProtocol {
    
    let a: Float
    let b: Float
    let c: Float
    
    public init(a: Float, b: Float, c: Float) throws {
        if a <= 0 || b <= 0 || c <= 0 { // разделил 2 случая через else для повышения читаемости
            throw FigureError.invalidTriangle
        } else if a + b <= c || a + c <= b || b + c <= a {
            throw FigureError.invalidTriangle
        } else {
            self.a = a
            self.b = b
            self.c = c
        }
    }
    
    public var isRectangular: Bool {
        let sides = [a,b,c].sorted()
        
        if sides[2] * sides[2] == sides[0] * sides[0] + sides[1] * sides[1] {
            return true
        } else {
            return false
        }
    }
    
    public func getArea() -> Float {
        if isRectangular {
            let sides = [a,b,c].sorted()
            return sides[0] * sides[1] / 2
        } else {
            let semiPerimeter = (a + b + c) / 2
            return sqrt(semiPerimeter * (semiPerimeter - a) * (semiPerimeter - b) * (semiPerimeter - c))
        }
    }
}
