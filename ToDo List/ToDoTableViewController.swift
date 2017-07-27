//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Nevin Herring on 7/23/17.
//  Copyright © 2017 Nevin Herring. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = createToDos()
        
    }

    func createToDos() -> [ToDo]{
        
        let eggs = ToDo()
        eggs.name = "Buy Eggs"
        eggs.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        
        let cheese = ToDo()
        cheese.name = "Eat cheese"
        
        return [eggs, dog, cheese]
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let toDo = toDos[indexPath.row]
        
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        }else{
            cell.textLabel?.text = toDo.name

        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController {
        addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
            
            if let toDo = sender as? ToDo {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
        
    }
    
}
