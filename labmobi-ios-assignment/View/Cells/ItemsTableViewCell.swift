//
//  ItemsTableViewCell.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 16.02.2022.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
  //MARK: - Vars
  var itemName = CommonLabel(title: "itemName")
  var itemDescription = CommonLabel(title: "itemDescription", font: Constants.Design.Font.labelDescriptionFont)
  
  //MARK: - ViewCell
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureCell()
  }
  
  //MARK: - Cell configuration
  private func configureCell() {
    backgroundColor = Constants.Design.Colors.systemBackground
    
    contentView.addSubview(itemName)
    contentView.addSubview(itemDescription)
    
    itemName.anchor(top: contentView.topAnchor,
                    bottom: nil,
                    leading: contentView.leadingAnchor,
                    trailing: contentView.trailingAnchor,
                    padding: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16)
    )
    itemDescription.anchor(top: itemName.bottomAnchor,
                           bottom: contentView.bottomAnchor ,
                           leading: itemName.leadingAnchor,
                           trailing: itemName.trailingAnchor,
                           padding: UIEdgeInsets(top: 5, left: 0, bottom: 8, right: 16)
    )
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
