//
//  APIManager.swift
//  GeniusPlazaFeedSwift
//
//  Created by Pias khan on 5/26/19.
//  Copyright © 2019 Pias khan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class APIManager {
    
    func getMediaByURL(url: String, completionHandler: @escaping  ([Media], Error?) -> ()) {
        
        Alamofire.request(url)
            .responseJSON { response in
                print(response)
                switch response.result {
                case .success(let value):
                    print(value)
                    
                    let json = JSON(value)
                    let feed = json["feed"].dictionaryValue
                    let results = feed["results"]?.arrayObject
                    var mediaArray: [Media] = []
                    for dict in results! {
                        let mediaObj = Media(fromDictionary: dict as! [String : Any])
                        mediaArray.append(mediaObj)
                    }
                    completionHandler(mediaArray, nil)
                    
                case .failure(let error):
                    print(error)
                    
                }
        }
        
    }
    
}
