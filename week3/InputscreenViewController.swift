//
//  InputscreenViewController.swift
//  week3
//
//  Created by vmelcap on 18/02/16.
//  Copyright © 2016 vmelcap. All rights reserved.
//

import UIKit

class InputscreenViewController: UIViewController {

    var passedArray = [String]()

    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var wordClassLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var wordButtonOutlet: UIButton!

    // storyArray = array of words in the story
    var storyArray = [String]()
    // wordArray = array of words entered by user
    var wordArray = [String]()
    // array of wordclasses to be entered
    var wordClassArray = [String]()
    // wordCount = current amount of words entered
    var wordCount = 0
    // targetcount = amount of placeholders to fill in
    var targetCount = 0
    // placeholder location array
    var targetLocation = [Int]()
    // segue-readiness bool
    var readyForSegue = false

    override func viewDidLoad() {
        super.viewDidLoad()
        for (index, word) in passedArray.enumerate() {
            if word.hasPrefix("<") && word.hasSuffix(">") {
                ++targetCount
                wordClassArray.append(word as! String)
                targetLocation.append(index)
            }
        }
        for (index, word) in wordClassArray.enumerate() {
            wordClassArray[index] = word.lowercaseString
        }
        print(targetCount)
        print(wordClassArray)
        wordClassLabel.text = wordClassArray[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func wordButton(sender: AnyObject) {
        if (inputField.text != "")
        {
            wordArray.append(inputField.text!)

            if (wordCount < (targetCount)) {
                ++wordCount
                wordClassLabel.text = wordClassArray[wordCount-1]
                let target = targetLocation[wordCount-1]
                passedArray[target] = inputField.text!
                inputField.text = ""
            }
            if (wordCount == targetCount)
            {
                readyForSegue = true
                wordButtonOutlet.setTitle("See result!", forState: UIControlState.Normal)
            }
        }
            
        else {
            // create alert using UIAlertController
            let notxtAlert = UIAlertController(title: "Error", message: "You need to enter text!", preferredStyle: UIAlertControllerStyle.Alert)
            // create & add confirmation button
            let confirmAction = UIAlertAction(
                title: "OK", style: UIAlertActionStyle.Default) { (action) in
            }
            notxtAlert.addAction(confirmAction)
            //show alert
            presentViewController(notxtAlert, animated: true, completion: nil)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "resultSegue") {
            var svc = segue!.destinationViewController as! ResultscreenViewController
            var resultString = passedArray.joinWithSeparator(" ")
            let partialResult:String = resultString.stringByReplacingOccurrencesOfString(" .", withString: ".")
            let finalResult:String = partialResult.stringByReplacingOccurrencesOfString(" ,", withString: ",")
            svc.resultArray = finalResult
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        return readyForSegue
    }
    /*
    // MARK: - Navigation
    let alertController = UIAlertController(title: "Title",
    message: "Message",
    preferredStyle: UIAlertControllerStyle.Alert)
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
