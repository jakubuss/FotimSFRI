//
//  ContentView.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import SwiftUI
//hlavne zobrazenie
struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View { //kontrola ci je prihlaseny pouzivatel
        if viewModel.isSigned, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        
        TabView {
            PolozkaView(userId: viewModel.currentUserId)
                .tabItem { //"home" button
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem { //polozka prehladu accountu
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
