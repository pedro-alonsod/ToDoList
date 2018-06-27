//
//  NewItemViewController.swift
//  ToDoList
//
//  Created by Pedro Alonso on 6/26/18.
//  Copyright © 2018 Pedro Alonso. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var swcImportant: UISwitch!
    
    var toDoTableVC: ItemsTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addTapped(_ sender: UIButton) {
        
        // Only need this to save to CD video 47 - 10 days
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        
        if let name = txtName.text {
//            let newToDo = ToDo(name: name, important: self.swcImportant.isOn)
            let newToDo = ToDoCD(context: context)

            newToDo.important = self.swcImportant.isOn
            newToDo.name = name
//            toDoTableVC?.toDos.append(newToDo)
//            toDoTableVC?.tableView.reloadData()
            
            // MARK: Save data into CD
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            self.navigationController?.popViewController(animated: true) // with a NavigatinController
        }
        
    }
    
}
