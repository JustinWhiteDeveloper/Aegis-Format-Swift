//
//  AegisFormatReader.swift
//
//
//  Created by Justin White on 26/08/21.
//

protocol AegisFormatReader {
    func readSubtitles() -> [String]
}

class EmptyAegisFormatReader: AegisFormatReader {
    func readSubtitles() -> [String] {
        return []
    }
}
