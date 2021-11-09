//
//  HelpVC.swift
//  CarHailer
//
//  Created by Nikunj on 05/12/20.
//  Copyright © 2020 Nikunj M. All rights reserved.
//

import UIKit

class HelpVC: SideBaseViewController {

        var objData = NSArray()
        @IBOutlet weak var tblView: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
             tblView.tableFooterView = UIView()
    //        NetworkManager().fetchFilms { (films) in
    //            print(films)
    ////             self.films = films
    //             DispatchQueue.main.async{
    ////               self.tableView.reloadData()
    //             }
    //           }
            // Do any additional setup after loading the view.
            getDataFromServer()
        }
        func getDataFromServer(){
            
            callWebservice1(URL: URL_FAQ, httpMethod: .get, Params:nil, completion: { ( response : [String: Any]) in
                           print("API response => ",response)
                let a : NSArray = response["Data"] as! NSArray
                self.objData = a[0] as! NSArray
                self.tblView.reloadData()
                print("API response => ",self.objData)
                       }) { (error) in
                           print(error.localizedDescription)
                       }
     
        }
        

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }

    //MARK:- UITableViewDataSource Methods
    extension HelpVC: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return objData.count
        }
         
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
            let cell :PrivacyPolicyCell = tableView.dequeueReusableCell(withIdentifier: "PrivacyPolicyCell") as! PrivacyPolicyCell
            cell.showDataInCell(objDic: (self.objData[indexPath.row] as? [String: Any])!)
    //        cell.lblTitle?.text = leftMenu[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
    }

    //MARK:- UITableViewDelegate Methods
    extension HelpVC: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return UIView()
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 0
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
           
           
        }
        
       
    }
