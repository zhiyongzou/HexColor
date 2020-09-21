//
//  ViewController.swift
//  IRHexColorDemo
//
//  Created by zzyong on 2020/9/21.
//  Copyright © 2020 zzyong. All rights reserved.
//
// https://stackoverflow.com/questions/33370175/how-do-i-completely-rename-an-xcode-project-i-e-inclusive-of-folders

import UIKit
import HexColor

class ViewController: UIViewController {

    @IBOutlet weak var isARGB: UISwitch!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.placeholder = "000000"
        textField.keyboardType = .asciiCapable
        
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.init(white: 0.9, alpha: 0.9).cgColor
        textView.layer.cornerRadius = 5
        textView.layer.masksToBounds = true
        
        okButton.layer.borderWidth = 1
        okButton.layer.borderColor = UIColor.systemBlue.cgColor
        okButton.layer.cornerRadius = okButton.frame.height * 0.5
        okButton.layer.masksToBounds = true
        
        // setup cache count limit
        HexColor.cacheCountLimit = 200
        
    }

    @IBAction func didClickOkButton(_ sender: UIButton) {
        if let hex = textField.text {
            textView.textColor = .hexColor(hex, type: isARGB.isOn ? .ARGB : .RGBA)
        }
        textField.endEditing(true)
    }

}

