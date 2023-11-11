//
//  ChatTableViewManager.swift
//  Message App
//
//  Created by Christopher on 11/11/23.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeChats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewContactsID, for: indexPath) as! ChatsTableViewCell
        cell.labelName.text = activeChats[indexPath.row].name
        cell.labelEmail.text = activeChats[indexPath.row].email
        cell.labelPhone.text = "\(activeChats[indexPath.row].phone)"
        return cell
    }
}
