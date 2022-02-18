//
//  FirebaseCollectionReference.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 17.02.2022.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
  case Items
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
  return Firestore.firestore().collection(collectionReference.rawValue)
}
