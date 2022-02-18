//
//  AddItemViewController.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 17.02.2022.
//

import UIKit

class AddItemViewController: UIViewController {
  //MARK: - Vars
  private var safeArea: UILayoutGuide!
  
  private var nameTextField = CommonTextField(title: Constants.Content.enterItemName)
  private var descriptionTextField = CommonTextField(title: Constants.Content.enterItemDescription)
  
  //MARK: - ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
      configureUI()
    }
  
  @objc private func doneBarButtonItemPressed() {
    if fieldsAreCompleted() {
      saveToFirestore()
    } else {
      AlertView.show(title: "", message: Constants.Errors.emptyFields, dismissAfter: 1, controller: self)
    }
 }
  
  private func fieldsAreCompleted() -> Bool {
      return (nameTextField.text != "" && descriptionTextField.text != "")
  }
  
  private func saveToFirestore() {
    let item = Item()
    item.id = UUID().uuidString
    item.name = nameTextField.text!
    item.description = descriptionTextField.text!
    item.isSelected = false
    
    saveItemToFirestore(item)
    popTheView()
  }
}

//MARK: - UI Configuration
extension AddItemViewController {
  private func setNavigationItem() {
      let addItemButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done,
                                          target: self,
                                          action: #selector(doneBarButtonItemPressed))
      self.navigationItem.rightBarButtonItem = addItemButton
  }
  
  private func configureUI() {
    safeArea = view.layoutMarginsGuide
    
    setNavigationItem()
    
    title = Constants.Content.createItem
    view.backgroundColor = Constants.Design.Colors.systemBackground
    
    view.addSubview(nameTextField)
    view.addSubview(descriptionTextField)
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    nameTextField.anchor(top: safeArea.topAnchor,
                         bottom: nil,
                         leading: safeArea.leadingAnchor,
                         trailing: safeArea.trailingAnchor,
                         padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0),
                         height: 30
    )
    descriptionTextField.anchor(top: nameTextField.bottomAnchor,
                                bottom: nil ,
                                leading: safeArea.leadingAnchor,
                                trailing: safeArea.trailingAnchor,
                                padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0),
                                height: 30
    )
  }
}
