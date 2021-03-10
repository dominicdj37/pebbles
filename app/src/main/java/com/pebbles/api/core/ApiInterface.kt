package com.pebbles.api.core

import com.google.gson.JsonElement
import com.google.gson.JsonObject
import com.pebbles.api.model.ResponseModel
import io.reactivex.Completable
import io.reactivex.Observable
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.http.*


interface ApiInterface {

    @Headers(
        "Accept: application/json",
        "Content-Type: application/json"
    )
    @GET("settingss.json")
    fun getSettings(): Observable<ResponseModel>

}