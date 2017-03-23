//
//  TodoListViewController.swift
//  todolist
//
//  Created by Jamie Chae on 2017. 3. 6..
//  Copyright © 2017년 jt. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var todoList = NSMutableArray.init(array: [
        todoObject.init(text: "todo 1", dueTo: NSDate.init(), checked: false),
        todoObject.init(text: "todo 2", dueTo: NSDate.init(), checked: false),
        todoObject.init(text: "todo 3", dueTo: NSDate.init(), checked: false),
        ])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    @IBAction func editButtonClick(_ sender: Any) {
        self.tableView.setEditing(!self.tableView.isEditing, animated: true)
    }
    @IBAction func addButtonClick(_ sender: Any) {
        NSLog("insert click")
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.todoList.removeObject(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .left)
        }else if editingStyle == .insert {
            self.todoList.add(todoObject.init(text: "todo 3", dueTo: NSDate.init(), checked: false))
            
        }else if editingStyle == .none {
            
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = self.todoList.object(at: sourceIndexPath.row)
        self.todoList.removeObject(at: sourceIndexPath.row)
        self.todoList.insert(todo, at: destinationIndexPath.row)
    }
}

extension TodoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableCell", for: indexPath) as! TodoListTableCell
        let todo = self.todoList.object(at: indexPath.row) as! todoObject
        cell.todoText.text = todo.text
        cell.todoDueTo.text = todo.getDueTo()
        cell.todoChecked = todo.checked
        return cell
    }
}

struct todoObject {
    var text:String!
    var dueTo:NSDate!
    var checked:Bool!
    func getDueTo() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.string(from: self.dueTo as Date)
    }
}
