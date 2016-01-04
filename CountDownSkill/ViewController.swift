//
//  ViewController.swift
//  CountDownSkill
//
//  Created by luojie on 15/12/28.
//  Copyright © 2015年 LuoJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CountDownSkill {

    @IBOutlet weak var countDownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startCountDownWithSeconds(10)
    }
    
    func countDownSelector(timer: NSTimer) {
        countDownAction(timer: timer)
    }
    
    func countDownWithRemainingSeconds(remainingSeconds: Int) {
//        print("ViewController remainingSeconds: \(remainingSeconds)")
        countDownLabel.text = "\(remainingSeconds)"
    }
    
    func countDownDidFinish() {
        print(__FUNCTION__)
    }
}

