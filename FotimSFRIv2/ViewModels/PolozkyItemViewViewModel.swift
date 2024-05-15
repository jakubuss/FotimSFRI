//
//  PolozkyItemViewViewModel.swift
//  FotimSFRIv2
//
//  Created by Jakub on 10/05/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class PolozkyItemViewViewModel : ObservableObject {
    
    init() {}
    
    func toogleIsDone(item: Polozka, lokacia: String) {
        var itemCopy = item
        if (lokacia == "FB"){
            itemCopy.setDoneFB(!item.isFB)
        }
//        if (lokacia == "LD"){
//            itemCopy.setDoneLD(!item.isLD)
//        }
//        if (lokacia == "IG"){
//            itemCopy.setDoneIG(!item.isIG)
//        }
        
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }  //musim dokoncit lebo mi ju pri zmene DB zahodi a neoouziva
        let db = Firestore.firestore()
        db.collection("pouzivatelia")
            .document(uid)
            .collection("fotenia")
            .document(itemCopy.id)
            .setData(itemCopy.asDictonary())
    }
}
