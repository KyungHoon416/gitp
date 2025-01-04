package com.hoon.haedab

//import android.content.DialogInterface
//import android.view.View
import android.widget.*

import androidx.lifecycle.Observer

import androidx.recyclerview.widget.RecyclerView
import android.widget.TextView
import android.widget.TextView.OnEditorActionListener
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

import android.content.Context
import androidx.recyclerview.widget.LinearLayoutManager
import android.util.Log
import android.view.inputmethod.EditorInfo
import android.view.inputmethod.InputMethodManager

import android.widget.Toast
import com.android.volley.*

import com.android.volley.toolbox.JsonObjectRequest
import com.android.volley.toolbox.Volley
import com.google.android.material.textfield.TextInputEditText
import org.json.JSONObject
import java.net.URL

class chatActivity : AppCompatActivity() {

    private var countUp : Int = 0
    lateinit var queryEdt: TextInputEditText
    lateinit var responseTV: TextView
    lateinit var questionTV: TextView

    var url = "http://api.openai.com/v1/completions"


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_chat)

        responseTV = findViewById(R.id.idTVResponse)
        questionTV = findViewById(R.id.idTVQuestion)
        queryEdt = findViewById(R.id.idEdtQuery)

        Log.d("chatActivity","chatActivity_onCreate")

            queryEdt.setOnEditorActionListener(OnEditorActionListener { v, actionId, event ->
                if (actionId == EditorInfo.IME_ACTION_SEND) {
                    // setting response tv on below line.
                    responseTV.text = "Please wait.."
                    // validating text
                    if (queryEdt.text.toString().length > 0) {
                        // calling get response to get the response.
                        getResponse(queryEdt.text.toString())
                    } else {
                        Toast.makeText(this, "Please enter your query..", Toast.LENGTH_SHORT).show()
                    }
                    return@OnEditorActionListener true
                }
                false
            })
        }
    private fun getResponse(query: String) {
        Log.d("chatActivity", "getResponse : $query")
        // setting text on for question on below line.
        questionTV.text = query
        queryEdt.setText("")
        // creating a queue for request queue.
        val queue: RequestQueue = Volley.newRequestQueue(applicationContext)
        // creating a json object on below line.
        val jsonObject: JSONObject? = JSONObject()
        // adding params to json object.
        jsonObject?.put("model", "text-davinci-003")
        jsonObject?.put("prompt", query)
        jsonObject?.put("temperature", 0)
        jsonObject?.put("max_tokens", 100)
        jsonObject?.put("e24", 1)
        jsonObject?.put("frequency_penalty", 0.0)
        jsonObject?.put("presence_penalty", 0.0)

        // on below line making json object request.

        val postRequest: JsonObjectRequest =
            // on below line making json object request.
            object : JsonObjectRequest(Method.POST, url, jsonObject,
                Response.Listener { response ->
                    Log.d("chatActivity", "Response1 : $response")
                    // on below line getting response message and setting it to text view.
                    val responseMsg: String =
                        response.getJSONArray("choices").getJSONObject(0).getString("text")
                    Log.d("chatActivity", "Response.Listener : " + responseMsg )
                    responseTV.text = responseMsg
                },
                // adding on error listener
                Response.ErrorListener { error ->
                    Log.e("TAGAPI", "Error is : " + error.message + "\n" + error)
                }) {
                override fun getHeaders(): kotlin.collections.MutableMap<kotlin.String, kotlin.String> {
                    val params: MutableMap<String, String> = HashMap()
                    // adding headers on below line.
//                   val  Apikey : String =  "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"
                    val  Apikey : String =  "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"
                    params.put("Content-Type", "application/json");
                    params.put("Authorization", Apikey);

                    return params;
                }
            }

        // on below line adding retry policy for our request.
        postRequest.setRetryPolicy(object : RetryPolicy {
            override fun getCurrentTimeout(): Int {
                return 50000
            }

            override fun getCurrentRetryCount(): Int {
                return 50000
            }

            @Throws(VolleyError::class)
            override fun retry(error: VolleyError) {
            }
        })
        // on below line adding our request to queue.
        queue.add(postRequest)
    }
}
