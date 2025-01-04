//
//  AdMobViewController.swift
//  HaeDab
//
//  Created by Salted on 2023/03/04.
//

import UIKit
import GoogleMobileAds
import WebKit

class AdMobViewController: UIViewController,GADFullScreenContentDelegate {
    
    
    var interstitial: GADInterstitialAd?
    
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterstitial()
        let url = URL(string: "https://www.naver.com/")
               let request = URLRequest(url: url!)
        
        self.webview.load(request)
        // Do any additional setup after loading the view.
    }
    
    func loadInterstitial() {
        let request = GADRequest()
        GADInterstitialAd.load(
          withAdUnitID: "ca-app-pub-3940256099942544/1033173712", request: request
        ) { [self] (ad, error) in
              if let error = error {

                return
             }
            self.interstitial = ad
//            logger.debug("Loaded Ad Mob interstitial view")
//            loaded = true
            self.interstitial?.fullScreenContentDelegate = self
            showInterstitial(viewController: self)
        }
      }
    

    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad will present full screen content.")

    }

    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error)
    {
      print("Ad failed to present full screen content with error \(error.localizedDescription).")
    }

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad did dismiss full screen content.")
//        loaded = false
        loadInterstitial()
        self.dismiss(animated: true)
    }
    
    func showInterstitial(viewController: AdMobViewController?) {
       guard let controller = viewController else {
           loadInterstitial()
           return
       }
        print("controller : \(controller)")
       interstitial?.present(fromRootViewController: controller)
       
   }

}

//extension AdMobViewController: GADFullScreenContentDelegate {
//    /// Tells the delegate that the ad failed to present full screen content.
//        func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
//            print("Ad did fail to present full screen content.")
//        }
//
//        /// Tells the delegate that the ad presented full screen content.
////        func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
////            print("Ad did present full screen content.")
////        }
//
//        /// Tells the delegate that the ad dismissed full screen content.
//        func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
//            print("Ad did dismiss full screen content.")
//        }
//}
