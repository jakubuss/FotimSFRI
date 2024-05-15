//
//  RegisterVIew.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import SwiftUI

struct RegisterView: View { // meno(dlhe tak prezyvka) - mail - heslo - accept
    @StateObject var registerViewViewModel = RegisterViewViewModel()
    
    
    var body: some View {
        VStack{
            HlavickaView(nadpis: "Registrácia",
                         podNadpis: "Fotím s FRI",
                         podfarbeniePozadia: Color.yellow,
                         podfarbenieTextu: Color.blue)
            //.padding(.bottom, 20)
            Spacer()
            
        }
        Form{
            TextField("Zadaj Prezývku", text: $registerViewViewModel.prezyvka)
                .textFieldStyle(DefaultTextFieldStyle())
            TextField("Zadaj Email", text: $registerViewViewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
            SecureField("Zadaj Heslo", text: $registerViewViewModel.heslo)
                .textFieldStyle(DefaultTextFieldStyle())
            
            //button
            LogRegButton(nadpis: "Registruj",
                         farba: .blue){
                
            }
            
        } .offset(y: -20)
        
        /*VStack{ //nahradene tlacidlom BACK v lavo hore
            Text("Máš už účet?")
            //Button("Vytvor účet") { //prechod do registracie
            NavigationLink("Vráť ma späť!", destination: LoginView())
            //self.presentationMode.wrappedValue.dismiss()
                .bold()
                
            
        } */
        .padding(.bottom, 50)
        //Guest prihlasenie (eh asi nie, skor prihlasit a base prava) / registracia
        Spacer()
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
