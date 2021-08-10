//
//  ViewController.swift
//  jasmeenTest
//
//  Created by Jasmeen Kular on 2021-08-09.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
   

    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.tableView.register(UINib(nibName: "myCell", bundle: nil), forCellReuseIdentifier: "myCell")
//        fetchCategories()
        let api = "https://aqueous-everglades-71468.herokuapp.com/categories"
        AF.request(api, method: .get).responseJSON { response in
            switch(response.result) {
            case .success(_):
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult ?? (Any).self)
                break
            case .failure(_):
                
                break
            }
        }
    }


}

// #pragma mark - Table view data source

//func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
//    return 1
//}
//
//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return 2
//}
//
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    let cellIdentifier = "MyDeviceCell"
//
//    var cell: myCell! = tableView.dequeueReusableCell(
//        withIdentifier: cellIdentifier) as? myCell
//    if cell == nil {
//      cell = UITableViewCell(style: .subtitle,
//                             reuseIdentifier: cellIdentifier) as? myCell
//    }
//
//    cell.textLabel?.text = "Hello World"
//    return cell
//}


extension ViewController {
  func fetchCategories() {
    if !Connectivity.isConnectedToInternet {
        //show error message
        return
    }
    // 1
    let request = AF.request("https://aqueous-everglades-71468.herokuapp.com/categories")
    // 2
    request.responseJSON { (response) in
      print(response)
//        print(response.request)
          print("jas=",response.result)
//          print(response.response)
        
       
        
    }
  }
    
    class Connectivity {
        class var isConnectedToInternet:Bool {
            return NetworkReachabilityManager()?.isReachable ?? false
        }
    }
}
