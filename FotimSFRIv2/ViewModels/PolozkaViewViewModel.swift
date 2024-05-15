//
//  PolozkaViewViewModel.swift
//  FotimSFRIv2
//s
//  Created by Jakub on 10/05/2024.
//

import Foundation
import FirebaseFirestore
import Combine

class PolozkaViewViewModel : ObservableObject {
    
    @Published var showingNovaPolozkaView = false
    @Published var user: Pouzivatel?

    var cancellables = Set<AnyCancellable>()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        PouzivatelManazer.shared.$pouzivatel.sink { _ in
            //listener na zmenu pri asynchronnom programovani
        } receiveValue: { user in
            self.user = user
        }
        .store(in: &cancellables)
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
 
