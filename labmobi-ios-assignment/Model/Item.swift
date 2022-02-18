//
//  Items.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 17.02.2022.
//

import Foundation

final class Item {
  var id: String!
  var name: String!
  var description: String!
  var isSelected: Bool!
  
  init() {
  }
  
  // for downloading from Firestore and creating Item object
  init(dictionary: NSDictionary) {
    id = dictionary[Constants.Firestore.itemId] as? String
    name = dictionary[Constants.Firestore.itemName] as? String
    description = dictionary[Constants.Firestore.itemDescription] as? String
    isSelected = dictionary[Constants.Firestore.isSelected] as? Bool
  }
}

//MARK: - Download
func downloadItemsFromFirestore(completion: @escaping (_ itemArray: [Item]) -> Void) {
  var itemArray: [Item] = []
  
  FirebaseReference(.Items).getDocuments { (snapshot, error) in
    guard let snapshot = snapshot else {
      completion(itemArray)
      return
    }
    
    if !snapshot.isEmpty {
      for itemDictionary in snapshot.documents {
        itemArray.append(Item(dictionary: itemDictionary.data() as NSDictionary))
      }
    }
    completion(itemArray)
  }
}
  
//MARK: - Save
  func saveItemToFirestore(_ item: Item) {
    FirebaseReference(.Items).document(item.id).setData(itemDictionaryFrom(item) as! [String: Any])
  }

//MARK: - Update
func updateItemInFirestore(_ item: Item, withValues: [String: Any], completion: @escaping (_ error: Error?) -> Void) {
    FirebaseReference(.Items).document(item.id).updateData(withValues) { (error) in
        completion(error)
    }
}
  
//MARK: - Delete
  func deleteItemsInFirestore(_ item: Item, completion: @escaping (_ error: Error?) -> Void) {
      FirebaseReference(.Items).document(item.id).delete() { error in
          completion(error)
      }
  }

//MARK: - Helpers
// will create dictionary from Items. need for saving in Firestore
func itemDictionaryFrom(_ item: Item) -> NSDictionary {
  return NSDictionary(objects: [item.id,
                                item.name,
                                item.description,
                                item.isSelected],
                      forKeys: [Constants.Firestore.itemId as NSCopying,
                                Constants.Firestore.itemName as NSCopying,
                                Constants.Firestore.itemDescription as NSCopying,
                                Constants.Firestore.isSelected as NSCopying])
}
