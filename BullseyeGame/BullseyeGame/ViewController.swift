//
//  ViewController.swift
//  BullseyeGame
//
//  Created by Mercury Cash on 8/14/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnGo: UIButton!
    @IBOutlet weak var lblTarget: UILabel!
    @IBOutlet weak var sliderMain: UISlider!
    
    var sliderCurrentValue: Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGame()
    }


    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundedValue = sender.value.rounded()
        sliderCurrentValue = Int(roundedValue);
    }
    
    
    @IBAction func btnGoTouchUpInside(_ sender: Any) {
        showAlert(message: "The value you selected is: \(sliderCurrentValue)" + "\nThe target value is \(targetValue)", title: "Bull's eye Results")
        initGame()
    }
    
    func initGame() {
        sliderMain.value = 50
        sliderCurrentValue = Int(sliderMain.value.rounded())
        targetValue = Int.random(in: 1...100)
        lblTarget.text = String(targetValue)
    }
    
    func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

