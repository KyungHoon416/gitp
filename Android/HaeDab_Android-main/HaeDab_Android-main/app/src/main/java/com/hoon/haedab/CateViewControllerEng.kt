package com.hoon.haedab

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import com.google.android.gms.ads.AdRequest
import com.google.android.gms.ads.AdView
import com.google.android.gms.ads.MobileAds

class CateViewControllerEng : AppCompatActivity() {
    lateinit var mAdView : AdView
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_cate_view_controller_eng)
        MobileAds.initialize(this) {}

        val adView = AdView(this)
//

//        adView.adUnitId = "ca-app-pub-3940256099942544/6300978111"
//
//
//        mAdView = findViewById(R.id.ad_view)
//        val adRequest = AdRequest.Builder().build()
//        mAdView.loadAd(adRequest)


    }
}