//
//  ViewController.swift
//  Projeto_Final_Samuel
//
//  Created by COTEMIG on 01/10/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit

class ComidaViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var name: UILabel!
    
    var newComida: Comida?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let comida = newComida {
            downloadImage(url: comida.image, iv: img)
            lbl.text = comida.price
            name.text = comida.name
        }
    }
    
    func downloadImage(url: String, iv: UIImageView) {
        let url = URL(string: url)
        URLSession.shared.dataTask(with: url!) {
            data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                iv.image = UIImage(data: data)
            }
        }.resume()
    }
}
