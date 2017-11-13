//
//  ViewController.swift
//  Checklist
//
//  Created by Angela Yu on 13/11/2017.
//  Copyright © 2017 Angela Yu. All rights reserved.
//

import UIKit

//2
class ChecklistViewController: UITableViewController {
    
//    let todoListItems = ["Find Mike", "Buy eggos", "Destory demogorgon", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j","k", "l", "m", "n", "o"]
    
    var todoListItems = [ChecklistItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = ChecklistItem()
        item1.title = "Find Mike"
        todoListItems.append(item1)
        
        let item2 = ChecklistItem()
        item2.title = "Buy eggos"
        todoListItems.append(item2)
        
        let item3 = ChecklistItem()
        item3.title = "Destory demogorgon"
        todoListItems.append(item3)
        
       
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
        todoListItems.append(item3)
    }
    
    //MARK - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChecklistItem",
                for: indexPath)
        
            cell.textLabel?.text = todoListItems[indexPath.row].title
    
//        if todoListItems[indexPath.row].checked {
//            cell.accessoryType = .checkmark
//
//        } else {
//            cell.accessoryType = .none
//        }
        toggleCheckmark(cell: cell, indexPath: indexPath)
        
            return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        
        //print(tableView.cellForRow(at: indexPath))
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        

       //v2
//        if let cell = tableView.cellForRow(at: indexPath) {
//
//            if !todoListItems[indexPath.row].checked {
//                cell.accessoryType = .checkmark
//                todoListItems[indexPath.row].checked = true
//            } else {
//                cell.accessoryType = .none
//                todoListItems[indexPath.row].checked = false
//            }
//        }

        let item = todoListItems[indexPath.row]
        
//        if item.checked == true {
//            item.checked = false
//        } else {
//            item.checked = true
//        }
        item.checked = !item.checked
        
        if let cell = tableView.cellForRow(at: indexPath) {
        
        toggleCheckmark(cell: cell, indexPath: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    private func toggleCheckmark(cell: UITableViewCell, indexPath: IndexPath) {
        
        let item = todoListItems[indexPath.row]
        
        if item.checked == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = (item.checked == true) ? .checkmark : .none
        
    }
    
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Item", message: "This is Alert Message", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
           // print(textField.text!)
            let newItem = ChecklistItem()
            newItem.title = textField.text!
            self.todoListItems.append(newItem)
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a task"
        }
        self.present(alert, animated: true, completion: nil)
    }
    

}

