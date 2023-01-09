//
//  TodoViewModel.swift
//  ToDoListApp
//
//  Created by Sena Kurtak on 9.01.2023.
//

import Foundation
import RealmSwift

class TodoViewModel : NSObject {
    
    static var sharedInstance = TodoViewModel()
    
    var tasks = [Task]()
    
    typealias completionHandler = () -> Void

    let realm = try! Realm()

    func add(task: Task, completion: completionHandler){
        
        self.realm.beginWrite()
        
        self.realm.add(task)
        
        try? self.realm.commitWrite()
        print("task saved")
        
        completion()

    }
    
    func loadTasks(completion: completionHandler){
        self.realm.beginWrite()
        
        let savedTasks = self.realm.objects(Task.self)
        
        self.tasks.removeAll()
        self.tasks.append(contentsOf: savedTasks)
        
        try! self.realm.commitWrite()
        
        completion()

    }
    
    func editTask(task: Task, updatedTask: Task, completion: completionHandler) {
        
        self.realm.beginWrite()
        
        // Delete the old task
        self.realm.delete(task)
        
        // Add the updated task
        self.realm.add(updatedTask)
        
        try! self.realm.commitWrite()
        
        completion()
        
    }
    
    func deleteTask(task: Task, taskIndex: Int, completion: completionHandler) {
        
        self.realm.beginWrite()
        
        // Delete the old task
        self.realm.delete(task)
        
        try! self.realm.commitWrite()

        tasks.remove(at: taskIndex)

        completion()
    }
}
