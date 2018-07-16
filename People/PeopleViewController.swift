//
//  ViewController.swift
//  People
//
//  Created by Ashwin Mahesh on 7/12/18.
//  Copyright © 2018 AshwinMahesh. All rights reserved.
//

import UIKit
class PeopleViewController: UITableViewController {
    var people:[NSDictionary] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight=140
        getData(from: "http://swapi.co/api/people/")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PeopleCellTableViewCell
        cell.nameLabel.text = people[indexPath.row]["name"] as! String
        cell.genderLabel.text = "Gender: \(people[indexPath.row]["gender"] as! String)"
        cell.birthLabel.text = "Birth year: \(people[indexPath.row]["birth_year"] as! String)"
        cell.massLabel.text = "Mass: \(people[indexPath.row]["mass"] as! String) kg"
        return cell
    }
    
    func getData(from url:String){
        StarWarsModel.getAllPeople(url: url, completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary {
                    let newPeople = jsonResult["results"] as! [NSDictionary]
//                    print(newPeople)
                    self.people.append(contentsOf: newPeople)

                    //Put all UI Updates inside of this DispatchQueue Thread so that it updates first
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                    if let nextURL = jsonResult["next"] as? String {
                        self.getData(from: nextURL)
                    }
                }
            } catch {
                print(error)
            }
        })
    }
}
