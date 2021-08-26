//
//  AegisFormatReader.swift
//
//
//  Created by Justin White on 26/08/21.
//

import Foundation

public protocol AegisFormatReader {
    func getSubtitles(file: String, encoding: String.Encoding) -> [String]
}

public extension AegisFormatReader {
    func getSubtitles(file: String) -> [String] {
        return getSubtitles(file: file, encoding: .utf8)
    }
}

public class AegisFileFormatReader: AegisFormatReader {
    
    private enum Constants {
        static let dialoguePrefix: String = "Dialogue:"
        static let fieldSeperator: Character = ","
    }
    
    public func getSubtitles(file: String, encoding: String.Encoding) -> [String] {
        
        var result: [String] = []
        
        guard let fileData = FileManager.default.contents(atPath: file),
              let data = String(data: fileData, encoding: encoding) else {
            return result
        }
        
        let lines = data.components(separatedBy: .newlines)
        
        for line in lines where line.hasPrefix(Constants.dialoguePrefix) {
            
            let adjustedLine = line.split(separator: Constants.fieldSeperator).last
            
            if let adjustedLine = adjustedLine {
                result.append(String(adjustedLine))
            }
        }
        
        return result
    }
}
