//
//  NovaPolozkaVIew.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import SwiftUI

struct NovaPolozkaView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NovaPolozkaView_Previews: PreviewProvider {
    static var previews: some View {
        NovaPolozkaView(newItemPresented: Binding(get: {
            true
        }, set: { _ in
        }))
    }
}
