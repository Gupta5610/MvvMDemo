//
//  UserListVC.swift
//  MvvmDemoApp
//
//  Created by ashish on 28/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import UIKit

class UserListVC : UIViewController {

    var userListViewModel : UserListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
            self.userListViewModel = UserListViewModel.init(dataService: DataService.instance)
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.userListViewModel.loadUsers(completion: {
               self.tableView.reloadData()
            })
        }

    
    @IBAction func signOut(_ sender : Any){
        self.userListViewModel.signOut(completion: {
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserListVCtoUserDetailViewVC" {
            let userCellViewModel = sender as! UserCellViewModel
            let destinationVC = segue.destination as! UserDetailVC
            destinationVC.userDetailViewModel = UserDetailViewModel.init(email: userCellViewModel.email!, phoneNumber: userCellViewModel.phoneNumber!)
        }
    }
}

extension UserListVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userListViewModel.userList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell") as? UserTableViewCell
        let userViewModel = self.userListViewModel.userList[indexPath.row]
        cell?.configure(email: userViewModel.email!, phoneNumber: userViewModel.phoneNumber!)
        
        userListViewModel.downloadImageWithName(name: userViewModel.email!) { (data) -> (Void) in
            if data != nil{
                cell?.setImage(image: UIImage(data: data!)!)
              }
        }
        return cell ?? UITableViewCell()
    }
}

extension UserListVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          performSegue(withIdentifier: "UserListVCtoUserDetailViewVC", sender: self.userListViewModel.userList[indexPath.row])
    }
}

extension UserListVC : UserListVCDelegate{
    func updateTableView() {
        self.tableView.reloadData()
    }
}


