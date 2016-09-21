//
//  ShowHouseTableViewController.swift
//  GameOfThrones_HouseIndex
//
//  Created by Evan Callia on 9/21/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import UIKit

class ShowHouseTableViewController: UITableViewController {
    
    var house: House?
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Person.getPeople(house: house!, comp: {
            people in
            self.people = people
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
        })
        self.tableView.contentInset = UIEdgeInsetsMake(54,0,0,0)
        self.tabBarController?.navigationItem.title = house?.name
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if people.count == 0{
            return 1
        }
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        if people.count == 0{
            cell.textLabel?.text = "No Sworn Members"
        }else{
            cell.textLabel?.text = people[indexPath.row].name
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if people.count != 0{
            performSegue(withIdentifier: "ShowPerson", sender: people[indexPath.row])
        }
    }
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */


// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let controller = segue.destination as! ShowPersonViewController
        controller.person = sender as? Person
    }

}









