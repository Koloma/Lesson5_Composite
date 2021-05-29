//
//  ViewController.swift
//  Lesson5_Composite
//
//  Created by Alexander Kolomenskiy on 28.05.2021.
//

import UIKit

final class TaskViewController: UIViewController {

    private enum ImageSystemName: String{
        case plus = "plus.app"
    }
    
    private var tableView = UITableView()
    private var taskList: TaskList
    
    init(taskList: TaskList) {
        
        self.taskList = taskList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.taskList = TaskList()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigation()
        configTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func configTableView(){
        tableView = createTableView()
        self.view.addSubview(tableView)
    }
    
    private func configNavigation(){
        let button1 = UIBarButtonItem(image: UIImage(systemName: ImageSystemName.plus.rawValue),
                                      style: .plain,
                                      target: self,
                                      action: #selector(tapAddButton))
        self.navigationItem.rightBarButtonItem  = button1
        self.navigationItem.title = taskList.name
    }

    @objc func tapAddButton(_ sender: Any) {
        taskList.list.append(ConcreteTask(name: "New task \(taskList.list.count)"))
        tableView.reloadData()
    }
    
    private func createTableView() -> UITableView{
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        let _tableView = UITableView(frame: CGRect(x: .zero, y: .zero, width: displayWidth, height: displayHeight))
        _tableView.register(TaskTableViewCell.nib, forCellReuseIdentifier: TaskTableViewCell.identifier)
        
        _tableView.dataSource = self
        _tableView.delegate = self
        return _tableView
    }
    
}

extension TaskViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell
        else { return UITableViewCell() }
        cell.configureCell(task: taskList.list[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: TaskViewController
        if let list = taskList.list[indexPath.row] as? TaskList{
            vc = TaskViewController(taskList: list)
            vc.taskList = list
        }else{
            let newList = TaskList(name: "Task List \(taskList.list[indexPath.row].name)", listTask: [ConcreteTask()])
            taskList.list[indexPath.row] = newList
            vc = TaskViewController(taskList: newList)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

