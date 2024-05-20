//
//  ListViewController.swift
//  Test3
//
//  Created by Thanh Nguyen Viet on 20/05/2024.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listTV: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    var indexArr: Int!
    var object: [ARObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch indexArr {
        case 0:
            object = ARObject.createVNObjects()
        case 1:
            object = ARObject.createStatuesObjects()
        case 2:
            object = ARObject.createAccessoriesObjects()
        default:
            object = ARObject.createVNObjects()
        }
        listTV.delegate = self
        listTV.dataSource = self
        listTV.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }

    @IBAction func backButtonTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let desVC = segue.destination as! DetailViewController
        let curIndex = listTV.indexPathForSelectedRow!.row
        desVC.object = object[curIndex]
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ARobject = object[indexPath.row]
        let cell = listTV.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        cell.objectImageView.image = UIImage(named: ARobject.image)
        cell.titleLabel.text = ARobject.name
        cell.locationLabel.text = ARobject.location
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ListToDetail", sender: self)
//        tableView.
    }
    
}
