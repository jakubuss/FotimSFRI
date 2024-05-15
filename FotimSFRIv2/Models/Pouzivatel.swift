//
//  Pouzivatel.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import Foundation

struct Pouzivatel: Codable, Equatable {
     
    let id: String
    let prezyvka: String
    let email: String
    let jeAdmin: Bool
    let joined: TimeInterval
}
