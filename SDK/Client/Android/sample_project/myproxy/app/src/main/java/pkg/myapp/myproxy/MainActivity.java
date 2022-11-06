package pkg.myapp.myproxy;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import peerproxyClientSdk.PeerproxyClientSdk;

public class MainActivity extends AppCompatActivity {
 private static String TAG = "myproxy";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        runProxy();
        init();
    }

    private void init() {
        findViewById(R.id.btn).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String url = "";
                url = peerproxyClientSdk.PeerproxyClientSdk.getPublicUrl();
                System.out.println("==================>"+url);
                Toast.makeText(MainActivity.this, "==================>"+url, Toast.LENGTH_LONG).show();
                //peerproxyClientSdk.PeerproxyClientSdk.disConnect();
            }
        });
    }

    private void runProxy() {
        new Thread(new Runnable() {
            @Override
            public void run() {
              while (true){
                  Log.d(TAG, "begin backgournd thread");
                  String serverAddr = "conn4.allproxy.io:9082";
                  Boolean enableHttp = true;
                  Boolean enableS5 = true;
                  String androidId = "test_id@111111";
                  String externalInfo = "{}";
                  PeerproxyClientSdk.connectV2(
                          serverAddr,
                          enableHttp,
                          enableS5,
                          androidId,
                          "",
                          "",
                          externalInfo
                  );
                  Log.d(TAG, "connect failed");
                  try {
                      Thread.sleep(1000);
                  } catch (InterruptedException e) {
                      e.printStackTrace();
                  }
              }
            }
        }).start();
    }
}