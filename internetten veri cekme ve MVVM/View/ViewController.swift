//
//  ViewController.swift
//  internetten veri cekme ve MVVM
//
//  Created by Mert AKBAŞ on 31.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-İOSDataSet/master/dataset.json") // verilerin çekileceği url yi belirledik
        Webservice().HaberleriIndir(url: url!) { (haberler) in
            if let haberler = haberler {
                print(haberler)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        return cell
    }


}

