//
//  TodoListTableCell.swift
//  todolist
//
//  Created by Jamie Chae on 2017. 3. 6..
//  Copyright © 2017년 jt. All rights reserved.
//

import UIKit

class TodoListTableCell: UITableViewCell {
    @IBOutlet var todoText: UILabel!
    @IBOutlet var todoDueTo: UILabel!
    var todoChecked:Bool = false
}
