//
//  ToDo.swift
//  ToDoList
//
//  Created by Pedro Alonso on 6/26/18.
//  Copyright © 2018 Pedro Alonso. All rights reserved.
//

import Foundation

class ToDo {
    var name = ""
    var important = false
    
    init(name: String, important: Bool) {
        self.name = name
        self.important = important
    }
    
}
