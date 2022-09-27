//
//  SingKingTests.swift
//  SingKingTests
//
//  Created by RS on 27.09.22.
//

import XCTest

final class SingKingTests: XCTestCase {
    var sut: ViewModel!

    override func setUpWithError() throws {
        sut = ViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_VM() {
        let actual = sut.characters
        let expected: [Character] = []

        XCTAssertEqual(actual, expected)
    }
    
    func test_VM_Populated() {
        sut.getData()
        XCTAssertTrue(sut.characters.isEmpty)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: DispatchWorkItem(block: {
            XCTAssertFalse(self.sut.characters.isEmpty)
        }))
    }

}
