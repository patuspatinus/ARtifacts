//
//  HomeViewController.swift
//  Test3
//
//  Created by Thanh Nguyen Viet on 20/05/2024.
//

import UIKit

class HomeViewController: UIViewController {

    let names = ["VN Artifacts", "Huy", "Duc", "Tung", "Exit"]
    
    @IBOutlet weak var homeTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTV.delegate = self
        homeTV.dataSource = self
        homeTV.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let desVC = segue.destination as! ListViewController
        desVC.indexArr = homeTV.indexPathForSelectedRow!.row
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
//        cell.indexLabel.text = String(indexPath.row)
        cell.nameLabel.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "HomeToList", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
