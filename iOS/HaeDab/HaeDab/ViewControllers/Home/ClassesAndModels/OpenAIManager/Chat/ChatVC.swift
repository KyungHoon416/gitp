//
//  ChatVC.swift
//  OpenAISwift
//
//  Created by Meet Patel on 17/01/2023.
//

import UIKit
import GoogleMobileAds
//GADFullScreenContentDelegate
class ChatVC: UIViewController,GADFullScreenContentDelegate {
    
    
    //popupView
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var admobPopup: UIView!
    @IBOutlet weak var popupimage: UIImageView!
    @IBOutlet weak var popupText: UILabel!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var clostBtn: UIButton!
    
    
    //MARK:  Outlets and Variable Declarations
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tblChat: UITableView!
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var viewSendMessage: UIView!
    @IBOutlet weak var viewSendMessageBottom: NSLayoutConstraint!
    @IBOutlet weak var btnSendMessage: UIButton!
    
    var loaded : Bool = false
    var buttoncount : Int = 0
    var text : String = ""
    /// The interstitial ad.
    var interstitial: GADInterstitialAd?
    var rewadAd: GADRewardedAd?
    
//    private struct ChatGPT {
//
//        let question: String
//        let answer: String
//    }
    
    private struct ChatGPT {
        
        let questionAnswer: String
        let isSend: Bool
    }
    
    private var arrOfQuestionAnswer = [ChatGPT]()
    
    //MARK: 
    override func viewDidLoad() {
        super.viewDidLoad()
        if text == "1" {
            txtMessage.attributedPlaceholder = NSAttributedString(string: "여기에 글쓰세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])

        }else {
//
            txtMessage.attributedPlaceholder = NSAttributedString(string: "Write a message", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        }
        initWithObjects()
    }
    
    fileprivate func loadInterstitial() {
        var Adpub : String
        var AdpubTest : String

        switch buttoncount {
        case 1 :
            // 테스트 광고
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/4539457725"
        case 2 :
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/4200546372"
        case 3 :
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/4619618279"
        case 4 :
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/3259818032"
        case 5 :
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/9769386066"
        case 6 :
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/4217676485"
        case 7 :
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/9386242689"
        case 8 :
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/5513628048"
        case 9 :
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/2265466416"
        case 10 :
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/9616794085"
        default:
            AdpubTest = "ca-app-pub-3940256099942544/1033173712"
            Adpub = "ca-app-pub-2566854643827259/4539457725"
        }
        
        
      let request = GADRequest()
//      GADInterstitialAd.load(
//        withAdUnitID: AdpubTest, request: request
//      ) { (ad, error) in
//        if let error = error {
//          print("Failed to load interstitial ad with error: \(error.localizedDescription)")
//          return
//        }
//        self.interstitial = ad
////          self.interstitial?.
//        self.interstitial?.fullScreenContentDelegate = self
//      }
//        let request = GADRequest()
        print("Ad wasn't request : \(request)")
        
            GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                                        request: request,
                              completionHandler: { [self] ad, error in
                if let error = error {
                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                    return
                }
                
                print("Ad wasn't adaccessibilityViewIsModal : \(ad?.accessibilityViewIsModal)")
                
                loaded = true
                                interstitial = ad
                                interstitial?.fullScreenContentDelegate = self
                
                              }
            )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.popupView.isHidden = true
//        self.backgroundView.isHidden = true
                        loadInterstitial()
        
        
    }
    
    func popupview() {
        
        
        buttoncount += 1
//
        
        
//        if 4...10 ~= buttoncount{
//
//
//
//            self.clostBtn.isHidden = true
//            self.popupimage.image = UIImage(named: "Group_264")
//
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
              // 1초 후 실행될 부분
//        let vc = AdMobViewController()
      
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "AdMobViewController") as? AdMobViewController else { return }
////                // 화면 전환 애니메이션 설정
                secondViewController.modalTransitionStyle = .coverVertical
////                // 전환된 화면이 보여지는 방법 설정 (fullScreen)
        secondViewController.modalPresentationStyle = .pageSheet
                self.present(secondViewController, animated: true, completion: nil)
//        self.loadInterstitial()
//        showInterstitial(viewController: secondViewController)
//        self.interstitial?.present(fromRootViewController:secondViewController)
//        if interstitial != nil {
//            self.interstitial!.present(fromRootViewController: self)
//          } else {
//            print("Ad wasn't ready")
//          }
//        try! self.interstitial?.canPresent(fromRootViewController: self)

        
             
                
//            }
            
        
//            }else if buttoncount > 13{
//                buttoncount = 4
//
//            }
//        self.okBtn.addTarget(self, action: #selector(okAction(_:)), for: .touchUpInside)
//        self.clostBtn.addTarget(self, action: #selector(closeAction(_:)), for: .touchUpInside)
        
        
    }
    
//    @objc func okAction (_ sender : UIButton){
////        self.interstitial?.present(fromRootViewController: self)
//    }
//    @objc func closeAction (_ sender : UIButton){
//        self.popupView.isHidden = true
//        self.backgroundView.isHidden = true
//
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:  Buttons Clicked Action
    @IBAction func btnBackClicked(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSendClicked(_ sender: UIButton) {
        
        self.view.endEditing(true)
        
        if !(txtMessage.isempty()) {
            popupview()

            self.showHud()
            self.sendMessage(question: self.txtMessage.text?.trime() ?? "", isSend: true)
            
            OpenAIManager.shared.processPrompt(prompt: self.txtMessage.text?.trime() ?? "") { reponse in
                
                // Clear TextView
                self.txtMessage.text = ""
                self.hideHud()
                self.sendMessage(question: reponse.trime(), isSend: false)
            }
        } else {

            self.showAlertWithOkButton(message: "Please type a message to continue.")
        }
    }
    
    //MARK:  Functions
    @objc private func initWithObjects() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.viewSendMessage.setCornerRaius(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radious: 8)
    }
    
    private func sendMessage(question: String, isSend: Bool) {
        
        self.arrOfQuestionAnswer.append(ChatGPT(questionAnswer: question, isSend: isSend))
        self.reloadTable()
        
        self.btnSendMessage.isEnabled = false
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        
        if let userInfo = (sender as NSNotification).userInfo {
            if let _ = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height {
                self.viewSendMessageBottom.constant =  16
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        
        if let userInfo = (sender as NSNotification).userInfo {
            if let keyboardHeight = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height {
                self.view.layoutIfNeeded()
                if #available(iOS 11.0, *) {
                    self.viewSendMessageBottom.constant = (keyboardHeight - (APPDEL.window?.safeAreaInsets.bottom ?? 0) - -16)
                    DispatchQueue.main.async {
                        self.reloadTable()
                    }
                } else {
                    self.viewSendMessageBottom.constant = (keyboardHeight - 0)
                    tblChat.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
                
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    private func reloadTable() {
        
        self.tblChat.reloadData()
        if self.arrOfQuestionAnswer.count > 0 {
//            self.imageView.isHidden = true
            self.tblChat.scrollToRow(at: IndexPath(row: arrOfQuestionAnswer.count - 1, section: 0), at: .bottom, animated: true)
        }else {

        }
    }
    
     func showInterstitial(viewController: AdMobViewController?) {
        guard loaded, let controller = viewController else {
            loadInterstitial()
            return
        }
         print("controller : \(controller)")
        interstitial?.present(fromRootViewController: controller)
        
    }
    
    // MARK: - GADFullScreenContentDelegate

    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad will present full screen content.")

    }

    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error)
    {
      print("Ad failed to present full screen content with error \(error.localizedDescription).")
    }

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad did dismiss full screen content.")
        loaded = false
        loadInterstitial()
    }
}



//MARK:  UITableViewDelegate Methods
extension ChatVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK:  UITableViewDataSource Methods
extension ChatVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrOfQuestionAnswer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //indexPath.row % 2 == 0
        if self.arrOfQuestionAnswer[indexPath.row].isSend == true {
            
            //Outgoing
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatOutgoingTextTableViewCell") as! ChatOutgoingTextTableViewCell
            
            let question = arrOfQuestionAnswer[indexPath.row].questionAnswer
            let currentTime = Date.getCurrentDateTime(format: "h:mm a")
            cell.configureCell(message: question, time: currentTime)
            
            return cell
        } else {
            
            //Incoming
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatIncomingTextTableViewCell") as! ChatIncomingTextTableViewCell
            
            let answer = arrOfQuestionAnswer[indexPath.row].questionAnswer
            let currentTime = Date.getCurrentDateTime(format: "h:mm a")
            cell.configureCell(message: answer, time: currentTime)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        
        guard let indexPath = configuration.identifier as? IndexPath, let cell = tableView.cellForRow(at: indexPath) else {
            return nil
        }
        
        let parameters = UIPreviewParameters()
        parameters.backgroundColor = .clear
        
        return UITargetedPreview(view: cell, parameters: parameters)
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let font = self.arrOfQuestionAnswer[indexPath.row].questionAnswer
        return UIContextMenuConfiguration(identifier: indexPath as NSIndexPath, previewProvider: nil) { _ -> UIMenu? in
            
            let copyAction = UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc"), identifier: nil) { _ in
                
                UIPasteboard.general.string = font
            }
            
            let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { _ in
                
                let textToShare = [font]
                let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view
                activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
                self.present(activityViewController, animated: true, completion: nil)
            }
            
//            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { action in
//
//                self.arrOfQuestionAnswer.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            }
            
            let menu = UIMenu(title: Constant.kAppName, image: nil, identifier: nil, options: [], children: [copyAction, shareAction])
            return menu
        }
    }
    
    func tableView(_ tableView: UITableView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        
        guard let indexPath = configuration.identifier as? IndexPath, let cell = tableView.cellForRow(at: indexPath) else {
            return nil
        }
        
        let parameters = UIPreviewParameters()
        parameters.backgroundColor = .clear
        
        return UITargetedPreview(view: cell, parameters: parameters)
    }
    
    func tableView(_ tableView: UITableView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
        
        animator.addCompletion {
            if let viewController = animator.previewViewController {
                self.show(viewController, sender: self)
            }
        }
    }
    
}

//MARK:  UITextFieldDelegate Methods
extension ChatVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
            
        default:
            
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let updatedText = textField.getUpadatedText(string: string, range: range)
        
        switch textField {
        case txtMessage:
            
            let isEnabled = updatedText == "" ? false:true
            self.btnSendMessage.isEnabled = isEnabled
            
        default:
            break
        }
        
        return true
    }
}




