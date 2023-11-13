//
//  ChatMessageCell.swift
//  Message App
//
//  Created by Yige Sun on 2023/11/13.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    // MARK: - UI Components
    private let messageLabel = UILabel()
    private let nameLabel = UILabel()
    private let timeLabel = UILabel()
    private let messageBackgroundView = UIView()

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Subviews
    private func setupSubviews() {
        // Message Label
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byWordWrapping

        // Name Label (optional, can be removed if not needed)
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.textColor = .darkGray

        // Time Label
        timeLabel.font = UIFont.systemFont(ofSize: 10)
        timeLabel.textColor = .lightGray

        // Message Background View
        messageBackgroundView.layer.cornerRadius = 12
        messageBackgroundView.clipsToBounds = true

        // Adding subviews
        contentView.addSubview(nameLabel)
        contentView.addSubview(messageBackgroundView)
        messageBackgroundView.addSubview(messageLabel)
        contentView.addSubview(timeLabel)
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        messageBackgroundView.translatesAutoresizingMaskIntoConstraints = false

        // Constraints for nameLabel, messageLabel, messageBackgroundView, and timeLabel
        // Adjust these constraints as per your design requirements
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

            messageBackgroundView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            messageBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            messageBackgroundView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),

            messageLabel.topAnchor.constraint(equalTo: messageBackgroundView.topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: messageBackgroundView.bottomAnchor, constant: -10),
            messageLabel.leadingAnchor.constraint(equalTo: messageBackgroundView.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: messageBackgroundView.trailingAnchor, constant: -10),

            timeLabel.topAnchor.constraint(equalTo: messageBackgroundView.bottomAnchor, constant: 5),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    // MARK: - Configuration
    func configure(with message: Message) {
        messageLabel.text = message.text
        nameLabel.text = message.text
        timeLabel.text = formatDate(message.dateTime)

        if message.isFromCurrentUser {
            // Style for current user's messages
            messageBackgroundView.backgroundColor = UIColor(white: 0.85, alpha: 1)
            messageLabel.textAlignment = .right
            messageBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        } else {
            // Style for received messages
            messageBackgroundView.backgroundColor = .white
            messageLabel.textAlignment = .left
            messageBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        }
    }

    // MARK: - Helper Method
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a" // Example format: '2:30 PM'
        return formatter.string(from: date)
    }
}
