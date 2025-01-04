package com.hoon.haedab
import android.view.*
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.widget.Button
import com.google.android.gms.ads.AdRequest
import com.google.android.gms.ads.AdView
import com.google.android.gms.ads.MobileAds


class EngViewController : AppCompatActivity() {
    lateinit var mAdView : AdView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_eng_view_controller)
        Log.d("EngViewController","onCreate")
        MobileAds.initialize(this) {}

        val adView = AdView(this)
//

        adView.adUnitId = "ca-app-pub-3940256099942544/6300978111"

//            MobileAds.initialize(this) {}

        mAdView = findViewById(R.id.ad_view)
        val adRequest = AdRequest.Builder().build()
        mAdView.loadAd(adRequest)




        val btn_group_144 : Button = findViewById(R.id.group_144)
        btn_group_144.setOnClickListener {
            Log.d("EngViewController","group_144 클릭")
//            startActivity(intent)
            setContentView(R.layout.activity_cate_view_controller)
        }

    }





//    // Called when leaving the activity
//    public override fun onPause() {
//        binding.adView.pause()
//        super.onPause()
//    }
//
//    // Called when returning to the activity
//    public override fun onResume() {
//        super.onResume()
//        binding.adView.resume()
//
//
//    }
//
//    // Called before the activity is destroyed
//    public override fun onDestroy() {
//        binding.adView.destroy()
//        super.onDestroy()
//    }

}