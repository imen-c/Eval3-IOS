//
//  DetailViewController.swift
//  Eval3
//
//  Created by Student04 on 12/08/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController {
    

    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var prixUsd: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var detailList = [Detail]()
    var nomDetail : Coin?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let decoder = JSONDecoder()
        setupTableView()
        self.nom.text = nomDetail?.name
        self.prixUsd.text = nomDetail?.priceUsd
        if let url = URL(string: "https://api.coincap.io/v2/assets/bitcoin/history?interval=d1"){
            AF.request(url).response{ dataResponse in
                let source = try! decoder.decode(SourceDetail.self, from: dataResponse.data!)
                switch dataResponse.result{
                case .success(var data):
                    for item in source.data{
                        self.detailList.append(Detail(priceUsd: item.priceUsd, time: item.time, date: item.date))
                    }
                    self.tableView.reloadData()
                case .failure(var data):
                    print("impossible de se connecter aux données")
                }
            }
        }
        

        // Do any additional setup after loading the view.
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
    }
    

}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath ) as! DetailTableViewCell
        
        detailTableViewCell.prix.text = detailList[indexPath.row].priceUsd
        detailTableViewCell.dateCell.text = detailList[indexPath.row].date
        return detailTableViewCell
    }
    
    
    
    
    
}
