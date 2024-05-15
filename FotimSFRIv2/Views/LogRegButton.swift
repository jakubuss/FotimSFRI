//
//  LogRegButton.swift
//  FotimSFRIv2
//
//  Created by Jakub on 13/05/2024.
//
// Tlacidlo vseobecne
import SwiftUI

struct LogRegButton: View {
    let nadpis: String
    let farba: Color
    let funkcionalita : () -> Void
    
    var body: some View {
        
        Button{
            funkcionalita()
        } label:{
            ZStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(farba)
                Text(nadpis)
                    .foregroundColor(Color.white)
                    .bold()
                    
            }
            .padding()
                
        }
    }
}
struct LogRegButton_Previews: PreviewProvider {
    static var previews: some View {
        LogRegButton(nadpis: "Nadpis", farba: .yellow) { }
    }
}
