package me.appopen.app_open

import android.content.ActivityNotFoundException
import android.content.Intent
import android.net.Uri
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() , MethodChannel.MethodCallHandler {
    companion object {
        const val CHANNEL_NAME = "AppOpenChannel"
    }

    private lateinit var methodChannel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
        methodChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {


        if (call.method == "sendMail") {
            val email: String? = call.argument<String>("email")
            val name: String? = call.argument<String>("name")
            val message: String? = call.argument<String>("message")

            val success = sendEmail(email = email!!, name = name!!, message = message!!)
            if (success) result.success("Launching email app")
            else result.error("NOTAVAILABLE", "Unable to open email", null)
            return
        }
    }

    private fun sendEmail(name: String, message: String, email: String): Boolean {

        try {
            val intent = Intent(Intent.ACTION_SEND);
            intent.putExtra(Intent.EXTRA_EMAIL, arrayOf(email))
            intent.putExtra(Intent.EXTRA_SUBJECT, "$name-${"AppOpen"}")
            intent.putExtra(Intent.EXTRA_TEXT, message)
            intent.type = "text/html"
            intent.setPackage("com.google.android.gm")
            startActivity(intent)
            return true

        } catch (e: Exception) {  // allow user to choose a different app to send email with
            val selectorIntent = Intent(Intent.ACTION_SENDTO)
            selectorIntent.data = Uri.parse("mailto:")

            val emailIntent = Intent(Intent.ACTION_SEND)
            emailIntent.putExtra(Intent.EXTRA_EMAIL, arrayOf(email))
            emailIntent.putExtra(Intent.EXTRA_SUBJECT, "$name-${" (AppOpen)"}")
            emailIntent.putExtra(Intent.EXTRA_TEXT, message)
            emailIntent.selector = selectorIntent

            return try {
                startActivity(Intent.createChooser(emailIntent, "Send mail..."))
                true
            } catch (ex: ActivityNotFoundException) {
                Toast.makeText(this, "Unable to send mail", Toast.LENGTH_SHORT).show()
                false
            }
        }
    }
}
