//
//  RegisterViewViewModel.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//
//register
import Foundation

class RegisterViewViewModel : ObservableObject {
    
    @Published var prezyvka = ""
    @Published var email = ""
    @Published var heslo = ""
    init() { }
}
