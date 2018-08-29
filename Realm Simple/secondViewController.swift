//
//  secondViewController.swift
//  Realm Simple
//
//  Created by Evgeniy Ryshkov on 29.08.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit
import RealmSwift

class secondViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    weak var currentItem: Item?
    weak var tableView: UITableView?
    
    var items: Results<Item> {
        return DBManager.sharedInstance.getDataFromDB()
    }
    
    var database: DBManager {
        return DBManager.sharedInstance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = currentItem {
            textField.text = item.textString
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let item = Item()
        if(currentItem == nil) {
            // if is a new Item then calculate a new ID, else use the current ID
            item.ID = items.count
        }
        item.textString = textField.text!
        database.addData(object: item)
        if let selectedIndexPath = tableView?.indexPathForSelectedRow {
            tableView?.reloadRows(at: [selectedIndexPath], with: .none)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        if let item = currentItem {
            database.deleteFromDb(object: item)
            if let selectedIndexPath = tableView?.indexPathForSelectedRow {
                tableView?.reloadRows(at: [selectedIndexPath], with: .none)
            }
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
