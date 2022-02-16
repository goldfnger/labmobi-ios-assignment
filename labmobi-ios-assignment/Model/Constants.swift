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
    }
    
    struct Font {
      static let labelTitleFont = UIFont.systemFont(ofSize: 16)
      static let labelDescriptionFont = UIFont.systemFont(ofSize: 13)
    }
    
    struct Image {
      static let plusIcon = UIImage(systemName: "plus")
    }
  }
  
  struct Content {
    static let appName = "mobilab test assignment"
  }
  
  struct CellIdentifiers {
    static let itemsTableViewCell = "ItemsTableViewCell"
  }
}
