//
//  LoginView.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import SwiftUI

struct LoginView: View {
    //premenne mail a heslo
    @State var email = ""
    @State var heslo = ""
    
    var body: some View {
        NavigationView{
            VStack{
                //Hlavicka, farba FRI, logo, nazov?
                HlavickaView(nadpis: "FRIčka",
                             podNadpis: "Očami Žabku",
                             podfarbeniePozadia: Color.blue,
                             podfarbenieTextu: Color.yellow)
                .offset(y: 48)
                //Prihlasovacie udaje -> mail, heslo
                Form{
                    TextField("Zadaj Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Zadaj heslo", text: $heslo)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button{
                        
                    } label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundColor(Color.yellow)
                            Text("Prihlásenie")
                                .foregroundColor(Color.blue)
                                .bold()
                        }
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

#Preview {
    LoginView()
}
