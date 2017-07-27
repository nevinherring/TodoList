//
//  CompleteToDoViewController.swift
//  ToDo List
//
//  Created by Nevin Herring on 7/25/17.
//  Copyright © 2017 Nevin Herring. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo = ToDo()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedToDo.name
        // Do any additional setup after loading the view.
    }

    @IBAction func completeTapped(_ sender: Any) {
        var index = 0
        for toDo in previousVC.toDos {
            if toDo.name == selectedToDo.name {
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
        
    }
}
