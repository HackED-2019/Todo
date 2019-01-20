//
//  FirstViewController.swift
//  TODO
//
//  Created by Kaiwen Zhang on 2017-12-08.
//  Copyright © 2017 Kaiwen Zhang. All rights reserved.
//

import UIKit

var tasks = [TodoItem]()
var myIndex = 0

class TaskTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var taskTableView: UITableView!
    
    @IBAction func add(_ sender: Any) {

        let alert = UIAlertController(title: "What is your plan today?", message: nil, preferredStyle: .alert)
        
        // Cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        
        
        // Submit button
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
            // Get 1st TextField's text
            let textField = alert.textFields![0]
            
            if (textField.text != "")
            {
                let todo = TodoItem(title: textField.text ?? "no title", date: "2019-01-01")
                tasks.append(todo)
                textField.text = ""
                self.view.endEditing(true)
            }
            self.taskTableView.reloadData()
            print(textField.text!)
        })
        
        // Add 1 textField and customize it
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.clearButtonMode = .whileEditing
        }
        
        // Add action buttons and present the Alert
        alert.addAction(cancel)
        alert.addAction(submitAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (tasks.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "TaskTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let task = tasks[indexPath.row]
        
        cell.taskNameLabel.text = task.title
        cell.deadlineLabel.text = task.date
        cell.progressBar.progress = task.progress
        
        return cell
    
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        myIndex = indexPath.row
        performSegue(withIdentifier: "firstViewSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        
//        delete item
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            tasks.remove(at: indexPath.row)
            taskTableView.reloadData()
        }

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        taskTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Plans"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

