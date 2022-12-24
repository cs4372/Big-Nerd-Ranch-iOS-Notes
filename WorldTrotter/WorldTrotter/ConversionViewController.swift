//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Catherine Shing on 12/23/22.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ConversionViewController loaded its view.")
        updateCelsiusLabel()
    }

    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
    return nf
    }()
    
    var fahrenheitValue: Measurement<UnitTemperature>? { didSet {
            updateCelsiusLabel()
        }
    }
    
    @IBAction func fehrenheitEditingChanges(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
            fahrenheitValue = nil
        }
    }
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text =
                       numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.contains(".")
        let replacementTextHasDecimalSeparator = string.contains(".")
        let alphaChars = NSCharacterSet.letters
        let hasAlphaChar = string.rangeOfCharacter(from: alphaChars)
        if (hasAlphaChar != nil) { return false }
        return !(existingTextHasDecimalSeparator == true && replacementTextHasDecimalSeparator == true)
    }
}
