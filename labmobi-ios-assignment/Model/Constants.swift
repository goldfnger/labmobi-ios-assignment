//
//  Constants.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 16.02.2022.
//

import UIKit

struct Constants {
  
  struct Design {
    struct Colors {
      static let white = UIColor.white
      static let labelColor = UIColor.label
      static let systemBackground = UIColor.systemBackground
      static let black = UIColor.black.cgColor
      static let systemGrayCG = UIColor.systemGray.cgColor
    }
    
    struct Font {
      static let labelTitleFont = UIFont.boldSystemFont(ofSize: 16)
      static let labelDescriptionFont = UIFont.systemFont(ofSize: 13)
    }
    
    struct Image {
      static let plusIcon = UIImage(systemName: "plus")
    }
  }
  
  struct Content {
    static let appName = "mobilab test assignment"
    static let createItem =  "Create Item"
    static let enterItemName = "Please enter Item name"
    static let enterItemDescription = "Please enter Item description"
  }
  
  struct CellIdentifiers {
    static let itemsTableViewCell = "ItemsTableViewCell"
  }
  
  struct Firestore {
    static let itemId = "itemId"
    static let itemName = "itemName"
    static let itemDescription = "itemDescription"
    static let isSelected = "isSelected"
  }
  
  struct Errors {
    static let emptyFields = "Please complete both fields"
  }
}
