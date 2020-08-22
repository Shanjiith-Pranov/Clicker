//
//  ViewController.swift
//  Clicker Again Again
//
//  Created by JiaChen(: on 18/8/19.
//  Copyright © 2019 SST Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter = 0
    var currentTime = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        counter += 1
        if counter == 30 {
            counter = 0
            performSegue(withIdentifier: "help", sender: nil)
        } 

        

        counterLabel.text = "\(counter)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            // type code here
            self.currentTime += 0.1
            print(self.currentTime)
            self.timeLabel.text = "\(self.currentTime)s"
            
        }
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        if segue.identifier == "help" {
            let tableviewTableViewController = segue.destination as! tableviewTableViewController
            tableviewTableViewController.time = currentTime
             }
     }
 
}

