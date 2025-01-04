//
//  CateViewController.swift
//  OpenAISwift
//
//  Created by Salted on 2023/02/18.
//

import UIKit
import GoogleMobileAds



class CateViewController: UIViewController {

    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var pull_down: UIButton!
    var pull_downBool : Bool = false
    @IBAction func Pull_downAction(_ sender: UIButton) {
        if pull_downBool == false {
            pull_downBool = true
            self.table.isHidden = false
        }else {
            pull_downBool = false
            self.table.isHidden = true
        }
        
    }
    @IBOutlet weak var table: UITableView!
    
    var darwer:[String] = ["한국어","English"]
    var text : String = ""
    
    
    @IBOutlet weak var TopImage: UIImageView!
    
    @IBAction func backbutton(_ sender: Any) {
        print("backbutton_text : \(text)")
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBOutlet weak var FourImage: UIImageView!
    @IBOutlet weak var ThridImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.isHidden = true
        self.table.dataSource = self
        self.table.delegate = self
        self.table.translatesAutoresizingMaskIntoConstraints = false
        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell1")
        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell2")
        
        
        if text == "1" {
            
            TopImage.image = UIImage(named: "TopKOR")
            FourImage.image = UIImage(named: "Group 228_Kor")
//            bannerView.adUnitID = "ca-app-pub-2566854643827259/3770119773"
            bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
            
            
        }else {
            TopImage.image = UIImage(named: "TopEng")

            FourImage.image = UIImage(named: "Group 226_Eng")
//            bannerView.adUnitID = "ca-app-pub-2566854643827259/2871422338"
            bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
            
        }
        bannerView.rootViewController = self
        bannerView.load(GADRequest())

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ChatVC {
            let NextVC = segue.destination as? ChatVC
            NextVC!.text = text
            
        }
    }
    
    
    @IBAction func chatViewAction(_ sender: UIButton) {
        print("CateViewController text : \(text)")
        self.performSegue(withIdentifier: "catetochatVC", sender: text)
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
extension CateViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.backgroundColor = .red
        self.table.isHidden = true
        if indexPath.row == 0 {
            text = "1"
//            UserDefaults.standard.set(text, forKey: "text")
            TopImage.image = UIImage(named: "TopKOR")
            TopImage.contentMode = .scaleToFill

            FourImage.image = UIImage(named: "Group 228_Kor")
//            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
            
        }else {
            text = "0"
//            UserDefaults.standard.set(text, forKey: "text")
            TopImage.image = UIImage(named: "TopEng")
            TopImage.contentMode = .scaleToFill

            FourImage.image = UIImage(named: "Group 226_Eng")
            
//            bannerView.adUnitID = "ca-app-pub-7837892529291145/1282218503"
            bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        }
        
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
}
extension CateViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.darwer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
                cell.textLabel?.text = darwer[indexPath.row]
                return cell
        
    }
    
    
}
