//
//  ViewController.swift
//  Projeto_Final_Samuel
//
//  Created by COTEMIG on 01/10/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var selected: Comida?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comidas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = comidas[indexPath.row].name
        cell.detailTextLabel?.text = comidas[indexPath.row].price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comida = comidas[indexPath.row]
        selected = comida
        performSegue(withIdentifier: "detail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let vc = segue.destination as! ComidaViewController
            vc.newComida = selected
        }
    }
    
    var comidas: [Comida] = []
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        getComidas()
    }
    
    func getComidas() {
        let url = URL(string: "http://apisamuel.herokuapp.com/db")!
        URLSession.shared.dataTask(with: url){
            data, res, err in
            if let data = data {
                if let json = try? JSONDecoder().decode(DB.self, from: data) {
                    DispatchQueue.main.async {
                        for comida in json.db {
                            self.comidas.append(comida)
                        }
                        self.tableview.reloadData()
                    }
                }
            }
        }.resume()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

struct DB: Codable {
    var db: [Comida]
}

struct Comida: Codable {
    var id: Int
    var name: String
    var price: String
    var image: String
}
