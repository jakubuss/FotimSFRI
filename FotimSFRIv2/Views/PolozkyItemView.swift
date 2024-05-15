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
    
    @StateObject var viewModel = PolozkyItemViewViewModel()
    
    let item: Polozka
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                    .bold()
                Text(item.link)
                    .font(.title2)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toogleIsDone(item: item, lokacia: "FB")
            } label: {
                Image(systemName: item.isFB ? "trash.fill" : "trash") //ikonka trash miesto FB koli autorskym pravam
                    .foregroundColor(Color.blue)
            }
//            Button {
//                viewModel.toogleIsDone(item: item, lokacia: "LD")
//            } label: {
//                Image(systemName: item.isLD ? "paperplane.circle.fill" : "paperplane.circle")
//                //ikonka trash miesto LD koli autorskym pravam
//                    .foregroundColor(Color.blue)
//            }
//            Button {
//                viewModel.toogleIsDone(item: item, lokacia: "IG")
//            } label: {
//                Image(systemName: item.isIG ? "list.clipboard.fill" : "list.clipboard")
//                //ikonka trash miesto IG koli autorskym pravam
//                    .foregroundColor(Color.blue)
//            }
        }
    }
}
//len struct na zobrazenie preview
struct PolozkyItemView_Previews: PreviewProvider {
    static var previews: some View {
        PolozkyItemView(item: .init(id: "123", title: "456789", link: "lincik na onedrive", createdDate: Date().timeIntervalSince1970, isFB: false, /*isLD: false, isIG: false,*/ pocetFotiek: "549"))
    }
}
