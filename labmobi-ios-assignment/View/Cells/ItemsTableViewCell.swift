//
//  ItemsTableViewCell.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 16.02.2022.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
  //MARK: - Vars
  private var safeArea: UILayoutGuide!
  
  var itemName = CommonLabel()
  var itemDescription = CommonLabel(font: Constants.Design.Font.labelDescriptionFont)
  
  //MARK: - ViewCell
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureCell()
  }
  
  func cellSetup(_ item: Item) {
    itemName.text = item.name
    itemDescription.text = item.description
    if item.isSelected {
      accessoryType = .checkmark
    } else {
      accessoryType = .none
    }
  }
  
  //MARK: - Cell configuration
  private func configureCell() {
    backgroundColor = Constants.Design.Colors.systemBackground
    
    contentView.addSubview(itemName)
    contentView.addSubview(itemDescription)
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    safeArea = contentView.layoutMarginsGuide

    itemName.anchor(top: safeArea.topAnchor,
                    bottom: nil,
                    leading: safeArea.leadingAnchor,
                    trailing: safeArea.trailingAnchor
    )
    
    itemDescription.anchor(top: itemName.bottomAnchor,
                           bottom: safeArea.bottomAnchor ,
                           leading: safeArea.leadingAnchor,
                           trailing: safeArea.trailingAnchor,
                           padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    )
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
