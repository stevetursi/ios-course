//: Playground - noun: a place where people can play

import UIKit


let url  = "http://mashable.com/stories.json"


if   let nsurl = NSURL(string: url) {

let task = NSURLSession.sharedSession().dataTaskWithURL(nsurl) {
    (data,response,error) in
    
    if let error = error {
        print ("Error: \(error.localizedDescription)")
        return
    }
    
    if
        let data = data,
        let JSONObject = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
    
     
        if let hotStories = JSONObject["hot"] as? [[String: AnyObject]] {
            
        }
        
    
    }
    
    dispatch_async(dispatch_get_main_queue(), {
        
        
        
    })
    
    }
}
        