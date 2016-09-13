//
//  Story.swift
//  MashableApi
//
//  Created by Steven Tursi on 8/22/16.
//  Copyright © 2016 Steven Tursi. All rights reserved.
//

import UIKit


@objc public class Story: NSObject {
    let id: String
    let title: String
    let url: NSURL
    
    init(id: String, title: String, url: NSURL) {
        self.id = id
        self.title = title
        self.url = url
    }
    
}
