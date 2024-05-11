//
//  RegisterVIew.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack{
            HlavickaView(nadpis: "Registrácia",
                         podNadpis: "Fotím s FRI",
                         podfarbeniePozadia: Color.yellow,
                         podfarbenieTextu: Color.blue)
            .padding(.bottom, 20)
            Spacer()
            
        }
        
    }
}

#Preview {
    RegisterView()
}
