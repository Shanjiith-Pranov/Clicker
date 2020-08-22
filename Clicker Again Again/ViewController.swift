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
    @IBOutlet weak var clickerImageView: UIImageView!
    
    var counter = 0
    var currentTime = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        counter += 1
        if counter == 50 {
            performSegue(withIdentifier: "show results", sender: nil)
        } else if counter % 10 == 0 {
            clickerImageView.image = UIImage(named: "flowers0\(counter / 10 + 1)")
        }

        self.view.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green:
            CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)

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
        if segue.identifier == "show results" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.currentTime = currentTime
        }
     }
 
}

