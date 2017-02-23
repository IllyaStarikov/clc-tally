//
//  ViewController.swift
//  CLC Tally
//
//  Created by Illya Starikov on 3/22/16.
//  Copyright © 2016 Illya Starikov. All rights reserved.
//

import UIKit

class TallyViewController: UIViewController {
    var counter = Counter()
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet var tapView: UIView?
    
    let defaults = UserDefaults.standard
    var startDate = NSDateComponents()
    
    let tapRecognizer = UITapGestureRecognizer()
    //    let swipeRecognizer = UISwipeGestureRecognizer()
    let longPressRecognizer = UILongPressGestureRecognizer()
    
//    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
        
    func tappedView() {
        counter.update()
        counterLabel.text! = counter.value
        
        if counter.shouldPresentAlert {
            let alertController = UIAlertController(title: "New Hour", message:
                "Log The Number Of Users: \(counter.value)", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            
        
            self.present(alertController, animated: true, completion: nil)
            counter.reset()
        }
    }
    
    func longPressedView() {
        counter.reset()
        counterLabel.text? = counter.value
    }
    
    
    override func viewDidLoad() {
        tapRecognizer.addTarget(self, action: #selector(TallyViewController.tappedView))
        //        swipeRecognizer.addTarget(self, action: "swipedView")
        longPressRecognizer.addTarget(self, action: #selector(TallyViewController.longPressedView))
        
        
        tapView!.addGestureRecognizer(tapRecognizer)
        //        tapView!.addGestureRecognizer(swipeView)
        tapView!.addGestureRecognizer(longPressRecognizer)
        
        tapView!.isUserInteractionEnabled = true
       
        counterLabel.text? = counter.value
        
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

