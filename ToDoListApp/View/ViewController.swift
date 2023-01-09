//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Sena Kurtak on 9.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    let vm = TodoViewModel.sharedInstance
    
    var data : [Task] = [
        Task(name: "Task 1", time: Date()),
        Task(name: "Task 2", time: Date())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.data.removeAll()
        vm.loadTasks {
            tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = vm.tasks[indexPath.row]
        cell.textLabel?.text = data.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US")
        let timeString = dateFormatter.string(from: data.time)
        cell.detailTextLabel?.text = timeString
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController
        vc.task = vm.tasks[indexPath.row]
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}

