//
//  PouzivatelManazer.swift
//  FotimSFRIv2
//
//  Created by Jakub on 27/05/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class PouzivatelManazer: ObservableObject, Equatable {
    
    static func == (lhs: PouzivatelManazer, rhs: PouzivatelManazer) -> Bool {
        lhs.pouzivatel == rhs.pouzivatel
    }
    
    static let shared: PouzivatelManazer = PouzivatelManazer()
    @Published var pouzivatel: Pouzivatel?
    
    func fetchUser() {
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("pouzivatelia").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.pouzivatel = Pouzivatel(id: data["id"] as? String ?? "",
                                  prezyvka: data["prezyvka"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  jeAdmin: data["jeAdmin"] as? Bool ?? false,
                                  joined: data["joined"] as? TimeInterval ?? 0
                )
                
                PouzivatelManazer.shared.pouzivatel = self?.pouzivatel
            }
        }
    }
}
