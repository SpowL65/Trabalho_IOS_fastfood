//
//  ViewController.swift
//  Projeto_Final_Samuel
//
//  Created by COTEMIG on 01/10/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBSegueAction func handleLogin(_ coder: NSCoder) -> UIViewController? {
        return TableViewController(coder: coder)
    }
}

