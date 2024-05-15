//
//  NovaPolozkaViewViewModel.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NovaPolozkaViewViewModel : ObservableObject {
    @Published var title = ""
    @Published var link = ""
    @Published var showAlert = false
    @Published var pocetFotiek = "" //bude brat z disku ak bude
    
    init() { }
    
    func save() {
        
        guard canSave else {
            return
        }
 
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString //zabezpecenie unikatnosti (zdroj ChatGPT)
        let novaPolozka = Polozka(id: newId,
                                   title: title,
                                   link: link,
                                   createdDate: Date().timeIntervalSince1970,
                                  isFB: false, isLD: false, isIG: false, pocetFotiek: pocetFotiek)
        
        let db = Firestore.firestore() // DTbaza
        db.collection("pouzivatelia") // pouzivatel/uid/polozka/IDpolozky/prehodenie do Encodable
            .document(uId)
            .collection("fotenia")
            .document(newId)
            .setData(novaPolozka.asDictonary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        
        return true
    }
}


