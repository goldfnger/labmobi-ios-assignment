//
//  CommonTextField.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 17.02.2022.
//

import UIKit

class CommonTextField: UITextField {
  
  init(title: String = "") {
    super.init(frame: .zero)
    
    placeholder = title
    layer.cornerRadius = 5
    layer.borderWidth = 1
    layer.borderColor = Constants.Design.Colors.systemGrayCG
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
