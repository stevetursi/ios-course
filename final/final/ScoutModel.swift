
import UIKit

class ScoutModel {
    init() {}
    
    func parseResponse(data: NSData) -> [String:Scout] {
     
        var scouts = [String:Scout]()
        
        do {
            
            if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
                if let categoryObj = json["scouts"] as? [[String: AnyObject]] {
                    for storyObj in categoryObj {
                        if
                            let name = storyObj["name"] as? String,
                            let rank = storyObj["rank"] as? String,
                            let patrol = storyObj["patrol"] as? String
                        {
                            let scout = Scout(name: name, rank: rank, patrol: patrol)
                            scouts[name] = scout
                            
                        }
                        
                    }
                }
                
                
                
            }
        } catch {
            print ("something went wrong in parser")
        }
        
        return scouts
        
    }
    
    func getScouts(completion: ([String:Scout]?) -> Void) {

        
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: "http://ec2-54-159-156-61.compute-1.amazonaws.com:8091/scouts")!) { (data,response,error) in
            
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
    
    func parseYes(data: NSData) -> [String] {
        var yes = [String]()
        
        do {
            if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                as? [String: AnyObject] {
                if let scouts = json["scouts"] as? [String] {
                    for scout in scouts {
                        print(scout)
                        yes.append(scout)
                    }
                }
                print(json)
                
            }

        
        } catch {
            print ("something went wrong in parser")
        }
        
        
        return yes
    }
    
    func getYesForEvent(eventId: Int, completion: ([String]?) -> Void) {
        
        let url = "http://ec2-54-159-156-61.compute-1.amazonaws.com:8091/event/\(String(eventId))"
        
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
            
            completion(self.parseYes(data));
            
        }
        task.resume()
        
    }
    
    func postUpdate(eventId: Int, yes: [String:Scout]) {
        var scouts = [String]()
        for (name, _ ) in yes {
            scouts.append(name)
        }
        
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(scouts, options: NSJSONWritingOptions.PrettyPrinted)
            print(jsonData)
        
            let url = "http://ec2-54-159-156-61.compute-1.amazonaws.com:8091/event/\(String(eventId))"

            let request = NSMutableURLRequest(URL: NSURL(string: url)!)
            request.HTTPMethod = "POST"
            request.HTTPBody = jsonData

            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data,response,error) in
                if let error = error {
                    print ("Error: \(error.localizedDescription)")
                }
                
                
            }
            task.resume()
        
        } catch let error as NSError {
            print(error.description)
        }
        
        
        
        
    }
}