//
//  LogRegButton.swift
//  FotimSFRIv2
//
//  Created by Jakub on 13/05/2024.
//

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

#Preview {
    LogRegButton(nadpis: "Nadpis",
                 farba: .yellow) {
        //funkcionalita
    }
}
