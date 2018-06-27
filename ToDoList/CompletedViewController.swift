//
//  CompletedViewController.swift
//  ToDoList
//
//  Created by Pedro Alonso on 6/27/18.
//  Copyright © 2018 Pedro Alonso. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController {

    var toDo: ToDoCD? = nil
    @IBOutlet weak var lbNameToDo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.lbNameToDo.text = toDo?.name
    
        if let theTodo = toDo {
            if theTodo.important {
                self.lbNameToDo.text! += "‼️"
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func completedTapped(_ sender: UIButton) {
     
        // Delete todo and pop back
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        if let todo = toDo {
                context.delete(todo)
        }
//        context.delete(toDo)
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        //
        self.navigationController?.popViewController(animated: true)
    }
    

}
