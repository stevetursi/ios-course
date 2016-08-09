//
//  ViewController.swift
//  Pokemon Teams
//
//  Created by Matthew on 7/27/16.
//  Copyright © 2016 Matthew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var teamImageView: UIImageView!
    
    @IBAction func instinctButtonAction(sender: AnyObject) {
        setTeam("Instinct")
    }
    
    @IBAction func mysticButtonAction(sender: AnyObject) {
        setTeam("Mystic")
    }
    
    @IBAction func valorButtonAction(sender: AnyObject) {
        setTeam("Valor")
    }
    
    private func setTeam(team: String) {
        teamImageView.image = UIImage(named: team)
        NSUserDefaults.standardUserDefaults().setObject(team, forKey:"teamName")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let team = NSUserDefaults.standardUserDefaults().objectForKey("teamName") as? String {
            setTeam(team)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

