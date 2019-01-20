//
//  ThirdViewController.swift
//  TODO
//
//  Created by Kaiwen Zhang on 2017-12-10.
//  Copyright © 2017 Kaiwen Zhang. All rights reserved.
//

import UIKit

var finishedTasks = [TodoItem]()

class FinishedTaskTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var finishedTaskTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (finishedTasks.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "FinishedTaskTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell.")
        }
        
        finishedTasks = []
        
        for task in tasks {
            if task.isDone == true {
                finishedTasks.append(task)
            }
        }
        
        // Fetches the appropriate meal for the data source layout.
        let finishedTask = finishedTasks[indexPath.row]
        
        cell.taskNameLabel.text = finishedTask.title
        cell.deadlineLabel.text = finishedTask.date
        cell.progressBar.progress = finishedTask.progress
        
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
            finishedTaskTableView.reloadData()
        }
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        finishedTaskTableView.reloadData()
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


