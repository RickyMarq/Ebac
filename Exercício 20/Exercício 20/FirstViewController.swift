//
//  ViewController.swift
//  Exercício 20
//
//  Created by Henrique Marques on 15/04/22.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var themeSwitch: UISwitch!
    
    let defaults = UserDefaults.standard
    
    let nightKeys: String = "isNight"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let isNight = defaults.value(forKey: "isNight") {
            if isNight as! Bool {
                
            }
        }
    }
    
    @IBAction func switchFlipped(sender: Any) {
        if themeSwitch.isOn {
            switchTonight()
            defaults.set(true, forKey: nightKeys)
        } else {
            switchToDay()
            defaults.set(false, forKey: nightKeys)
        }
    }

    func switchTonight() {
        themeSwitch.setOn(true, animated: false)
        overrideUserInterfaceStyle = .dark
    }
    
    func switchToDay() {
        themeSwitch.setOn(false, animated: false)
        overrideUserInterfaceStyle = .light
    }
}
