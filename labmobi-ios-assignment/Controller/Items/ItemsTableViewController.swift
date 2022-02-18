//
//  ItemsTableViewController.swift
//  labmobi-ios-assignment
//
//  Created by Aleksandr Kornjushko on 16.02.2022.
//

import UIKit

class ItemsTableViewController: UITableViewController {
  //MARK: - Vars
  private var itemArray: [Item] = []
  
  //MARK: - TableViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    loadItemsFromFirestore()
  }
  
  private func loadItemsFromFirestore() {
    itemArray.removeAll()
    
    downloadItemsFromFirestore { itemArray in
      self.itemArray = itemArray
      self.itemArray.sort { (item1, item2) -> Bool in
        return item1.name < item2.name
      }
      self.tableView.reloadData()
    }
  }
  
  @objc private func addItem() {
    pushViewController(AddItemViewController())
  }
}

//MARK: - TableViewController: TableViewDataSource
extension ItemsTableViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return itemArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.itemsTableViewCell,
                                             for: indexPath) as! ItemsTableViewCell
    
    cell.cellSetup(itemArray[indexPath.row])
    
    return cell
  }
}

//MARK: - TableViewController: TableViewDelegate
extension ItemsTableViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      if cell.accessoryType == .checkmark {
        cell.accessoryType = .none
        updateItemInFirestore(itemArray[indexPath.row], withValues: [Constants.Firestore.isSelected : false]) { _ in }
      } else {
        cell.accessoryType = .checkmark
        updateItemInFirestore(itemArray[indexPath.row], withValues: [Constants.Firestore.isSelected : true]) { _ in }
      }
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let itemToDelete = itemArray[indexPath.row]
      
      deleteItemsInFirestore(itemToDelete) { error in
        if error != nil {
          print("Error while deleting the Item", error!.localizedDescription)
        }
      }
      itemArray.remove(at: indexPath.row)
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
    
    tableView.register(ItemsTableViewCell.self,
                       forCellReuseIdentifier: Constants.CellIdentifiers.itemsTableViewCell)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
  }
}
