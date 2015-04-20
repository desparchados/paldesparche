//
//  ViewController.swift
//  Paldesparche
//
//  Created by Juan Esteban Alvarez on 7/04/15.
//  Copyright (c) 2015 desparchados. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    let items:[String] = ["Perfil","Panes","Subscripciones","Intereses","Configuración"]

    @IBOutlet var userName: UILabel!
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if(isLoggedIn != 1) {
            self.performSegueWithIdentifier("goto_login", sender: self)
        } else {
            self.userName.text = prefs.valueForKey("USERNAME") as? String
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }


}

