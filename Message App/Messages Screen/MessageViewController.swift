import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
 
class MessageViewController: UIViewController {
    let messageScreen = MessageView()
    var messages = [Message]()
    var userChatting:String?
    var currentUser:String?
    let database = Firestore.firestore()
    
    override func loadView() {
        view = messageScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
        self.database.collection("users")
            .document(currentUser!)
            .collection("chats")
            .document(userChatting!)
            .collection("messages")
        .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
            if let documents = querySnapshot?.documents{
                self.messages.removeAll()
                for document in documents{
                    do{
                        let message = try document.data(as: Message.self)
                        self.messages.append(message)
                    }catch{
                        print(error)
                    }
                }
                self.messages.sort(by: {$0.dateTime < $1.dateTime})
                self.messageScreen.tableViewMessages.reloadData()
                self.scrollToBottom()
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
        title = userChatting

        navigationController?.navigationBar.prefersLargeTitles = true
        //MARK: patching table view delegate and data source...
        messageScreen.tableViewMessages.delegate = self
        messageScreen.tableViewMessages.dataSource = self
        
        //MARK: removing the separator line...
        messageScreen.tableViewMessages.separatorStyle = .none
        messageScreen.sendButton.addTarget(self, action: #selector(onSendButtonTapped), for: .touchUpInside)
        messageScreen.tableViewMessages.reloadData()
    }
    
    func scrollToBottom() {
        let numberOfSections = messageScreen.tableViewMessages.numberOfSections
        let numberOfRows = messageScreen.tableViewMessages.numberOfRows(inSection: numberOfSections - 1)
        if numberOfRows > 0 {
            let indexPath = IndexPath(row: numberOfRows - 1, section: numberOfSections - 1)
            messageScreen.tableViewMessages.scrollToRow(
                at: indexPath, at: .bottom, animated: true)
        }
    }
    
// Controller for the user's specific chat with someone
    //MARK: on add button tapped....
    @objc func onSendButtonTapped(){
        if let message = messageScreen.messageTextField.text {
            if message != "" {
                self.addMessageDocumentForChat(message: message, userChatting: self.userChatting!, currentUser: self.currentUser!)
                messageScreen.messageTextField.text = ""
                messageScreen.tableViewMessages.reloadData()

                scrollToBottom()
            }
        }
    }
}
 
extension MessageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewMessagesID, for: indexPath) as! MessageTableViewCell
        //MARK: need to determine if last or first message is the most recent->
        cell.isSender = messages[indexPath.row].isSender
        if cell.isSender {
            cell.wrapperReceivedCellView.isHidden = true
            cell.wrapperSentCellView.isHidden = false
            cell.labelSent.text = messages[indexPath.row].text
        } else {
            cell.wrapperReceivedCellView.isHidden = false
            cell.wrapperSentCellView.isHidden = true
            cell.labelReceived.text = messages[indexPath.row].text
        }
        return cell
    }
}
