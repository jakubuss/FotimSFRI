//
//  PolozkaViewViewModel.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import Foundation
import FirebaseFirestore

class PolozkaViewViewModel : ObservableObject {
    
    @Published var showingNovaPolozkaView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("pouzivatelia")
            .document(userId)
            .collection("fotenia")
            .document(id)
            .delete()
    }
}
 
