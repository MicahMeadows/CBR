//
//  MoreViewController.swift
//  CBR
//
//  Created by Micah Meadows on 10/13/22.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBAction func openGithub() {
        UIApplication.shared.openURL(URL(string: "https://github.com/micahmeadows")!);
    }
    
    @IBAction func openLinked() {
        UIApplication.shared.openURL(URL(string: "https://linkedin.com/in/micah-meadows")!);
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
