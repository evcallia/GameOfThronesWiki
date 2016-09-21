//
//  ShowPersonViewController.swift
//  GameOfThrones_HouseIndex
//
//  Created by Evan Callia on 9/21/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import UIKit

class ShowPersonViewController: UIViewController {

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var cultureLabel: UILabel!
    @IBOutlet weak var bornLabel: UILabel!
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = person?.name
        if person?.born == ""{
            bornLabel.text = "unknown"
        }else{
            bornLabel.text = person?.born
        }
        if person?.culture == ""{
            bornLabel.text = "unknown"
        }else{
            cultureLabel.text = person?.culture
        }
        if person?.gender == ""{
            bornLabel.text = "unknown"
        }else{
            genderLabel.text = person?.gender
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
