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
    @IBOutlet weak var txtScore: UILabel!
    @IBOutlet weak var txtRounds: UILabel!

    var sliderCurrentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var rounds = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }


    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundedValue = sender.value.rounded()
        sliderCurrentValue = Int(roundedValue);
    }
    
    
    @IBAction func btnGoTouchUpInside(_ sender: Any) {
        let differenceValue = validateWin(currentValue: targetValue , sliderValue: sliderCurrentValue)
        var points = 100 - differenceValue
        score += points
        let title: String
        if differenceValue == 0 {
            title = "Perfect!"
            points += 100
        } else if differenceValue < 5 {
            title = "You almost had it!"
            points += 50
        } else if differenceValue < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        showAlert(message: "You Scored \(points) points.", title: title )
        
    }
    
    func showAlert(message: String, title: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.initGame()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func updateTexts() {
        lblTarget.text = String(targetValue)
        txtScore.text = String(score)
        txtRounds.text = String(rounds)
    }
    
    func initGame() {
        sliderMain.value = 50
        sliderCurrentValue = Int(sliderMain.value.rounded())
        targetValue = Int.random(in: 1...100)
        rounds += 1
        updateTexts()
    }
    
    
    func validateWin(currentValue: Int, sliderValue: Int) -> Int {
        let differenceValue: Int = abs(currentValue - sliderValue)
        return differenceValue
        
    }
    
    @IBAction func btnRestartGame(_ sender: Any) {
        startNewGame()
    }
    
    func startNewGame() {
        score = 0
        rounds = 0
        initGame()
    }
}

