//
//  internTask_Framework_2Tests.swift
//  internTask_Framework_2Tests
//
//  Created by Максим on 10.02.2024.
//

import XCTest
@testable import internTask_Framework_2

final class internTask_Framework_2Tests: XCTestCase {

    var figureSolver: FigureSolver!
    
    override func setUp() {
        super.setUp()
        figureSolver = FigureSolver()
    }

    func testCorrectFiguresInit() {
        XCTAssertNoThrow(try Triangle(a: 3, b: 4, c: 5), "Init корректного треугольника")
        XCTAssertNoThrow(try Circle(radius: 10), "Init корректного круга")
    }
    
    func testIncorrectFiguresInit() {
        XCTAssertThrowsError(try Triangle(a: -3, b: 4, c: 4), "Init когда одна из сторон треугольника <= 0") { error in
            XCTAssertEqual(error as? FigureError, .invalidTriangle, "Проверка на корректность ошибки с треугольником")
        }
        
        XCTAssertThrowsError(try Triangle(a: 1 , b: 2, c: 10), "Init треугольника с невозможными сторонами") { error in
            XCTAssertEqual(error as? FigureError, .invalidTriangle, "Проверка на корректность ошибки с треугольником")
        }
        
        XCTAssertThrowsError(try Circle(radius: -10), "Init круга с отрицательным радиусом") { error in
            XCTAssertEqual(error as? FigureError, .invalidCircle, "Проверка на корректность ошибки с кругом")
        }
    }
    
    func testFigureSolverInput() {
        do {
            let correctRectangularTriangle = try Triangle(a: 3, b: 4, c: 5)
            let correctTriangle = try Triangle(a: 4, b: 4, c: 4)
            let correctCircle = try Circle(radius: 10)
            
            let correctRectangularTriangleArea: Float = 3 * 4 / 2
            let correctTriangleArea: Float = 4 * sqrt(3)
            let correctCircleArea: Float = Float.pi * 10 * 10
            
            XCTAssertEqual(figureSolver.getArea(of: correctCircle), correctCircleArea, "Круг передан в FigureSolver, проверка площади")
            XCTAssertEqual(figureSolver.getArea(of: correctRectangularTriangle), correctRectangularTriangleArea, "Прямоугольный треугольник передан в FigureSolver, проверка площади")
            XCTAssertEqual(figureSolver.getArea(of: correctTriangle), correctTriangleArea, "Непрямоугольный треугольник передан в FigureSolver, проверка площади")
        } catch {
            XCTAssertNil(error, "Проверка отсутствия ошибки")
        }
        
    }
    
    func testRectangularity() {
        do {
            let correctRectangularTriangle = try Triangle(a: 3, b: 4, c: 5)
            let correctTriangle = try Triangle(a: 4, b: 4, c: 4)
            
            XCTAssertEqual(correctRectangularTriangle.isRectangular, true, "Проверка прямоугольного треугольника")
            XCTAssertEqual(correctTriangle.isRectangular, false, "Проверка непрямоугольного треугольника")
        } catch {
            XCTAssertNil(error, "Проверка отсутствия ошибки")
        }
    }
}
