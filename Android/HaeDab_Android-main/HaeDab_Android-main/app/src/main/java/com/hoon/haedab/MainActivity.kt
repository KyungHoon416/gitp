package com.hoon.haedab

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.util.Log.*
import androidx.appcompat.app.AppCompatActivity
import android.widget.Button

import com.google.android.gms.ads.AdRequest
import com.google.android.gms.ads.AdView
import com.google.android.gms.ads.MobileAds
import org.intellij.lang.annotations.Language

class MainActivity : AppCompatActivity() {
    lateinit var mAdView : AdView

//    val binding by lazy {ActivityMainBinding.inflate(layoutInflater)}
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)


        setContentView(R.layout.activity_main)
        MobileAds.initialize(this) {}

        val adView = AdView(this)


        adView.adUnitId = "ca-app-pub-3940256099942544/6300978111"



            mAdView = findViewById(R.id.ad_view)
            val adRequest = AdRequest.Builder().build()
            mAdView.loadAd(adRequest)

            val pref = getSharedPreferences("Language",0)
            val editor = pref.edit()
//            pref.getString("MessageKey", "")

        val btn_group_127 : Button = findViewById(R.id.group_127)
        btn_group_127.setOnClickListener {
           Log.d("MainActivity","group_127클릭")
            val nextIntent = Intent(this, KorViewController::class.java)
//            nextIntent.putExtra("Language","한국어")
            editor.putString("Language","한국어").apply()
            startActivity(nextIntent)

        }

        val btn_group_128 : Button = findViewById(R.id.group_128)
        btn_group_128.setOnClickListener {
            Log.d("MainActivity","group_128클릭")
            val nextIntent = Intent(this, KorViewController::class.java)
//        setContentView(R.layout.activity_kor)
//            nextIntent.putExtra("Language","영어")
            editor.putString("Language","영어").apply()
            startActivity(nextIntent)

//            setContentView(R.layout.activity_eng_view_controller)


        }




    }





//    // Called when leaving the activity
//    public override fun onPause() {
////        binding.adView.pause()
//        super.onPause()
//
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
//        mbinding = null
//        super.onDestroy()
//    }
}


