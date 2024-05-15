//
//  LoginView.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import SwiftUI

struct LoginView: View {
    //premenne mail a heslo z instancie triedy
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Hlavicka, farba FRI, logo, nazov?
                HlavickaView(nadpis: "FRIčka",
                             podNadpis: "Očami Žabku",
                             podfarbeniePozadia: Color.blue,
                             podfarbenieTextu: Color.yellow)
                .offset(y: 45)
                //Prihlasovacie udaje -> mail, heslo
                Form {
                   /* if !loginViewModel.errorMessage.isEmpty {
                        Text(loginViewModel.errorMessage).foregroundColor(.red)
                    } */
                    TextField("Zadaj Email", text: $loginViewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Zadaj heslo", text: $loginViewModel.heslo)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
    
                    LogRegButton(nadpis: "Prihlásenie", farba: .yellow){
                        //pokus o prihlasenie
                        loginViewModel.prihlas()
                    }
                }
                
                VStack{
                    Text("Ešte nemáš účet?")
                    //Button("Vytvor účet") { //prechod do registracie
                    NavigationLink("Vytvor účet!", destination: RegisterView())
                        
                    
                    
                }
                .padding(.bottom, 20)
                //Guest prihlasenie (eh asi nie, skor prihlasit a base prava) / registracia
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
