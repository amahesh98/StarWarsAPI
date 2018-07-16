//
//  MoviesVC.swift
//  People
//
//  Created by Ashwin Mahesh on 7/16/18.
//  Copyright © 2018 AshwinMahesh. All rights reserved.
//

import UIKit

class MoviesVC: UITableViewController {
    var movies:[NSDictionary] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 550
        getData(from: "https://swapi.co/api/films/")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.titleLabel.text = movies[indexPath.row]["title"] as! String
        cell.releaseDate.text = "Released: \(movies[indexPath.row]["release_date"] as! String)"
        cell.directorLabel.text = "Directed by: \(movies[indexPath.row]["director"] as! String)"
        cell.crawlLabel.text = "Opening Crawl: \(movies[indexPath.row]["opening_crawl"] as! String)"
        return cell
    }
    
    func getData(from url:String){
        StarWarsModel.getAllMovies(completionHandler: {
            data, response, error in
//            print(data ?? "no data")
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary{
//                    print(jsonResult)
                    if let allMovies = jsonResult["results"] as? [NSMutableDictionary]{
                        print(allMovies)
                        for movie in allMovies{
                            self.movies.append(movie)
                        }
                        DispatchQueue.main.async{
                            self.tableView.reloadData()
                        }
                    }
                }
            }
            catch{
                print(error)
            }
        })
    }

}
