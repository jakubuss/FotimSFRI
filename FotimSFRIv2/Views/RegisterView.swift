//
//  RegisterVIew.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import SwiftUI

struct RegisterView: View { // meno(dlhe tak prezyvka) - mail - heslo - accept
    @State var prezyvka = ""
    @State var email = ""
    @State var heslo = ""
    
    
    var body: some View {
        VStack{
            HlavickaView(nadpis: "Registrácia",
                         podNadpis: "Fotím s FRI",
                         podfarbeniePozadia: Color.yellow,
                         podfarbenieTextu: Color.blue)
            .padding(.bottom, 20)
            Spacer()
            
        }
        Form{
            TextField("Zadaj Prezývku", text: $prezyvka)
                .textFieldStyle(DefaultTextFieldStyle())
            TextField("Zadaj Email", text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
            SecureField("Zadaj Heslo", text: $heslo)
                .textFieldStyle(DefaultTextFieldStyle())
            
            Button{
                
            } label:{
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(Color.yellow)
                    Text("Registruj")
                        .foregroundColor(Color.blue)
                        .bold()
                }
            }
        }
        VStack{
            Text("Máš už účet?")
            //Button("Vytvor účet") { //prechod do registracie
            NavigationLink("Vráť ma späť!", destination: LoginView())
            //self.presentationMode.wrappedValue.dismiss()
                .bold()
                
            
        }
        .padding(.bottom, 20)
        //Guest prihlasenie (eh asi nie, skor prihlasit a base prava) / registracia
        Spacer()
        
    }
}

#Preview {
    RegisterView()
}
