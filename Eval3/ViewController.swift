//
//  ViewController.swift
//  Eval3
//
//  Created by Student04 on 12/08/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
   
    @IBOutlet weak var segmented: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
 
    var coinList = [Coin]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        let decoder = JSONDecoder()
        if let url = URL(string: "https://api.coincap.io/v2/assets"){
            AF.request(url).response{ dataResponse in
               // switch dataResponse.result{
               // case .success(var data):
                    let source = try! decoder.decode(Source.self, from: dataResponse.data!)
                switch dataResponse.result{
                case .success(var data):
                //self.test.text = source.data[0].name
                    for item in source.data {
                        self.coinList.append(Coin(id: item.id, rank: item.rank, name: item.name, priceUsd: item.priceUsd , changePercent24Hr: item.changePercent24Hr, explorer: item.explorer))
                   //     self.coinList.append(contentsOf: source.data)
                    //    print (self.coinList.count)
                   }
                    
                    self.tableView.reloadData()
                case .failure(var data):
                   print("impossible de se connecter aux données")
            }
               
            }
            tableView.reloadData()
        }
        
    }
    
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PriceTableViewCell", bundle: nil), forCellReuseIdentifier: "PriceTableViewCell")
    }
    


}
extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let priceTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PriceTableViewCell", for: indexPath ) as! PriceTableViewCell
    
        priceTableViewCell.clipsToBounds = true
        
        priceTableViewCell.nom.text = coinList[indexPath.row].name
        priceTableViewCell.pourcent.text = coinList[indexPath.row].changePercent24Hr
        priceTableViewCell.numerotation.text = coinList[indexPath.row].rank
        priceTableViewCell.dollar.text = coinList[indexPath.row].priceUsd
        
        return priceTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        navigationController?.pushViewController(detailViewController, animated: true)
        detailViewController.nomDetail = coinList[indexPath.row]
    }
    
}

