//
//  ListOfHousesTableViewController.swift
//  GameOfThrones_HouseIndex
//
//  Created by Evan Callia on 9/21/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import UIKit

class ListOfHousesTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var houses = [House]()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredHouses = [House]()
    
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
        self.tableView.backgroundColor = UIColor.black
        
        //search stuff
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }

// MARK: - Search functionality
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredHouses = houses.filter {
            house in
            return house.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
//**********
    
    
// MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredHouses.count
        }
        return houses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HouseCell", for: indexPath)
        let house: House
        if searchController.isActive && searchController.searchBar.text != "" {
            house = filteredHouses[indexPath.row]
        } else {
            house = houses[indexPath.row]
        }
        cell.textLabel?.text = house.name
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "Breathe Fire", size: 22)
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









