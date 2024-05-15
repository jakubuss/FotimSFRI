//
//  FotimSFRIv2App.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//
import FirebaseCore
import SwiftUI
import FirebaseFirestore

@main
struct FotimSFRIv2App: App {
    init(){
        FirebaseApp.configure() // ak tu pada appka tak je chyba s GoogleService txt
        Firestore.firestore().clearPersistence()

    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
