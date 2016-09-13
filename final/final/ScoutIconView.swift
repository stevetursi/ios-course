
import UIKit

protocol ScoutWasMovedDelegate: class {
    func scoutWasMoved(scoutView: ScoutIconView)
}


class ScoutIconView: UIView {
    var lastLocation:CGPoint = CGPointMake(0, 0)
    var delegate: ScoutWasMovedDelegate?
    
    let scout: Scout
    
    let nameLabel: UILabel
    let rankLabel: UILabel
    
    init(frame: CGRect, scout: Scout) {
        self.scout = scout
        nameLabel = UILabel(frame: CGRectMake(5, 0, 140, 25))
        rankLabel = UILabel(frame: CGRectMake(5, 25, 140, 25))
        
        super.init(frame: frame)
        
        // Initialization code
        let panRecognizer = UIPanGestureRecognizer(target:self, action:"detectPan:")
        self.gestureRecognizers = [panRecognizer]
        
        switch self.scout.rank {
        case "Pre-Scout":
            self.backgroundColor = UIColor.lightGrayColor()
            break
        case "Scout":
            self.backgroundColor = UIColor.brownColor()
            break
        case "Tenderfoot":
            self.backgroundColor = UIColor.greenColor()
            break
        case "Second Class":
            self.backgroundColor = UIColor.redColor()
            break
        case "First Class":
            self.backgroundColor = UIColor.cyanColor()
            break
        case "Star":
            self.backgroundColor = UIColor.grayColor()
            break
        case "Life":
            self.backgroundColor = UIColor.magentaColor()
            break
        case "Eagle":
            self.backgroundColor = UIColor.orangeColor()
            break
            
        default:
            self.backgroundColor = UIColor.whiteColor()
            
        }
        
//        nameLabel.center = CGPointMake(90, 15)
        nameLabel.textAlignment = NSTextAlignment.Left
        nameLabel.font = nameLabel.font.fontWithSize(14)
        nameLabel.text = scout.name

        rankLabel.textAlignment = NSTextAlignment.Left
        rankLabel.font = nameLabel.font.fontWithSize(10)
        rankLabel.text = scout.rank
        
        self.addSubview(nameLabel)
        self.addSubview(rankLabel)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectPan(recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translationInView(self.superview!)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        if (recognizer.state == UIGestureRecognizerState.Ended) {
            delegate?.scoutWasMoved(self)
        }
    }
    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        
        // Remember original location
        lastLocation = self.center
    }

    
}