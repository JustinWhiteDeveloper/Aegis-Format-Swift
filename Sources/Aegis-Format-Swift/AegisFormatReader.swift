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
        static let bracketSeperator: Character = "}"
        
        //note to self, should refactor to 'isGarbageMethod'
        static let garbageString: String = "\\N"
    }
    
    public init() {
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
                        
            guard let adjustedLine = adjustedLine else {
                continue
            }
                
            let adjustedLine2 = adjustedLine.split(separator: Constants.bracketSeperator).last
            
            guard let adjustedLine2 = adjustedLine2 else {
                continue
            }
                        
            let item = String(adjustedLine2)

            if !item.contains(Constants.garbageString) {
                result.append(item)
            }
        }
        
        return result
    }
}
