//
//  loginVC.swift
//  basicProject
//
//  Created by erhan demirci on 6.10.2022.
//

import UIKit

class loginVC: UIViewController {

    @IBAction func loginBtnClicked(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "status")
                Switcher.updateRootVC()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red

        // Do any additional setup after loading the view.
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
