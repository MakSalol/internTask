import Foundation


// Здесь реализован вариант 1


public struct FigureSolver {
    public func getArea(of figure: AreaProtocol?) -> Float {
        guard let figure = figure else { return 0 }
        
        return figure.getArea()
    }
}
