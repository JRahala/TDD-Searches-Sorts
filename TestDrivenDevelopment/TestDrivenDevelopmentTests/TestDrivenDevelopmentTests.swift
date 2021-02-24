//
//  TestDrivenDevelopmentTests.swift
//  TestDrivenDevelopmentTests
//
//  Created by Rahala, Jasamrit (Coll) on 28/01/2021.
//

import XCTest
@testable import TestDrivenDevelopment


class TestDrivenDevelopmentTests: XCTestCase {
    
    let Searcher = Search()
    let Sorter = Sort()
    
    
    func testLinearValid(){
        
        XCTAssertEqual(try Searcher.linearSearch(intArray: [1,2,3,4,-5], target: 4), 3)
        XCTAssertEqual(try Searcher.linearSearch(intArray: [7,5,-8,6,9,10], target: 10), 5)
        XCTAssertEqual(try Searcher.linearSearch(intArray: [91,-2,45,7,1,0], target: 2), -1)
        
    }
    
    func testLinearErroneous(){
        
        XCTAssertThrowsError(try Searcher.linearSearch(intArray: ["ASDF"], target: 0))
        XCTAssertThrowsError(try Searcher.linearSearch(intArray: [1,4,6,2,2], target: "F"))
        XCTAssertThrowsError(try Searcher.linearSearch(intArray: "HELLO WORLD", target: "ANSWER"))
        
    }
    
    func testLinearBoundary(){
        
        XCTAssertEqual(try Searcher.linearSearch(intArray: [], target: 5), -1)
        XCTAssertEqual(try Searcher.linearSearch(intArray: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100], target: 100), 16)
        XCTAssertEqual(try Searcher.linearSearch(intArray: [-9999999,999999], target: 999999), 1)
        
    }
    
    func testBinaryValid(){
        
        XCTAssertEqual(try Searcher.binarySearch(intArray: [1,2,3,4,5], target: 4), 3)
        XCTAssertEqual(try Searcher.binarySearch(intArray: [10,56,125,126], target: 10), 0)
        XCTAssertEqual(try Searcher.binarySearch(intArray: [-23,0,1,19], target: 0), 1)
        
    }
    
    func testBinaryErroneous(){
        
        XCTAssertEqual(try Searcher.binarySearch(intArray: "TEXT IS COOL", target: 4), 3)
        XCTAssertEqual(try Searcher.binarySearch(intArray: [10,56,125,126], target: 10), 0)
        XCTAssertEqual(try Searcher.binarySearch(intArray: [-23,0,1,19], target: 0), 1)
        
    }
    
    func testBinaryBoundary(){
        
        XCTAssertEqual(try Searcher.binarySearch(intArray: [], target: 100), -1)
        XCTAssertEqual(try Searcher.binarySearch(intArray: [-888888,88888888], target: 88888888), 1)
        XCTAssertEqual(try Searcher.binarySearch(intArray: [0,1,1,1,1,1,1,1,1,1,1], target: 0), 0)
        XCTAssertEqual(try Searcher.binarySearch(intArray: [1,1,1,1,1,1,1,1,1,1,2], target: 2), 10)
        
    }
    
    
    func testMergeSortValid(){
        
        XCTAssertEqual(Sorter.mergeSort(intArray: [8, 8, 2, 0, 10, 10, 9]), [0, 2, 8, 8, 9, 10, 10])
        XCTAssertEqual(Sorter.mergeSort(intArray: [9, 71, -20, 60, -70, 66, 59, -75]), [-75, -70, -20, 9, 59, 60, 66, 71])
        XCTAssertEqual(Sorter.mergeSort(intArray: [-46, -26, 62, 40, 70]), [-46, -26, 40, 62, 70])
        
    }
    
    func testMergeSortErroneous(){
        
    }
    
    func testMergeSortBoundary(){
        
        XCTAssertEqual(Sorter.mergeSort(intArray: [0]), [0])
        XCTAssertEqual(Sorter.mergeSort(intArray: [0,0,0,0,0,0]), [0,0,0,0,0,0])
        XCTAssertEqual(Sorter.mergeSort(intArray: [1000,-1000,2000000000]), [-1000,1000,2000000000])
        
    }
    
    func testBubbleSortValid(){
        
        
        
    }
    
    func testInsertionSortValid(){
        
    }
    
    func testQuickSortValid(){
        
    }

}
