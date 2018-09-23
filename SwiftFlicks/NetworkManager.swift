//
//  NetworkManager.swift
//  SwiftFlicks
//
//  Created by Michael on 9/23/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    static var shared = NetworkManager()
    static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    static let nowPlayingBase = "https://api.themoviedb.org/3/movie/now_playing"
    static let queryBase = "https://api.themoviedb.org/3/search/movie"
    
    func addApiKey(_ params: Dictionary<String, String>) -> Dictionary<String, String> {
        var updatedParams = params
        updatedParams["api_key"] = NetworkManager.apiKey
        return updatedParams
    }
    
    func moviesNowPlaying(completion: @escaping ([MovieModel]) -> Void) {
        let params = addApiKey([:])
        Alamofire.request(NetworkManager.nowPlayingBase, parameters: params).responseJSON { response in
            if let json = response.result.value {
                self.parseMovieResults(json, completion: completion)
            }
        }
    }
    
    func moviesSearched(matching query: String, completion: @escaping ([MovieModel]) -> Void) {
        if query.count > 1 {
            let params = addApiKey(["query": query])
            Alamofire.request(NetworkManager.queryBase, parameters: params).responseJSON { response in
                if let json = response.result.value {
                    self.parseMovieResults(json, completion: completion)
                }
            }
        }
    }
    
    private func parseMovieResults(_ json: Any, completion: @escaping ([MovieModel]) -> Void) {
        let dict = json as! Dictionary<String, Any>
        var models: [MovieModel] = []
        let results: [Dictionary] = dict["results"] as! [Dictionary<String, Any>]
        for item in results {
            let movie = MovieModel(item)
            models.append(movie)
        }
        completion(models)
    }
}
