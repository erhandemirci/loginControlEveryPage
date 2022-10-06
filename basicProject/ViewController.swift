//
//  ViewController.swift
//  basicProject
//
//  Created by erhan demirci on 5.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func logoutClicked(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "status")
               Switcher.updateRootVC()
    }
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu()
        // Do any additional setup after loading the view.
    }
    func  sideMenu() {
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 0
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }


}

