//
//  KorViewController.swift
//  OpenAISwift
//
//  Created by Salted on 2023/02/18.
//

import UIKit
import GoogleMobileAds

class KorViewController: UIViewController {
    
    
    @IBOutlet weak var bannerView: GADBannerView!
    var text : String = ""
//    var text1 : String = UserDefaults.standard.string(forKey: "text")!
    
    @IBAction func NextBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "KorToCate", sender: text)
    }
    @IBOutlet weak var UIImageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CateViewController {
            let NextVC = segue.destination as? CateViewController
            NextVC!.text = text
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear_text : \(text)")
//        print("viewWillAppear_text : \(text1)")
        
        if text == "1" {
                        
            UIImageview.image = UIImage(named: "설명서Depth2-3")

//            bannerView.adUnitID = "ca-app-pub-2566854643827259/8123749016"
            bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
            
        }else {
            UIImageview.image = UIImage(named: "영어_설명서")
//            bannerView.adUnitID = "ca-app-pub-7837892529291145/4016193058"
//            bannerView.adUnitID = "ca-app-pub-2566854643827259/1091436806"
            bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
            
        }
        
//        if text1 == "1" {
//                        
//            UIImageview.image = UIImage(named: "설명서Depth2-3")
//
////            bannerView.adUnitID = "ca-app-pub-2566854643827259/8123749016"
//            bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
//            
//        }else if text1 == "0"{
//            UIImageview.image = UIImage(named: "영어_설명서")
////            bannerView.adUnitID = "ca-app-pub-7837892529291145/4016193058"
////            bannerView.adUnitID = "ca-app-pub-2566854643827259/1091436806"
//            bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
//            
//        }
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        
    }

}
