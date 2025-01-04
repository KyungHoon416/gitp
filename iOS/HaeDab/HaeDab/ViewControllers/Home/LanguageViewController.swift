//
//  LanguageViewController.swift
//  OpenAISwift
//
//  Created by Salted on 2023/02/18.
//

import UIKit
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

class LanguageViewController: UIViewController {
    

    @IBOutlet weak var bannerView: GADBannerView!
    @IBAction func KorButton(_ sender: UIButton) {
        
        
        self.performSegue(withIdentifier: "LanguageViewController", sender: "1")
    }
    
    @IBAction func EngButton(_ sender: UIButton) {
        
        
        self.performSegue(withIdentifier: "LanguageViewController", sender: "0")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        requestPermission()
//        bannerView.adUnitID = "ca-app-pub-2566854643827259/3981872769"
        bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
//        ca-app-pub-3940256099942544/6300978111
        bannerView.rootViewController = self
        bannerView.load(GADRequest())

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        requestPermission()
    }
    
    func requestPermission() {
            if #available(iOS 14, *) {
                ATTrackingManager.requestTrackingAuthorization { status in
                    switch status {
                    case .authorized:
                        // Tracking authorization dialog was shown
                        // and we are authorized print("Authorized")
                        // Now that we are authorized we can get the IDFA
                        print(ASIdentifierManager.shared().advertisingIdentifier)
//                        Analytics.setAnalyticsCollectionEnabled(true)

                    case .denied:
                        // Tracking authorization dialog was
                        // shown and permission is denied
                        print("Denied")
//                        Analytics.setAnalyticsCollectionEnabled(false)

                    case .notDetermined:
                        // Tracking authorization dialog has not been shown
                        print("Not determined")

                    case .restricted:
                        print("Restricted")

                    @unknown default: print("Unknown")
                    }
                }
            } else {
                // Fallback on earlier versions
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is KorViewController {
            let NextVC = segue.destination as? KorViewController
            NextVC!.text = sender as! String
            
        }
    }
    
    
}
