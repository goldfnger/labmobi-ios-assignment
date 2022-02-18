//
//  RootNavigationController.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 16.02.2022.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      let mainVC = ItemsTableViewController()
      
      viewControllers = [mainVC]
    }
}
