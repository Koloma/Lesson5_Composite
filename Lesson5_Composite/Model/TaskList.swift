//
//  ListTask.swift
//  Lesson5_Composite
//
//  Created by Alexander Kolomenskiy on 28.05.2021.
//

import Foundation

class TaskList: Task{
    
    var name: String
    var list: [Task]
    var taskCount: Int{
        return list.count
    }
    
    init(name: String, listTask: [Task]) {
        self.name = name
        self.list = listTask
    }
    
    convenience init(){
        self.init(name: "New task list", listTask: [ConcreteTask()])
    }
    
    func doTask() {
        print("DO list of Task:")
        self.list.forEach { $0.doTask() }
    }
}
