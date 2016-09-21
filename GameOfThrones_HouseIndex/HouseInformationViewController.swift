//
//  HouseInformationViewController.swift
//  GameOfThrones_HouseIndex
//
//  Created by Evan Callia on 9/21/16.
//  Copyright © 2016 Evan Callia. All rights reserved.
//

import UIKit

class HouseInformationViewController: UIViewController {
    var house: House?
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var coatOfArmsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if (house != nil) {
            regionLabel.text = house?.region
            if house?.words == "" {
                wordsLabel.text = "None"
            } else {
                wordsLabel.text = house?.words
            }
            if house?.coatOfArms == "" {
                coatOfArmsLabel.text = "None"
            } else {
                coatOfArmsLabel.text = house?.coatOfArms
            }
        }
        // Do any additional setup after loading the view.
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
