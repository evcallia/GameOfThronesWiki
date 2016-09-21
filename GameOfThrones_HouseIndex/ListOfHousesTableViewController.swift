//
//  ListOfHousesTableViewController.swift
//  GameOfThrones_HouseIndex
//
//  Created by Evan Callia on 9/21/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import UIKit

class ListOfHousesTableViewController: UITableViewController {
    var houses = [House]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        House.getAllHouses(comp: {
            houses in
            self.houses = houses
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
        })
        self.navigationItem.title = "Houses"
    }

// MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return houses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HouseCell", for: indexPath)
        cell.textLabel?.text = houses[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowHouse", sender: houses[indexPath.row])
    }
//************
    
    
// MARK: - Navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let tabController = segue.destination as! UITabBarController
        let controller = tabController.viewControllers?.first as! ShowHouseTableViewController
        let infoController = tabController.viewControllers?[1] as! HouseInformationViewController
        controller.house = sender as? House
        infoController.house = sender as? House
    }
}









