//
//  LoginViewModel.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//  

import Foundation
import FirebaseAuth 

class LoginViewModel : ObservableObject {
    @Published var email = ""
    @Published var heslo = ""
    @Published var errorMessage = ""
    init() {}
    
    func prihlas() {
        guard kontrolaUdajov() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: heslo)
        
    }
    
    func kontrolaUdajov() -> Bool {
        errorMessage = ""
        
        guard !email.isEmpty,
              !heslo.isEmpty else {
            errorMessage = "Policko nesmie ostat prazdne"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Nespravne zadany format emailu"
            return false
        }
        
        return true
    }
}
