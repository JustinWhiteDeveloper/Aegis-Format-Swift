//
//  AegisFormatReaderTests.swift
//  
//
//  Created by Justin White on 26/08/21.
//

import Foundation
import XCTest
@testable import Aegis_Format_Swift

class AegisFormatReaderTests: XCTestCase {
    func testAegisFormatReader_EmptyReader() {
        //given
        let reader: AegisFormatReader = EmptyAegisFormatReader()
        
        //when
        let exampleUrl = Bundle.module.url(forResource: "test_01",
                                           withExtension: "ass")
        let subtitles = reader.readSubtitles()
        
        //then
        XCTAssertNotNil(exampleUrl)
        XCTAssertEqual(subtitles.count, 0)
    }
}
