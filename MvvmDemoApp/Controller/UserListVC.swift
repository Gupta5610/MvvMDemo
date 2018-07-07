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
            self.userListViewModel.loadUsers(completion: {
               self.tableView.reloadData()
            })
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    @IBAction func signOut(_ sender : Any){
        self.userListViewModel.signOut(completion: {
            self.dismiss(animated: true, completion: nil)
        })
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
        return cell!
    }
}
