//
//  ChatsTableViewCell.swift
//  Message App
//
//  Created by Christopher on 11/11/23.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelFriend: UILabel!
    var labelMessage: UILabel!
    var labelDateTime: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelFriend()
        setupLabelMessage()
        setupLabelDateTime()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelFriend(){
        labelFriend = UILabel()
        labelFriend.font = UIFont.boldSystemFont(ofSize: 20)
        labelFriend.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelFriend)
    }
    
    func setupLabelMessage(){
        labelMessage = UILabel()
        labelMessage.font = UIFont.boldSystemFont(ofSize: 14)
        labelMessage.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelMessage)
    }
    
    func setupLabelDateTime(){
        labelDateTime = UILabel()
        labelDateTime.font = UIFont.boldSystemFont(ofSize: 14)
        labelDateTime.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDateTime)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelFriend.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelFriend.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelFriend.heightAnchor.constraint(equalToConstant: 20),
            labelFriend.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelDateTime.topAnchor.constraint(equalTo: labelFriend.bottomAnchor, constant: 2),
            labelDateTime.leadingAnchor.constraint(equalTo: labelFriend.leadingAnchor),
            labelDateTime.heightAnchor.constraint(equalToConstant: 16),
            labelDateTime.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelMessage.topAnchor.constraint(equalTo: labelDateTime.bottomAnchor, constant: 2),
            labelMessage.leadingAnchor.constraint(equalTo: labelFriend.leadingAnchor),
            labelMessage.heightAnchor.constraint(equalToConstant: 16),
            labelMessage.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),

            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 72)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
