//
//  PolozkyItemView.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//
// trieda konkretnej polozky ktora sa zobrazuje v
// hlavnom menu obsahujuca horizontalny stack, nazov podnazov a ikonky zobrazenia
import SwiftUI

struct PolozkyItemView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
//len struct na zobrazenie preview
struct PolozkyItemView_Previews: PreviewProvider {
    static var previews: some View {
        PolozkyItemView(item: .init(id: "123", title: "456789", link: "lincik na onedrive", createdDate: Date().timeIntervalSince1970, isFB: false, isLD: false, isIG: false, pocetFotiek: "549"))
    }
}
