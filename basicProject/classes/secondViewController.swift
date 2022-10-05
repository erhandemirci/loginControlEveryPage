//
//  secondViewController.swift
//  basicProject
//
//  Created by erhan demirci on 5.10.2022.
//

import UIKit

class secondViewController: UIViewController {

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
