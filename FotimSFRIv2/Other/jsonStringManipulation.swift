//
//  jsonStringManipulation.swift
//  FotimSFRIv2
//
//  Created by Jakub on 14/05/2024.
//

import Foundation

extension Encodable {
    //vypomoc z ChatGPT
    //zmena reprezentacie dat
    //performing operations that require dictionary access rather than JSON string manipulation
    func asDictonary() -> [String: Any] {
        
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
