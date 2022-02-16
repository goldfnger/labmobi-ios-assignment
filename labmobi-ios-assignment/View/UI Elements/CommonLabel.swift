//
//  CommonLabel.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 16.02.2022.
//

import UIKit

class CommonLabel: UILabel {
  init(title: String = "",
       textAlignment: NSTextAlignment = .natural,
       font: UIFont = Constants.Design.Font.labelTitleFont,
       textColor: UIColor = Constants.Design.Colors.labelColor) {
    
    super.init(frame: .zero)
    
    numberOfLines = 0
    lineBreakMode = .byTruncatingTail
    
    self.textAlignment = textAlignment
    self.font = font
    text = title
    self.textColor = textColor
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
