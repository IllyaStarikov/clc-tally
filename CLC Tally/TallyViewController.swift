//
//  ViewController.swift
//  CLC Tally
//
//  Created by Illya Starikov on 3/22/16.
//  Copyright © 2016 Illya Starikov. All rights reserved.
//

import UIKit

class TallyViewController: UIViewController {
    var counter = 0
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet var tapView: UIView?
//    @IBOutlet var swipeView: UIView?
//    @IBOutlet var longPressView: UIView?
    
    let tapRecognizer = UITapGestureRecognizer()
//    let swipeRecognizer = UISwipeGestureRecognizer()
//    let longPressRec = UILongPressGestureRecognizer()
    
    func tappedView() {
        updateTheCounter()
    }

    func updateTheCounter() {
        counter += 1
        counterLabel.text! = "\(counter)"
    }
    
//    func startTheCounter() {
//        let dateComponents = NSDateComponents(),
//        currentDate = NSDate()
//        
//        
//    }

//    func longPressedView(){
//        let tapAlert = UIAlertController(title: "Long Pressed", message: "You just long pressed the long press view", preferredStyle: UIAlertControllerStyle.Alert)
//        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
//        self.presentViewController(tapAlert, animated: true, completion: nil)
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tapRecognizer.addTarget(self, action: "tappedView")
//        swipeRecognizer.addTarget(self, action: "swipedView")
//        longPressRec.addTarget(self, action: "longPressedView")
        
        
        tapView!.addGestureRecognizer(tapRecognizer)
//        swipeView!.addGestureRecognizer(swipeView)
//        longPressView!.addGestureRecognizer(longPressRec)
        
        tapView!.userInteractionEnabled = true
//        swipeView!.userInteractionEnabled = true
//        longPressView!.userInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

