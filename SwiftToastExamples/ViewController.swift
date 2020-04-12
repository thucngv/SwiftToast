//
//  ViewController.swift
//  SwiftToastExamples
//
//  Created by Thuc Nguyen on 4/13/20.
//  Copyright © 2020 Thuc Nguyen. All rights reserved.
//

import UIKit
import SwiftToast

class ViewController: UIViewController {
    @IBAction func showToast(_ sender: Any) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        Toast.makeText(self, text: "Time is " + formatter.string(from: date), theme: .system).show()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

