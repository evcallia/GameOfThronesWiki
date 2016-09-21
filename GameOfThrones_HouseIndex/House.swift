//
//  House.swift
//  GameOfThrones_HouseIndex
//
//  Created by Evan Callia on 9/21/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import UIKit

class House {
    var name = String()
    var swornMembers = [String]()
    var region = String()
    var coatOfArms = String()
    var words = String()
    
    init(name: String, swornMembers: [String], region: String, coatOfArms: String, words: String){
        self.name = name
        self.swornMembers = swornMembers
        self.region = region
        self.coatOfArms = coatOfArms
        self.words = words
    }
    
    
    static func getAllHouses(comp: @escaping (_ houses: [House]) -> ()){
        var houses = [House]()
        func rGetAllHouses(url:NSURL){
            let session = URLSession.shared
            // Create a "data task" which will request some data from a URL and then run a completion handler after it is done
            let task = session.dataTask(with: url as URL, completionHandler: {
                data, response, error in
                do {
                     if let resultsArray = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray {
                            for result in resultsArray{
                                if let house = result as? NSDictionary{
                                    houses.append(House(name: house["name"] as! String, swornMembers: house["swornMembers"] as! [String], region: house["region"] as! String, coatOfArms: house["coatOfArms"] as! String, words: house["words"] as! String))
                                }
                            }
                        comp(houses)
                    }
                } catch {
                    print("Something went wrong")
                }
            })
            task.resume()
        }
        for i in 1...9{
            let url = NSURL(string: "http://anapioficeandfire.com/api/houses?page=\(i)&pageSize=50")
            rGetAllHouses(url: url!)
        }
    }
}









