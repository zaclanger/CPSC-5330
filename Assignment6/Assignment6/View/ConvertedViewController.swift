//
//  ConvertedViewController.swift
//  Assignment6
//
//  Created by Zachary Langer on 6/26/24.
//

import UIKit

class ConvertedViewController: UIViewController {

    @IBOutlet weak var USDLabel: UILabel!
    @IBOutlet weak var CADLabel: UILabel!
    @IBOutlet weak var YenLabel: UILabel!
    @IBOutlet weak var EuroLabel: UILabel!
    @IBOutlet weak var PoundLabel: UILabel!
    
    var amountUSD : Float = 0.0
    var stringUSD = ""
    var amountCAD = ""
    var amountYen = ""
    var amountEuros = ""
    var amountPounds = ""
    var switchCAD = true
    var switchYen = true
    var switchEuro = true
    var switchPounds = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        stringUSD = formatter.string(for: amountUSD)!
        
        USDLabel.text = "USD Amount: $\(stringUSD)"
        if switchCAD {
            CADLabel.text = amountCAD
        } else {
            CADLabel.alpha = 0.0
        }
        if switchYen {
            YenLabel.text = amountYen
        } else {
            YenLabel.alpha = 0.0
        }
        if switchEuro {
            EuroLabel.text = amountEuros
        } else {
            EuroLabel.alpha = 0.0
        }
        if switchPounds {
            PoundLabel.text = amountPounds
        } else {
            PoundLabel.alpha = 0.0
        }
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
