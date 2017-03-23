//
//  ViewController.swift
//  todolist
//
//  Created by Jamie Chae on 2017. 3. 6..
//  Copyright © 2017년 jt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        NSLog("button click")
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            NSLog("The save button was not pressed, cancelling")
            return
        }
        
//        let name = nameTextField.text ?? ""
//        let photo = photoImageView.image
//        let rating = ratingControl.rating
//        
//        // Set the meal to be passed to MealTableViewController after the unwind segue.
//        meal = Meal(name: name, photo: photo, rating: rating)
        
        let todo = TodoListViewController.init() as! Todo
        self.navigationController?.pushViewController(todo, animated: true)
        self.storyboard
    }

}

