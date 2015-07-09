/*
* Copyright (c) 2014 Christian Schabesberger
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

package org.pwf.groupgame;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.AdListener;

import android.content.Intent;
import android.util.Log;
import android.provider.Settings.Secure;
import android.provider.*;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Bundle;

import android.view.View;
import android.view.ViewGroup;
import android.view.Gravity;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.util.DisplayMetrics;

import org.qtproject.qt5.android.bindings.QtActivity;
import org.qtproject.qt5.android.QtNative;

public class MyActivity extends QtActivity {

    // record the compass picture angle turned
    final static private String msgTag = "MyActivity";

    private static ViewGroup viewGroup;
    private AdView mAdView;
    private boolean adAdded = false;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        mAdView = new AdView(this);
        mAdView.setAdUnitId("ca-app-pub-2194768264406542/3994528914");
        mAdView.setAdSize(AdSize.BANNER);
        View view = getWindow().getDecorView().getRootView();
        if (view instanceof ViewGroup) {
            float dp = getResources().getDisplayMetrics().density;
            viewGroup = (ViewGroup) view;
            ViewGroup.LayoutParams ad_layout_params = new ViewGroup.LayoutParams(ViewGroup.LayoutParams.FILL_PARENT, (int)(100*dp));

            mAdView.setLayoutParams(ad_layout_params);
            mAdView.setAdListener(new AdListener() {
                public void onAdLoaded(){
                    if (adAdded)
                        return;
                    adAdded = true;
                    viewGroup.addView(mAdView);
                }
            });
            AdRequest adRequest = new AdRequest.Builder()
            //.addTestDevice(AdRequest.DEVICE_ID_EMULATOR)
            //.addTestDevice("INSERT_YOUR_HASHED_DEVICE_ID_HERE")
            .build();
            mAdView.loadAd(adRequest);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        mAdView.resume();
    }

    @Override
    protected void onPause() {
        mAdView.pause();
        super.onPause();
    }
    @Override
    public void onDestroy() {
      mAdView.destroy();
      super.onDestroy();
    }
}
