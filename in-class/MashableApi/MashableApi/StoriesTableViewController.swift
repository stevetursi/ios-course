//
//  ViewController.swift
//  MashableApi
//
//  Created by Steven Tursi on 8/17/16.
//  Copyright © 2016 Steven Tursi. All rights reserved.
//

import UIKit

class StoriesTableViewController: UITableViewController {

    var stories: [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let model = StoryModel();
        
        let _ = model.getStoriesFor("hot") {
            (stories: [Story]?) in print("completed");

            self.stories = stories!
            self.tableView.reloadData()
            
            for story in stories! {
                print(story.title)
            }
            
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StoryIdentifier", forIndexPath: indexPath)
        let dataObject = stories[indexPath.row]
        cell.textLabel?.text = ("\(dataObject.title)");
        //cell.detailTextLabel?.text = String(dataObject.url);
        
        return cell
    }
    
    
    
}