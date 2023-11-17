//
//  MessageTableViewCell.swift
//  Message App
//
//  Created by Christopher on 11/14/23.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    var wrapperReceivedCellView: UIView!
    var wrapperSentCellView: UIView!
    var isSender: Bool!
    var labelReceived: UILabel!
    var labelSent: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperReceivedCellView()
        setupWrapperSentCellView()
        setupLabelReceived()
        setupLabelSent()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperReceivedCellView(){
        wrapperReceivedCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperReceivedCellView.backgroundColor = .white
        wrapperReceivedCellView.layer.cornerRadius = 6.0
        wrapperReceivedCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperReceivedCellView.layer.shadowOffset = .zero
        wrapperReceivedCellView.layer.shadowRadius = 4.0
        wrapperReceivedCellView.layer.shadowOpacity = 0.4
        wrapperReceivedCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperReceivedCellView)
    }
    func setupWrapperSentCellView(){
        wrapperSentCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperSentCellView.backgroundColor = .systemBlue
        wrapperSentCellView.layer.cornerRadius = 6.0
        wrapperSentCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperSentCellView.layer.shadowOffset = .zero
        wrapperSentCellView.layer.shadowRadius = 4.0
        wrapperSentCellView.layer.shadowOpacity = 0.4
        wrapperSentCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperSentCellView)
    }
    
    func setupLabelReceived(){
        labelReceived = UILabel()
        labelReceived.textAlignment = .center
        labelReceived.font = UIFont.boldSystemFont(ofSize: 16)
        labelReceived.adjustsFontSizeToFitWidth = true
        labelReceived.translatesAutoresizingMaskIntoConstraints = false
        wrapperReceivedCellView.addSubview(labelReceived)
    }
    
    func setupLabelSent() {
        labelSent = UILabel()
        labelSent.textAlignment = .center
        labelSent.font = UIFont.boldSystemFont(ofSize: 16)
        labelSent.textColor = .white
        labelSent.adjustsFontSizeToFitWidth = true
        labelSent.translatesAutoresizingMaskIntoConstraints = false
        wrapperSentCellView.addSubview(labelSent)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperReceivedCellView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            wrapperReceivedCellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            wrapperReceivedCellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            wrapperReceivedCellView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -48),
            wrapperReceivedCellView.heightAnchor.constraint(equalToConstant: 24),

            wrapperSentCellView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            wrapperSentCellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            wrapperSentCellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            wrapperSentCellView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -48),
            wrapperSentCellView.heightAnchor.constraint(equalToConstant: 24),

            labelReceived.topAnchor.constraint(equalTo: wrapperReceivedCellView.topAnchor, constant: 5),
            labelReceived.leadingAnchor.constraint(equalTo: wrapperReceivedCellView.leadingAnchor, constant: 5),
            labelReceived.widthAnchor.constraint(lessThanOrEqualTo: wrapperReceivedCellView.widthAnchor),
            labelReceived.heightAnchor.constraint(lessThanOrEqualTo: wrapperReceivedCellView.heightAnchor),

            labelSent.topAnchor.constraint(equalTo: wrapperSentCellView.topAnchor, constant: 5),
            labelSent.leadingAnchor.constraint(equalTo: wrapperSentCellView.leadingAnchor, constant: 5),
            labelSent.widthAnchor.constraint(lessThanOrEqualTo: wrapperSentCellView.widthAnchor),
            labelSent.heightAnchor.constraint(lessThanOrEqualTo: wrapperSentCellView.heightAnchor),
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
