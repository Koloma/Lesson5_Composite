//
//  ConcreteTask.swift
//  Lesson5_Composite
//
//  Created by Alexander Kolomenskiy on 28.05.2021.
//

import Foundation

class ConcreteTask: Task{

    var name: String
    var taskCount: Int = 1
    
    convenience init (){
        self.init(name: "New Task")
    }
    
    init(name: String) {
        self.name = name
    }
    
    func doTask(){
        print("Do task: \(name)")
    }
    
}
