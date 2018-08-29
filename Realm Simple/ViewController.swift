//
//  ViewController.swift
//  Realm Simple
//
//  Created by Evgeniy Ryshkov on 29.08.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var items: Results<Item> {
        return DBManager.sharedInstance.getDataFromDB()
    }
    
    var currentItem: Item?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        currentItem = nil
        performSegue(withIdentifier: "ToDetails", sender: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let unwSegue = segue.identifier, unwSegue == "ToDetails" {
            guard let dvc = segue.destination as? secondViewController else {
                return
            }
            
            dvc.currentItem = currentItem
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        let index = indexPath.row
        
        let item = items[index] as Item
        cell.textLabel?.text = item.textString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        currentItem = items[index] as Item
        performSegue(withIdentifier: "ToDetails", sender: nil)
    }
}
