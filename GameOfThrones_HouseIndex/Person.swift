//
//  Person.swift
//  GameOfThrones_HouseIndex
//
//  Created by Evan Callia on 9/21/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import UIKit

class Person {
    var name: String
    var gender: String
    var culture: String
    var born: String
    
    init(name: String, gender: String, culture: String, born: String){
        self.name = name
        self.gender = gender
        self.culture = culture
        self.born = born
    }
    
    static func getPeople(house: House, comp: @escaping (_ houses: [Person]) -> ()){
        var people = [Person]()
        
        func rGetPeople(url:NSURL){
            let session = URLSession.shared
            // Create a "data task" which will request some data from a URL and then run a completion handler after it is done
            let task = session.dataTask(with: url as URL, completionHandler: {
                data, response, error in
                do {
                    // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                    if let character = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        people.append(Person(name: (character["name"] as? String)!, gender: (character["gender"] as? String)!, culture: (character["culture"] as? String)!, born: (character["born"] as? String)!))}
                    comp(people)
                } catch {
                    print("Something went wrong")
                }
            })
            task.resume()
        }
        
        for link in house.swornMembers{
            let url = NSURL(string: link)
            rGetPeople(url: url!)
        }
    }
}







