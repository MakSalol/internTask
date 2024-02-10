//
//  internTask_Framework_1Tests.swift
//  internTask_Framework_1Tests
//
//  Created by Максим on 10.02.2024.
//

import XCTest
@testable import internTask_Framework_1

final class internTask_Framework_1Tests: XCTestCase {

    var figureSolver: FigureSolver!
    
    override func setUp() {
        super.setUp()
        figureSolver = FigureSolver()
    }

    func testCorrectFiguresInit() {
        let correctTriangle = Triangle(a: 3, b: 4, c: 5)
        let correctCircle = Circle(radius: 10)
        
        XCTAssertNotNil(correctTriangle, "Init корректного треугольника")
        XCTAssertNotNil(correctCircle, "Init Корректного круга")
    }
    
    func testIncorrectFiguresInit() {
        let incorrectTriangle1 = Triangle(a: -3, b: 4, c: 4)
        let incorrectTriangle2 = Triangle(a: 1 , b: 2, c: 10)
        
        let incorrectCircle = Circle(radius: -10)
        
        XCTAssertNil(incorrectTriangle1, "Init когда одна из сторон треугольника <= 0")
        XCTAssertNil(incorrectTriangle2, "Init треугольника с невозможными сторонами")
        
        XCTAssertNil(incorrectCircle, "Init круга с отрицательным радиусом")
    }
    
    func testFigureSolverIncorrectInput() {
        let incorrectTriangle = Triangle(a: -3, b: 4, c: 4)
        let incorrectCircle = Circle(radius: -10)
        
        XCTAssertEqual(figureSolver.getArea(of: incorrectCircle), 0, "Некорректный треугольник передан в FigureSolver")
        XCTAssertEqual(figureSolver.getArea(of: incorrectTriangle), 0, "Некорректный круг передан в FigureSolver")
    }
    
    func testFigureSolverCorrectInput() {
        let correctRectangularTriangle = Triangle(a: 3, b: 4, c: 5)
        let correctTriangle = Triangle(a: 4, b: 4, c: 4)
        let correctCircle = Circle(radius: 10)
        
        let correctRectangularTriangleArea: Float = 3 * 4 / 2
        let correctTriangleArea: Float = 4 * sqrt(3)
        let correctCircleArea: Float = Float.pi * 10 * 10
        
        XCTAssertEqual(figureSolver.getArea(of: correctCircle), correctCircleArea, "Круг передан в FigureSolver, проверка площади")
        XCTAssertEqual(figureSolver.getArea(of: correctRectangularTriangle), correctRectangularTriangleArea, "Прямоугольный треугольник передан в FigureSolver, проверка площади")
        XCTAssertEqual(figureSolver.getArea(of: correctTriangle), correctTriangleArea, "Непрямоугольный треугольник передан в FigureSolver, проверка площади")
        

    }
    
    func testRectangularity() {
        let correctRectangularTriangle = Triangle(a: 3, b: 4, c: 5)
        let correctTriangle = Triangle(a: 4, b: 4, c: 4)
        let incorrectTriangle = Triangle(a: -3, b: 4, c: 4)
        
        XCTAssertEqual(correctRectangularTriangle?.isRectangular, true, "Проверка прямоугольного треугольника")
        XCTAssertEqual(correctTriangle?.isRectangular, false, "Проверка непрямоугольного треугольника")
        XCTAssertNil(incorrectTriangle?.isRectangular, "Проверка некорректного треугольника")
    }
}
