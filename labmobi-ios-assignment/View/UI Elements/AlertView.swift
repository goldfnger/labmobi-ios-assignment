//
//  AlertView.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 17.02.2022.
//

import UIKit

class AlertView {
  class func show(title: String, message: String, dismissAfter: Double, controller: UIViewController) {
    DispatchQueue.main.async {
      let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
      
      controller.present(alertVC, animated: true, completion: nil)
      
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dismissAfter) {
        alertVC.dismiss(animated: true, completion: nil)
      }
    }
  }
}
