//
//  Task.swift
//  Lesson5_Composite
//
//  Created by Alexander Kolomenskiy on 28.05.2021.
//

import Foundation

protocol Task{
    var name: String { get }
    
    var taskCount: Int { get }
    
    func doTask()
}
