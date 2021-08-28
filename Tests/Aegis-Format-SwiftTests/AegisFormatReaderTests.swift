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
    
    func testAegisFormatReader_ReadExampleFile1() {
        //given
        let reader: AegisFormatReader = AegisFileFormatReader()
        
        //when
        let path = Bundle.module.path(forResource: "test_01", ofType: "ass")!
        let subtitles = reader.getSubtitles(file: path)
        
        //then
        XCTAssertNotNil(path)
        XCTAssertEqual(subtitles.count, 4)
    }
    
    func testAegisFormatReader_ReadExampleFile2() {
        //given
        let reader: AegisFormatReader = AegisFileFormatReader()
        
        //when
        let path = Bundle.module.path(forResource: "test_02", ofType: "ass")!
        let subtitles = reader.getSubtitles(file: path)
        
        //then
        XCTAssertNotNil(path)
        XCTAssertEqual(subtitles.count, 2)
    }
}
