//
//  ViewController.swift
//  XYZ
//
//  Created by sHiKoOo on 2/13/19.
//  Copyright © 2019 sHiKoOo. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLbl: UILabel!
    @IBOutlet weak var yLbl: UILabel!
    @IBOutlet weak var zLbl: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    
    func updateLabels(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data else { return }
        // limit the decimal after .
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        // get the data from CMAccelerometerData and convert it to string to be able to disply it
        let x = formatter.string(for: accelerometerData.acceleration.x)!
        let y = formatter.string(for: accelerometerData.acceleration.y)!
        let z = formatter.string(for: accelerometerData.acceleration.z)!
        
        print(x, y, z)
        //put these values to our variables labels
        xLbl.text = "X: \(x)"
        yLbl.text = "Y: \(y)"
        zLbl.text = "Z: \(z)"
        
    }


}

