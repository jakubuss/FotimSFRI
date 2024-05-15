//
//  MainViewViewModel.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
// pod view modelom je business logika a data background

import Foundation
import FirebaseAuth
import FirebaseFirestore

class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""


    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {

        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.currentUserId = user?.uid ?? ""
        }
    }
    
    public var isSigned: Bool {
        return Auth.auth().currentUser != nil
    }
}
