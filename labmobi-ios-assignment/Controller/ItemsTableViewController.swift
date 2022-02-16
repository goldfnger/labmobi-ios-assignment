//
//  ItemsTableViewController.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 16.02.2022.
//

import UIKit

class ItemsTableViewController: UITableViewController {
  //MARK: - Vars
  
  //MARK: - ViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  @objc private func addItem() {
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.itemsTableViewCell,
                                             for: indexPath) as! ItemsTableViewCell
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      if cell.accessoryType == .checkmark {
        cell.accessoryType = .none
      } else {
        cell.accessoryType = .checkmark
      }
    }
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {

      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
}

//MARK: - UI Configuration
extension ItemsTableViewController {
  private func setNavigationItem() {
    let addItemImage = Constants.Design.Image.plusIcon
    let addItemButton = UIBarButtonItem(image: addItemImage, style: .plain, target: self, action: #selector(addItem))
    self.navigationItem.rightBarButtonItem = addItemButton
  }
  
  private func configureUI() {
    setNavigationItem()
    title = Constants.Content.appName

    view.backgroundColor = Constants.Design.Colors.systemBackground
    
    tableView.register(ItemsTableViewCell.self,
                       forCellReuseIdentifier: Constants.CellIdentifiers.itemsTableViewCell)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
  }
}
