//
//  ViewController.swift
//  ControlAndGesture
//
//  Created by Lovey on 7/20/16.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var tapGestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let sliderFrame = CGRect(x: 20, y: 100, width: 300, height: 30)
        let slider = UISlider(frame: sliderFrame)
        view.addSubview(slider)
        slider.addTarget(self, action: #selector(ViewController.sliderAction(_:)), forControlEvents: UIControlEvents.ValueChanged)

        
//        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressGestureAction(_:)))
        
//            yellowView.addGestureRecognizer(longPressGestureRecognizer)
        
    }

//    @objc func longPressGestureAction(sender: UILongPressGestureRecognizer){
//        
//        
//    }
    
    func sliderAction(sender: UISlider) {
        print("SLider value \(sender.value)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func valueChangedEvent(sender: UISegmentedControl) {
        tapGestureRecognizer.numberOfTapsRequired = sender.selectedSegmentIndex+1
        print("Segment Value \(sender.selectedSegmentIndex)")
    }
    
    @IBAction func singleTapRecognizer(sender: UITapGestureRecognizer) {

        let alertController = UIAlertController(title: "tapped", message: "you tapped me (:", preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
        alertController.addAction(alertAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}

