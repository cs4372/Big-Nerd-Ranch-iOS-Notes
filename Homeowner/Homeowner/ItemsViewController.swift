//
//  ItemsViewController.swift
//  Homeowner
//
//  Created by Catherine Shing on 12/26/22.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("inside itemsviewcontroller")
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    @IBAction func addNewItem(_ sender: UIButton) {
        let newItem = itemStore.createItem()
         // Figure out where that item is in the array
        let idx = itemStore.allItems.firstIndex(of: newItem)
        print("idx", idx)
        if let index = itemStore.allItems.firstIndex(of: newItem) {
             let indexPath = IndexPath(row: index, section: 0)
            print("indexPath", indexPath)
             // Insert this new row into the table
             tableView.insertRows(at: [indexPath], with: .automatic)
         }
     }
        
        @IBAction func toggleEditingMode(_ sender: UIButton) {
            // If you are currently in editing mode...
               if isEditing {
                   // Change text of button to inform user of state
                   sender.setTitle("Edit", for: .normal)
                   // Turn off editing mode
                   setEditing(false, animated: true)
               } else {
                   // Change text of button to inform user of state
                   sender.setTitle("Done", for: .normal)
                   // Enter editing mode
                   setEditing(true, animated: true)
               }
            
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
              let title = "Delete \(item.name)?"
              let message = "Are you sure you want to delete this item?"
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: { (action) -> Void in
            // Remove the item from the store self.itemStore.removeItem(item)
                // Also remove that row from the table view with an animation
            self.itemStore.removeItem(item)
            self.tableView.deleteRows(at: [indexPath], with: .automatic) })
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView,
            numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
    // Update the model
    to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView,
            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         // Get a new or recycled cell
        var cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
           for: indexPath)        // Set the text on the cell with the description of the item
        cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        print(item)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
//        if indexPath[1] == itemStore.allItems.count-1 {
//            cell.textLabel?.text = "No more items!"
//            cell.detailTextLabel?.text = "$0"
//        }
        return cell
    }
    
}
