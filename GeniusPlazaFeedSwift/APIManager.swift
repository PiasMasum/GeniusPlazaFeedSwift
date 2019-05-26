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


struct AppURLs {
    static let AppleMusicURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-songs/all/10/explicit.json"
    static let ItunesMusicURL = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/10/explicit.json"
    static let IOSAppsURL = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json"
    static let AudiobooksURL = "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/all/10/explicit.json"
    static let BooksURL = "https://rss.itunes.apple.com/api/v1/us/books/top-free/all/10/explicit.json"
    static let TvShowsURL = "https://rss.itunes.apple.com/api/v1/us/tv-shows/top-tv-episodes/all/10/explicit.json"
    static let MoviesURL = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/10/explicit.json"

}

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
