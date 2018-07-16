//
//  StarWarsModel.swift
//  People
//
//  Created by Ashwin Mahesh on 7/16/18.
//  Copyright © 2018 AshwinMahesh. All rights reserved.
//

import Foundation
class StarWarsModel{
    static func getAllPeople(url:String, completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?)->Void){
        let url = URL(string: url)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    static func getAllMovies(completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?)->Void){
        let url = URL(string: "http://swapi.co/api/films/")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
}
