//
//  Switcher.swift
//  basicProject
//
//  Created by erhan demirci on 6.10.2022.


import Foundation
import UIKit

class Switcher {
    
    static func updateRootVC(){
        
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
       
            print(status)
        

        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "revealVC") as! myRevealVC
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as! loginVC
        }
        
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        UIApplication.shared.windows.first?.rootViewController = rootVC
        
        
        
        
        //appDelegate.window?.rootViewController = rootVC
        
    }
    
    
}
