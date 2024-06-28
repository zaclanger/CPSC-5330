//
//  ViewController.swift
//  Assignment6
//
//  Created by Zachary Langer on 6/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var USDAmount: UITextField!
    @IBOutlet weak var COne: UISwitch!
    @IBOutlet weak var CTwo: UISwitch!
    @IBOutlet weak var CThree: UISwitch!
    @IBOutlet weak var CFour: UISwitch!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var errorMessage: UILabel!
    
    var converterLogic = ConverterLogic()
    
    var stringUSD = ""
    var intUSD : Int? = 0
    var convertedCAD = ""
    var convertedYen = ""
    var convertedEuros = ""
    var convertedPounds = ""
    var switchCAD = true
    var switchYen = true
    var switchEuro = true
    var switchPounds = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func switchCAD(_ sender: UISwitch) {
        switchCAD = sender.isOn
    }
    
    @IBAction func switchYen(_ sender: UISwitch) {
        switchYen = sender.isOn
    }
    
    @IBAction func switchEuros(_ sender: UISwitch) {
        switchEuro = sender.isOn
    }
    
    @IBAction func switchPounds(_ sender: UISwitch) {
        switchPounds = sender.isOn
    }
    
    @IBAction func convert(_ sender: UIButton) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        stringUSD = USDAmount.text!
        intUSD = Int(stringUSD)
        
        if intUSD == nil {
            errorMessage.alpha = 1.0
            return
        } else {
            errorMessage.alpha = 0.0
        }
        
        convertedCAD = converterLogic.convertCAD(intUSD!)
        convertedYen = converterLogic.convertYen(intUSD!)
        convertedEuros = converterLogic.convertEuros(intUSD!)
        convertedPounds = converterLogic.convertPounds(intUSD!)
        
        self.performSegue(withIdentifier: "toConvertedAmounts", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConvertedAmounts" {
            let navigation = segue.destination as! ConvertedViewController
            navigation.amountUSD = intUSD!
            navigation.amountCAD = convertedCAD
            navigation.amountYen = convertedYen
            navigation.amountEuros = convertedEuros
            navigation.amountPounds = convertedPounds
            navigation.switchCAD = switchCAD
            navigation.switchYen = switchYen
            navigation.switchEuro = switchEuro
            navigation.switchPounds = switchPounds
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
}

