
import UIKit

class EventListViewController: UITableViewController {
        
    var model = [Event]()
    let eventModel = EventModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let _ = eventModel.getEvents() {
            
            (events: [Event]?) in print("events downloaded ok");
            self.model = events!
        
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })

        }
        
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventIdentifier", forIndexPath:  indexPath) as! TableRow
        let data = model[indexPath.row]
        cell.mainText?.text = ("\(data.name) - \(data.date)")
        cell.detailText?.text = data.notes
        
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let rsvpVC = segue.destinationViewController as? RsvpViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let thisEvent = model[indexPath.row]
                rsvpVC.eventName = thisEvent.name
                rsvpVC.eventId = thisEvent.id
                
            }
        }
    }
    
    
}
