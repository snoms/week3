//
//  ResultscreenViewController.swift
//  week3
//
//  Created by vmelcap on 18/02/16.
//  Copyright © 2016 vmelcap. All rights reserved.
//

import UIKit

class ResultscreenViewController: UIViewController {

    var resultArray = String()

    @IBAction func resetButton(sender: AnyObject) {
    }
    
    
    @IBOutlet weak var resultField: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultField.text = resultArray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
