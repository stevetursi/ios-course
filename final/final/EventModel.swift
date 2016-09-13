

import UIKit

class EventModel {

    let url = "http://54.159.156.61:8091/events"
    
    init() {}
    
    func parseResponse(data: NSData) -> [Event] {
        
        var events = [Event]()
        
        do {
            
            if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
                if let categoryObj = json["events"] as? [[String: AnyObject]] {
                    for storyObj in categoryObj {
                        if
                            let id = storyObj["id"] as? Int,
                            let name = storyObj["name"] as? String,
                            let date = storyObj["date"] as? String,
                            let notes = storyObj["notes"] as? String
                        {
                            print("adding event \(name)")
                            
                            let event = Event(id: id, name: name, date: date, notes: notes)
                            events.append(event)
                            
                        }
                        
                    }
                }
                
                
                
            }
        } catch {
            print ("something went wrong in parser")
        }
        
        return events
        
    }
    
    func getEvents(completion: ([Event]?) -> Void) {
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!) { (data,response,error) in
            
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
            
            completion(self.parseResponse(data));
            
        }
        task.resume()
        
    }
}