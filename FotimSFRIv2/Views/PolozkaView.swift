//
//  PolozkaView.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//
import FirebaseFirestoreSwift
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
                if viewModel.user?.jeAdmin ?? false {
                    
                    Menu {
                        Button { //tlacidlo na zobrazenie novej polozky
                            viewModel.showingNovaPolozkaView = true
                        } label: {
                            Text("Vytvor novu polozku!")
                        }
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                        
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingNovaPolozkaView) {
                NovaPolozkaView(newItemPresented: $viewModel.showingNovaPolozkaView)
            } .onAppear{
                PouzivatelManazer.shared.fetchUser()
            }}
    }
}

struct PolozkaView_Previews: PreviewProvider {
    static var previews: some View {
        PolozkaView(userId: "dsdadwadsskuska")
    }
}
