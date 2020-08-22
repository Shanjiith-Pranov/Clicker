//
//  ResultsViewController.swift
//  Clicker Again Again
//
//  Created by JiaChen(: on 19/8/19.
//  Copyright © 2019 SST Inc. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var currentTime = 0.0
    @IBOutlet weak var timeLabel: UILabel!
    var timings: [Double] = []
    @IBOutlet var leaderboardsScoreLabel: [UILabel]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        timeLabel.text = "\(currentTime)s"
        
        // Get saved result of timings
        timings = UserDefaults.standard.array(forKey: "timings") as? [Double] ?? []

        //add current time to array
        timings.append(currentTime)
        
        // Sort it
        timings.sort()
        
        //print the timings array
        print(timings)
        
        // Set back the UserDefault value
        UserDefaults.standard.set(timings, forKey: "timings")

        //Checking if the UserDefaults worked
        var documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        documentsPath.removeLast(9)
        documentsPath.append("Library/Preferences/")
        print("Your plist is at 💁‍♀️: \(documentsPath)")
        
        // Set the leaderboardsScores to timings
        for i in 0...leaderboardsScoreLabel.count - 1{
            if i < timings.count - 1{
                leaderboardsScoreLabel[i].text = String(timings[i])
            } else {
                leaderboardsScoreLabel[i].text = "No Data"
            }
        }
        


    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
