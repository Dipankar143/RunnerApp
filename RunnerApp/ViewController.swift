//
//  ViewController.swift
//  RunnerApp
//
//  Created by Dipanker on 02/09/17.
//  Copyright © 2017 BlackDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeLable: UILabel!
    
    @IBOutlet var startBtn: UIButton!
    
    var time=0
    var timer=Timer()
    var btnState=true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLable.text="00"
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func stopTapped(_ sender: Any) {
        
        btnState=true
        timer.invalidate()
        time=0
        startBtn.setTitle("Start", for: .normal)
        
    }

    @IBAction func resetTapped(_ sender: Any) {
        btnState=true
        timer.invalidate()
        time=0
        timeLable.text="\(time)0"
        startBtn.setTitle("Start", for: .normal)

    }
 
    @IBAction func startBtnTapped(_ sender: Any) {
        if btnState==true {
            btnState=false
            startBtn.setTitle("Pause", for: .normal)
            timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.add), userInfo: nil, repeats: true)
            
        }
        else{
            timer.invalidate()
            btnState=true
            startBtn.setTitle("Resume", for: .normal)
        }
        
    }
    
     func add(){
        time=time+1
        if(time<=9){
        timeLable.text="0\(time)"
        }
        else{
           timeLable.text="\(time)" 
        }
    }

}

