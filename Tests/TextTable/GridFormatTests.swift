//
//  GridFormatTests.swift
//  TextTable
//
//  Created by Cristian Filipov on 8/13/16.
//
//

import XCTest
@testable import TextTable

private typealias TestFormat = Format.Grid

class GridFormatTests: XCTestCase {

    func testPerformanceExample() {
        self.measure {
            let _ = table.string(for: data, format: TestFormat())
        }
    }

    func testTable() {
        let expectedOutput = "" +
            "+-------+--------+----------+\n" +
            "| Name  |  Age   | Birthday |\n" +
            "+=======+========+==========+\n" +
            "| Alice |   42   |  8/13/16 |\n" +
            "+-------+--------+----------+\n" +
            "| Bob   |   22   |  8/13/16 |\n" +
            "+-------+--------+----------+\n" +
            "| Eve   |  142   |  8/13/16 |\n" +
            "+-------+--------+----------+\n" +
        ""
        let s = table.string(for: data, format: TestFormat())!
        XCTAssertEqual(s, expectedOutput)
    }
    
}
