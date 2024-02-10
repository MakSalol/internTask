import Foundation

/*
 Я сделал 2 варианта кода, потому что в задании не сказано, как обрабатывать некорректные случаи
 задания геометрических фигур.
 
 1 вариант: Если фигура задана некорректно, то использую failable init
 2 вариант: Если фигура задана некорректно, то использую throwing init
 
 Здесь реализован вариант 1
 
 Также не совсем понятно про пункт "Проверка на то, является ли треугольник прямоугольным".
 Нужно ли это только для альтернативного вычисления площади треугольника или это нужно в том числе для конечного пользователя? Поэтому на всякий случай оставил это свойство публичным.
 */

public protocol AreaProtocol {
    func getArea() -> Float
}

public struct Circle: AreaProtocol {
    
    let radius: Float
    
    public init?(radius: Float) {
        if radius < 0 {
            return nil
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
    
    public init?(a: Float, b: Float, c: Float) {
        if a <= 0 || b <= 0 || c <= 0 { // разделил 2 случая через else для повышения читаемости
            return nil
        } else if a + b <= c || a + c <= b || b + c <= a {
            return nil
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
