//
//  ViewController.swift
//  Die Taske
//
//  Created by Vishal Patel on 10/02/15.
//  Copyright (c) 2015 BitterMelonTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var taskArray:[TaskModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1 = TaskModel(task: "Study French", subTask: "verbs", date: Date.from(year: 2014, month: 12, day: 30))
        let task2 = TaskModel(task: "Study German", subTask: "Santences", date: Date.from(year: 2016, month: 01, day: 01))
        let task3 = TaskModel(task: "Study Russian", subTask: "Articles", date: Date.from(year: 2017, month: 12, day: 13))
        
        taskArray = [task1, task2, task3]
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- prepareForSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailTaskVC:TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            // another way to get the selected row in the tableView to pass the information in the destination ViewController
            //let indexPath = sender?.row
            
            let thisTask = taskArray[indexPath!.row]
            detailTaskVC.detailTaskModel = thisTask
        }
    }
    
 
    //MARK:- TableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let thisTask = taskArray[indexPath.row]
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("TaskCell") as TaskCell
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text =  Date.toString(date: thisTask.date)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }

    //MARK:- TableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
}

