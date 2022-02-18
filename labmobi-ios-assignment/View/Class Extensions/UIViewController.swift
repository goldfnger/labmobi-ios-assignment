//
//  UIViewController.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 17.02.2022.
//

import Foundation
import UIKit

extension UIViewController {
  
  func popTheView() {
      self.navigationController?.popViewController(animated: true)
  }
  
  func pushViewController<T>(_ viewController: T) {
    let vc = viewController as! UIViewController
    navigationController?.pushViewController(vc, animated: true)
  }
}
