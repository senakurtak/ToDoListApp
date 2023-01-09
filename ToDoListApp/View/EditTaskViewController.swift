//
//  EditTaskViewController.swift
//  ToDoListApp
//
//  Created by Sena Kurtak on 9.01.2023.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    
    var task : Task?
    
    let vm = TodoViewModel.sharedInstance
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var index : Int?
    
    @IBAction func save(_ sender: Any) {
        
        print("saving....")
        
        let newTask = Task(name: txtName.text ?? "", time: datePicker.date)
        
        vm.editTask(task: self.task!, updatedTask: newTask.self){
            
            print("Task Updated successfully")
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteTask(_ sender: Any) {
        print("deleting.....")
        vm.deleteTask(task: self.task!, taskIndex: self.index!) {
            print("Task deleted successfully")
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.locale = Locale(identifier: "en_US")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let myTask = self.task {
            
            name.text = myTask.name
            datePicker.date = myTask.time
        }
    }
    
}
