package com.hoon.haedab

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.ImageButton
import android.widget.ImageView
import androidx.appcompat.app.AppCompatActivity
import com.google.android.gms.ads.AdRequest
import com.google.android.gms.ads.AdView
import com.google.android.gms.ads.MobileAds

class KorViewController : AppCompatActivity() {

//    private lateinit var binding: ActivityMainBinding
    lateinit var mAdView : AdView
    lateinit var imageView: ImageView
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_kor_view_controller)

        Log.d("KorViewController","onCreateKor")
        MobileAds.initialize(this) {}


        val pref = getSharedPreferences("Language",0)
        val editor = pref.edit()
        val value1 = pref.getString("Language","")
        val adView = AdView(this)

        println("KorViewController_value1 :" +value1)
        imageView = findViewById(R.id.image_view);
        val btn_button : ImageButton = findViewById(R.id.group_144__1)
        if (value1 == "한국어"){
            Log.d("KorViewController","한국어")
            imageView.setImageResource(R.drawable.group_143__1_)
            btn_button.setImageResource(R.drawable.group_144__1_)
            editor.putString("Language","한국어").apply()
            adView.adUnitId = "ca-app-pub-3940256099942544/6300978111" //테스트 광고
//            adView.adUnitId = "ca-app-pub-7837892529291145/9683500435" //실제 광고

        }else {
            Log.d("KorViewController","영어")
            imageView.setImageResource(R.drawable.group_198)
            btn_button.setImageResource(R.drawable.group_144)
            editor.putString("Language","영어").apply()
            adView.adUnitId = "ca-app-pub-3940256099942544/6300978111" //테스트 광고
//            adView.adUnitId = "ca-app-pub-7837892529291145/9353726740" //테스트 광고
        }

        mAdView = findViewById(R.id.ad_view)
        val adRequest = AdRequest.Builder().build()
        mAdView.loadAd(adRequest)

        btn_button.setOnClickListener {
            val nextIntent = Intent(this, CateViewController::class.java)
//            nextIntent.putExtra($msg,"Language1")
            startActivity(nextIntent)

        }

    }

}
