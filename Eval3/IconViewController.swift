//
//  IconViewController.swift
//  Eval3
//
//  Created by Student04 on 12/08/2021.
//

import UIKit
import AlamofireImage
import Alamofire

class IconViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var coinList = [Icoin]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        let decoder = JSONDecoder()
        if let url = URL(string: "https://api.coinstats.app/public/v1/coins?skip=0&limit=50&currency=EUR"){
            AF.request(url).response{ dataResponse in
                switch dataResponse.result{
                case .success(var data):
                    let list = try! decoder.decode(SourceIcon.self, from: dataResponse.data!)
                    
                    for item in list.coins{
                        self.coinList.append(Icoin(name: item.name, icon: item.icon))
                    }
                    self.tableView.reloadData()
                case . failure(var data):
                    print("erreur connexion API")
                }
                
            }
            
           
        }
        
        

    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "IconTableViewCell", bundle: nil), forCellReuseIdentifier: "IconTableViewCell")
    }

}
extension IconViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return coinList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let iconTableViewCell = tableView.dequeueReusableCell(withIdentifier: "IconTableViewCell", for: indexPath) as! IconTableViewCell
        
        iconTableViewCell.nom.text = coinList[indexPath.row].name
        if let imageUrl = coinList[indexPath.row].icon, let url = URL(string: imageUrl){
            iconTableViewCell.iconImage.af.setImage(withURL: url)
        }
       
        
        return iconTableViewCell
    }
    
    
}
