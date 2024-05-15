//
//  PolozkaView.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import SwiftUI

//zobrazenie polozky
struct PolozkaView: View {
    @StateObject var viewModel : PolozkaViewViewModel
    @FirestoreQuery var items: [Polozka]
    
    init(userId: String) { //oficialne prihlasovanie na firestorm z firestormu
        self._items = FirestoreQuery(
            collectionPath: "pouzivatelia/\(userId)/fotenia"
        )
        
        self._viewModel = StateObject(wrappedValue: PolozkaViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack { //vertikalny stack
                 List(items) { item in
                    PolozkyItemView(item: item)
                         .swipeActions {
                             Button { //tlacidlo na mazanie poloziek podla ID
                                 viewModel.delete(id: item.id)
                             } label: {
                                 Text("Zmaz")  
                                     .foregroundColor(Color.red)
                             } 
                         }
                 }
                 .listStyle(PlainListStyle())
            }
            .navigationTitle("Fotim s FRI") //nadpis
            .toolbar {
                Button { //tlacidlo na zobrazenie novej polozky
                    viewModel.showingNovaPolozkaView = true
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
            .sheet(isPresented: $viewModel.showingNovaPolozkaView) {
                NovaPolozkaView(newItemPresented: $viewModel.showingNovaPolozkaView)
            }
        }
    }
}

struct PolozkaView_Previews: PreviewProvider {
    static var previews: some View {
        PolozkaView(userId: "dsdadwadsskuska")
    }
}
