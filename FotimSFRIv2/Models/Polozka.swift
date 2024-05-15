//
//  Polozka.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import Foundation
 
struct Polozka: Codable,Identifiable {
    
    let id: String
    let title: String
    let link: String
    let createdDate: TimeInterval
    //let datum: Date
    var isFB: Bool
//    var isLD: Bool
//    var isIG: Bool
    var pocetFotiek: String //bude sa pretypovavat na int casom 
    
    mutating func setDoneFB(_ state: Bool) {
        isFB = state
    }
//    mutating func setDoneLD(_ state: Bool) {
//        isLD = state
//    }
//    mutating func setDoneIG(_ state: Bool) {
//        isIG = state
//    }
}
