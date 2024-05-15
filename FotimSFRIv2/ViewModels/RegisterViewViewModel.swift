//
//  RegisterViewViewModel.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//
//register
import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject {
    
    @Published var prezyvka = ""
    @Published var email = ""
    @Published var heslo = ""
    
    init() {  }
    
    func registruj() {
        
        guard kontrolaUdajov() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: heslo) {[weak self] vysledok, error in //weak self -> auto copilot oprava chyby na riadku 31 - podla webu ochrana proti mem leakom tiez
            
            guard let userId = vysledok?.user.uid else {
                return
            }
            self?.insertUserId(id: userId)
        }
    }
    
    private func insertUserId(id: String) {
        
        let newUser = Pouzivatel(id: id,
                           prezyvka: prezyvka,
                           email: email,
                           jeAdmin: false,
                           joined: Date().timeIntervalSince1970)
                           
        
        let db = Firestore.firestore()
        
        db.collection("pouzivatelia")
            .document(id)
            .setData(newUser.asDictonary())
    }
    
    func kontrolaUdajov() -> Bool {
        
        guard !prezyvka.isEmpty,
              !email.isEmpty,
              !heslo.isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard heslo.count >= 8 else {
            return false
        }
        
        return true
    }
}
