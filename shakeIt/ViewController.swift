//
//  ViewController.swift
//  shakeIt
//
//  Created by uyanga on 5/4/15.
//  Copyright (c) 2015 uyanga. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
 
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    
    var motionManager = CMMotionManager()
    
    @IBOutlet weak var accX: UILabel?
    @IBOutlet weak var accY: UILabel?
    @IBOutlet weak var accZ: UILabel?
    @IBOutlet weak var maxAccX: UILabel?
    @IBOutlet weak var maxAccY: UILabel?
    @IBOutlet weak var maxAccZ: UILabel?
    
    
    @IBAction func resetMaxValues() {
        currentMaxAccelX = 0
        currentMaxAccelY = 0
        currentMaxAccelZ = 0
    }
    

    @IBOutlet weak var shakeCount: UILabel!
   
    
    override func viewDidLoad() {
        currentMaxAccelX = 0.0
        currentMaxAccelY = 0.0
        currentMaxAccelZ = 0.0
        
        motionManager.accelerometerUpdateInterval = 1.0
        
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: { (accelerometerData: CMAccelerometerData!, error:NSError!) -> Void in self.outputAccelerationData(accelerometerData.acceleration)
            if (error != nil) {
                println("\(error)")
            }
        })
        
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    func outputAccelerationData(acceleration: CMAcceleration) {
        accX?.text = "\(acceleration.x).2fg" //changing text , 2fg label
        if fabs(acceleration.x) > fabs(currentMaxAccelX) { //absolute value for float
            currentMaxAccelX = acceleration.x
        }
        accY?.text = "\(acceleration.y).2fg"
        if fabs(acceleration.y) > fabs(currentMaxAccelY) {
            currentMaxAccelY = acceleration.y
        }
        accZ?.text = "\(acceleration.z).2fg"
        if fabs(acceleration.z) > fabs(currentMaxAccelZ) {
            currentMaxAccelZ = acceleration.z
        }
        maxAccX?.text = "\(currentMaxAccelX) .2f"
        maxAccY?.text = "\(currentMaxAccelY) .2f"
        maxAccZ?.text = "\(currentMaxAccelZ) .2f"
    }

}

