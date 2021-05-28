//
//  TaskTableViewCell.swift
//  Lesson5_Composite
//
//  Created by Alexander Kolomenskiy on 28.05.2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    static let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
    static let identifier = "TaskTableViewCell"
    

    @IBOutlet weak var taskNameLable: UILabel!
    @IBOutlet weak var countTaskLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(task:Task){
        taskNameLable.text = task.name
        countTaskLable.text = "\(task.taskCount)"
    }
    
}
