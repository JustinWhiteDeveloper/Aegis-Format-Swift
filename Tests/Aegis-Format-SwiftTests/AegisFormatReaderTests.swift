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
        let subtitles = reader.readSubtitles()
        
        //then
        XCTAssertEqual(subtitles.count, 0)
    }
}
