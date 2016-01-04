//
//  CountDownSkill.swift
//  CountDownSkill
//
//  Created by luojie on 15/12/28.
//  Copyright © 2015年 LuoJie. All rights reserved.
//

import Foundation

protocol CountDownSkill {
    func countDownWithRemainingSeconds(remainingSeconds: Int)
    func countDownDidFinish()
    func countDownSelector(timer: NSTimer) // Allways Only Call "countDownAction(timer)" Inside, Because targe action in protocol extension is currentlly not supported: https://forums.developer.apple.com/thread/16773
}

extension CountDownSkill where Self: AnyObject {
    //    func startCountDownWithDuration(duration: NSTimeInterval,timeInterval: NSTimeInterval, progress: ((NSTimeInterval) -> Void)?, didFinish: (() -> Void)?) {
    //
    //    }
    
    func startCountDownWithSeconds(seconds: Int) {
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countDownSelector:", userInfo: seconds, repeats: false)
        countDownWithRemainingSeconds(seconds)
    }
    
    func countDownAction(timer timer: NSTimer) {
        var remainingSeconds = timer.userInfo as! Int
        --remainingSeconds
        countDownWithRemainingSeconds(remainingSeconds)
        if remainingSeconds > 0 {
            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countDownSelector:", userInfo: remainingSeconds, repeats: false)
        } else {
            countDownDidFinish()
        }
    }
}
