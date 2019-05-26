//
//  Media.swift
//  GeniusPlazaFeedSwift
//
//  Created by Pias khan on 5/26/19.
//  Copyright © 2019 Pias khan. All rights reserved.
//

import UIKit

class Media: NSObject {
    var name: String!
    var type: String!
    var imageURL: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        type = dictionary["kind"] as? String
        imageURL = dictionary["artworkUrl100"] as? String
        
    }
}
