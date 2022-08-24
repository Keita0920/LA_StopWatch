//
//  ViewController.swift
//  StopWatch
//
//  Created by K I on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    
    var count: Float=0.0
    
    var timer: Timer=Timer()
    
    @IBOutlet var hyoji:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        hyoji.text=""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count=count+0.01
        
        label.text=String(format: "%.2f", count)
    }
    
    @IBAction func start(){
        if !timer.isValid{
            timer=Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            
            hyoji.text=""
        }
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        
        count=0.00
        
        label.text=String(format: "%.2f", count)
        
        hyoji.text=""
    }
    
    @objc func hantei(){
        if count >= 9.80 && count <= 10.20{
            hyoji.text="PERFECT!"
        }else if count >= 9.70 && count <= 10.30{
            hyoji.text="GREAT!"
        }else if count >= 9.50 && count <= 10.50{
            hyoji.text="GOOD!"
        }else{
            hyoji.text="BAD!"
        }
    }


}

