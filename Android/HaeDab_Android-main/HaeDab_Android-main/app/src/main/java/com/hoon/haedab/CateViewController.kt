package com.hoon.haedab



import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.ContextMenu
import android.view.ContextMenu.ContextMenuInfo
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.widget.Button
import android.widget.ImageButton
import android.widget.ImageView
import androidx.appcompat.app.AppCompatActivity
import com.google.android.gms.ads.AdRequest
import com.google.android.gms.ads.AdView
import com.google.android.gms.ads.MobileAds


class CateViewController : AppCompatActivity() {
    lateinit var mAdView : AdView
    lateinit var imageView: ImageButton
    lateinit var btn_group_127: ImageButton
    lateinit var btn_backbtn: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        setContentView(binding.root)
        setContentView(R.layout.activity_cate_view_controller)
        MobileAds.initialize(this) {}
        val adView = AdView(this)

        imageView = findViewById(R.id.group_248);
        btn_group_127 = findViewById(R.id.korBtn)
        btn_backbtn = findViewById(R.id.backBtn)


        mAdView = findViewById(R.id.ad_view)
        val adRequest = AdRequest.Builder().build()
        mAdView.loadAd(adRequest)

        val pref = getSharedPreferences("Language",0)
        val editor = pref.edit()

        val value1 = pref.getString("Language","")
        println("CateViewController_value1 :" +value1)
        if (value1 == "한국어"){
            Log.d("KorViewController","한국어")
            imageView.setImageResource(R.drawable.group_248)
            btn_group_127.setImageResource(R.drawable.kor)
            editor.putString("Language","한국어").apply()
            adView.adUnitId = "ca-app-pub-3940256099942544/6300978111" //테스트 광고
//            adView.adUnitId = "ca-app-pub-7837892529291145/2055010590" //실제 광고
        }else {
            Log.d("KorViewController","영어")
            imageView.setImageResource(R.drawable.group_250)
            btn_group_127.setImageResource(R.drawable.english)
            editor.putString("Language","영어").apply()
            adView.adUnitId = "ca-app-pub-3940256099942544/6300978111" //테스트 광고
//            adView.adUnitId = "ca-app-pub-7837892529291145/5925154602" //실제 광고
        }

        registerForContextMenu(btn_group_127)

        imageView.setOnClickListener {
            val nextIntent = Intent(this, chatActivity::class.java)
            startActivity(nextIntent)
//            setContentView(R.layout.activity_chat)
        }

        btn_backbtn.setOnClickListener{
            val nextIntent = Intent(this, KorViewController::class.java)
            startActivity(nextIntent)
        }



    }

    override fun onCreateContextMenu(menu: ContextMenu?, v: View?, menuInfo: ContextMenuInfo?) {
        super.onCreateContextMenu(menu, v, menuInfo)
        val m1 : MenuInflater = menuInflater
        m1.inflate(R.menu.menu_main,menu)

    }

    override fun onContextItemSelected(item: MenuItem): Boolean {
        println("CateViewController_onContextItemSelected:"+item.itemId)
        val pref = getSharedPreferences("Language",0)
        val editor = pref.edit()
        val adView = AdView(this)
        when(item.itemId){
            R.id.action_menu1 -> {
                imageView.setImageResource(R.drawable.group_248)
                btn_group_127.setImageResource(R.drawable.kor)
                editor.putString("Language","한국어").apply()
                adView.adUnitId = "ca-app-pub-3940256099942544/6300978111" //테스트 광고
//            adView.adUnitId = "ca-app-pub-7837892529291145/2055010590" //실제 광고
            }
            R.id.action_menu2 -> {
                imageView.setImageResource(R.drawable.group_250)
                btn_group_127.setImageResource(R.drawable.english)
                editor.putString("Language","영어").apply()
                adView.adUnitId = "ca-app-pub-3940256099942544/6300978111" //테스트 광고
//            adView.adUnitId = "ca-app-pub-7837892529291145/5925154602" //실제 광고
            }
        }

        return super.onContextItemSelected(item)

    }
}

