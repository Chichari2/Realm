//
//  ToDoCoreDataTableViewController.swift
//  Weather
//
//  Created by Артем Вологдин on 05.03.22.
//

import UIKit
import CoreData

class ToDoCoreDataTableViewController: UITableViewController {

    
    var items = [Items]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.accessoryType = item.completed ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        items[indexPath.row].completed = !items[indexPath.row].completed
        
        saveItems()
    }
     
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete){
            let item = items[indexPath.row]
            items.remove(at: indexPath.row)
            context.delete(item)
            
            do{
                try context.save()
            }catch{
                print("Error deleting item with \(error)")
            }
            tableView.deleteRows(at: [indexPath],with: .automatic)
        }
    }
    
    
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Save", style: .default) { (action) in
            let newItem = Items(context: self.context)
            newItem.name = textField.text!
            self.items.append(newItem)
            self.saveItems()
            
        }
        
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new ToDo Item"
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems(){
        do{
            try context.save()
        }catch{
            print("Error saving item with \(error)")
        }
        
        tableView.reloadData()
    }
    
    
    func loadItems(){
        let request: NSFetchRequest<Items> = Items.fetchRequest()
        
        do{
        items = try context.fetch(request)
        }catch{
            print("Error fetching data from context \(error)")
        }
        
        
        tableView.reloadData()
    }
    
    
    
    
}
