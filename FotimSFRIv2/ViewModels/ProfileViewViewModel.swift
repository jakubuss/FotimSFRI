//
//  ProfileViewViewModel.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel : ObservableObject {
    
    init () {
        self.pouzivatel = PouzivatelManazer.shared.pouzivatel
        
    }
    
    @Published var pouzivatel: Pouzivatel? = nil
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    
}
