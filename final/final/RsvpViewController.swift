

import UIKit

class RsvpViewController: UIViewController {

    @IBOutlet var canvas: UIView!

    @IBOutlet weak var greenPlace: UIView!
    @IBOutlet weak var redPlace: UIView!
    
    let viewWidth = 180.0
    let viewHeight = 50.0
    
    let scoutModel = ScoutModel();

    
    var eventId: Int = 0;
    var eventName: String = "";
    
    var yesScouts = [String: Scout]()
    var noScouts = [String: Scout]()
    
    var yesIcons: [ScoutIconView] = []
    var noIcons: [ScoutIconView] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = eventName
        

        let _ = scoutModel.getScouts() {
         
            (scouts: [String:Scout]?) in print("completed");
            
            self.noScouts = scouts!
            
            let _ = self.scoutModel.getYesForEvent(self.eventId) {
                (yesList: [String]?) in print("scouts downloaded");
                
                if let yesList = yesList {

                    for (name) in yesList {
                        self.yesScouts[name] = self.noScouts[name]
                        self.noScouts[name] = nil
                        
                    }

                    dispatch_async(dispatch_get_main_queue(), {
                        self.renderScouts(false, scouts: self.noScouts)
                        self.renderScouts(true, scouts: self.yesScouts)
                    })
                    
                
                }
            }
            
        }
        
        canvas.sendSubviewToBack(greenPlace)
        canvas.sendSubviewToBack(redPlace)
        
    }


    
    private func renderScouts(going: Bool, scouts: [String:Scout]) {

        var viewIcons = yesIcons;
        var place = greenPlace;
        
        if (!going) {
            viewIcons = noIcons;
            place = redPlace;
        }
        
        let columns = (Int(place.frame.size.width) / Int(viewWidth+10)) - 1
        print(columns)
        
        var currentCol = 0;
        var currentRow = 0;
        
        for (name, _) in scouts {
            
            // Why Swift, Why? https://www.dropbox.com/s/iqalf4cnc5xd5fv/Screenshot%202016-09-12%2009.47.01.png?dl=0
            let fuckYouSwiftX = currentCol*(Int(viewWidth)+10)
            let fuckYouSwiftY = currentRow*(Int(viewHeight)+10)
            
            let pointX = CGFloat(fuckYouSwiftX + Int(place.frame.origin.x) + 10)
            let pointY = CGFloat(fuckYouSwiftY + Int(place.frame.origin.y) + 10)
            
            guard let scout = scouts[name] else {continue}
            
            let newView = ScoutIconView(frame: CGRectMake(pointX, pointY, CGFloat(viewWidth), CGFloat(viewHeight)), scout: scout)
            newView.delegate = self;
            
            viewIcons.append(newView)
            
            self.view.addSubview(newView)
            
            if (currentCol < columns) {
                currentCol += 1
            } else {
                currentCol = 0;
                currentRow += 1
            }
            
        }
        
    }
    
}

extension RsvpViewController: ScoutWasMovedDelegate {
    
    func scoutWasMoved(scoutView: ScoutIconView) {

        let center = scoutView.center
        if (center.x > greenPlace.frame.origin.x) {
            print("Going")
            yesScouts[scoutView.scout.name] = scoutView.scout
            noScouts[scoutView.scout.name] = nil
        } else {
            print("Not going")
            yesScouts[scoutView.scout.name] = nil
            noScouts[scoutView.scout.name] = scoutView.scout
        }
        
        for view in canvas.subviews {
            if view.isKindOfClass(ScoutIconView) {
                view.removeFromSuperview()
            }
        }
        
        renderScouts(false, scouts: noScouts)
        renderScouts(true, scouts: yesScouts)
        
        dispatch_async(dispatch_get_main_queue(), {
        
            self.scoutModel.postUpdate(self.eventId, yes: self.yesScouts)
        
        })
        
        
    }
    
}

