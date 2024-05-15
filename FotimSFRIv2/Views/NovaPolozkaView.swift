//
//  NovaPolozkaVIew.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import SwiftUI

struct NovaPolozkaView: View {
    
    @StateObject var viewModel = NovaPolozkaViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("Pridanie noveho fotenia")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
                .foregroundColor(Color.yellow)
            Form {
                // Title
                TextField("Názov udalosti", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Link na onedrive", text: $viewModel.link)
                    .textFieldStyle(DefaultTextFieldStyle())
                //bude automaticky brat udaje z oneDrive ale nemam k dispozicii este ulozisko pre buduce pouzitie
                
                TextField("Dátum fotenia", text: $viewModel.pocetFotiek)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .foregroundColor(Color.gray)
                
                // Button
                LogRegButton(nadpis: "Ulož", farba: .blue
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("chyba!"),
                      message: Text("Vyplňte všetky polia")
                )
            }
        }
    }
}

struct NovaPolozkaView_Previews: PreviewProvider {
    static var previews: some View {
        NovaPolozkaView(newItemPresented: Binding(get: {
            true
        }, set: { _ in
        }))
    }
}
