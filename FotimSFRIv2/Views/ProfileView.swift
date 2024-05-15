//
//  ProfileView.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.pouzivatel {
                    profile(user: user)
                } else {
                    Text("Nacitavam profil..")
                }
            }
            .navigationTitle("Profile")
        }
       
    }
    
    @ViewBuilder
    func profile(user: Pouzivatel) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Meno: ")
                    .bold()
                Text(user.prezyvka)
            }
            
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            
            HStack {
                Text("Zaregistrovany: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            HStack {
                Text("Som admin: ")
                    .bold()
                Text(user.jeAdmin ? "ano" : "nie")
            }
            
        }
        .padding()
        
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
