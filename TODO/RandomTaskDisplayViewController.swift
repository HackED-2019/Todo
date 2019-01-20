//
//  RandomTaskDisplayViewController.swift
//  TODO
//
//  Created by Punam Woosaree on 2019-01-19.
//  Copyright © 2019 Kaiwen Zhang. All rights reserved.
//

//TODO:
//1) Check if task has been generated - if generated display else generate
//2) After generating continue to task display screen
//3) Allow user to re-generate a random task - doing such brings them to previous page
//4) Allow users to end the task or check off subtasks

import UIKit

class RandomTaskDisplayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var taskObject :String = ""
    
    
    
    @IBOutlet weak var task_name: UILabel!
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
