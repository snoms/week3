//
//  ViewController.swift
//  week3
//
//  Created by vmelcap on 18/02/16.
//  Copyright © 2016 vmelcap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var text:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        readTextFiles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let storyDict: [Int:String] = [0:"simple", 1:"tarzan", 2:"university", 3:"clothes", 4:"dance"]
    var storyVersion = Int(arc4random()%5)
    
    func readTextFiles() {
        let fileName: String = "madlib" + String(storyVersion) + "_" + storyDict[storyVersion]!
        
        print(fileName)
        
        if let path: String = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt")  {
            do {
                text = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            } catch {
                // error handling here
            }
        } else {
            // error handling here
        }
        
        print(text)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "loadSegue") {
            var svc = segue!.destinationViewController as! InputscreenViewController
            var textArray = text!.characters.split{$0 == " " || $0 == "\r\n"}.map(String.init)
//            print("index 1 of textArray pre edit: \(textArray[1])")
//            textArray[1] = "test"
//            print("index 1 of textArray post edit: \(textArray[1])")
//            print("modified textarray .......................")
//            print(textArray)
            svc.passedArray = textArray
        }
    }
}

