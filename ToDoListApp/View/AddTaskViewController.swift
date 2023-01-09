//
//  AddTaskViewController.swift
//  ToDoListApp
//
//  Created by Sena Kurtak on 9.01.2023.
//

import UIKit

class AddTaskViewController: UIViewController {

    
    
    @IBOutlet weak var txttaskName: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        let task = Task(name: txttaskName.text ?? "", time: datePicker.date)
        let vm = TodoViewModel.sharedInstance
        vm.add(task: task, completion: {
            self.navigationController?.popViewController(animated: true)
        })
        print("Saving task")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.locale = Locale(identifier: "en_US")

    }
    


}
