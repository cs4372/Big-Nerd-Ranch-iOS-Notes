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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        let newItem = itemStore.createItem()
         // Figure out where that item is in the array
        let idx = itemStore.allItems.firstIndex(of: newItem)

        if let index = itemStore.allItems.firstIndex(of: newItem) {
             let indexPath = IndexPath(row: index, section: 0)
             // Insert this new row into the table
             tableView.insertRows(at: [indexPath], with: .automatic)
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
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
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
        var cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",
            for: indexPath) as! ItemCell     // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        // Configure the cell with the Item
         cell.nameLabel.text = item.name
         cell.serialNumberLabel.text = item.serialNumber
         cell.valueLabel.text = "$\(item.valueInDollars)"
//        if indexPath[1] == itemStore.allItems.count-1 {
//            cell.textLabel?.text = "No more items!"
//            cell.detailTextLabel?.text = "$0"
//        }
        if item.valueInDollars >= 50 {
            cell.valueLabel.textColor = UIColor.red
        } else {
            cell.valueLabel.textColor = UIColor.green
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController
                        = segue.destination as! DetailViewController
                detailViewController.item = item
    } default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
}
