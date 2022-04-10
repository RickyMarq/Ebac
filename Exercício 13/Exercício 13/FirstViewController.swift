//
//  ViewController.swift
//  Exercício 13
//
//  Created by Henrique Marques on 08/04/22.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   // 1) - Crie uma TableView embedando para dentro de uma ViewController.
    
   // Use UITableViewDelegate e UITableViewDataSource.
    
   // Crie Label como mostramos na aula e uma interação com o clique da celula.
    
   // Crie uma lista ao qual a TableView irá iterar sobre.
    
    
    func NavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "\(self.itens[indexPath.row])"
        return cell
    }
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alerta = UIAlertController(title: "Ativado", message: "O módulo foi ativado", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alerta, animated: true, completion: nil)
    }

    var TableView: UITableView!
    
    let itens = ["✈ Modo avião", "䷇ Wi-Fi", "👨🏽‍💻 Bluetooth", "📳 Rede", "💻 VPN"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        self.TableView = UITableView(frame: self.view.frame)
        self.TableView!.dataSource = self
        NavigationController()
        self.TableView!.delegate = self
        self.TableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.TableView)
        title = "📲 Configurações"
    }
}

