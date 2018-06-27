//
//  ItemsTableViewController.swift
//  ToDoList
//
//  Created by Pedro Alonso on 6/26/18.
//  Copyright © 2018 Pedro Alonso. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {

//    var toDos: [ToDo] = [ToDo(name: "Walk the dog", important: false), ToDo(name: "Buy Milk", important: true)]
    
    var toDosCD: [ToDoCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        getToDos()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getToDos()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDosCD.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//       let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let cell = UITableViewCell()
        
        let currentTodo = toDosCD[indexPath.row]
        
        if currentTodo.important {
            cell.textLabel?.text = "\(currentTodo.name ?? "Nil") ‼️"
        } else {
            cell.textLabel?.text = "\(currentTodo.name ?? "Nada")"
        }
        
        
        // Configure the cell...

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(toDosCD[indexPath.row])
        
        let selectedToDo = toDosCD[indexPath.row]
        
        self.performSegue(withIdentifier: "CompletedSegue", sender: selectedToDo)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let newItemsVC = segue.destination as? NewItemViewController {
            
            newItemsVC.toDoTableVC = self
        }
        
        if let completedVC = segue.destination as? CompletedViewController {
            if let passToDo = sender as? ToDoCD {
                completedVC.toDo = passToDo
            }
            
        }
        
    }
 
    // MARK: - CD get Entities
    func getToDos() {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        
        if let toDos = try? context.fetch(ToDoCD.fetchRequest()) {
            
            if let toDosReturned = toDos as? [ToDoCD] {
                print(toDosReturned)
                
                toDosCD = toDosReturned
                tableView.reloadData()
            }
        }
    }
}
