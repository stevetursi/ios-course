//
//  StoryModel.swift
//  MashableApi
//
//  Created by Steven Tursi on 8/22/16.
//  Copyright © 2016 Steven Tursi. All rights reserved.
//

import UIKit

class StoryModel {
    init(){}
    
    func parseResponse(data: NSData, category: String) -> [Story] {
    
        var storyList = [Story]()
        
        do {
        
        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
            if let categoryObj = json[category] as? [[String: AnyObject]] {
                for storyObj in categoryObj {
                    if
                        let title = storyObj["display_title"] as? String,
                        let urlString = storyObj["link"] as? String,
                        let url = NSURL(string: urlString),
                        let id = storyObj["_id"] as? String
                    {
                        let story = Story(id: id, title: title, url: url)
                        storyList.append(story)
                    }
                    
                }
            }
            
            
               // print(json)

            
            }
        } catch {
            print ("something went wrong in parser")
        }
        return storyList;
    }
    
    
    func getStoriesFor(category: String, completion: ([Story]?) -> Void) {
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: "http://mashable.com/stories.json")!) { (data,response,error) in
            
            if let error = error {
                print ("Error: \(error.localizedDescription)")
                completion(nil)
                return

            }
            
            guard
                let data = data  else {
                    print("something went wrong")
                    completion(nil)
                    return
            }
            
            completion(self.parseResponse(data, category: category));

    }
        
        task.resume()
    }
}
