package cz.netglade.native_fvm_strings

import androidx.annotation.NonNull


import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.EventChannel
import io.flutter.embedding.engine.plugins.FlutterPlugin
import android.content.Context
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall


/** NativeFcmStringsPlugin */
class NativeFcmStringsPlugin: FlutterPlugin, MethodCallHandler {
    private lateinit var applicationContext: Context
    private lateinit var methodChannel: MethodChannel

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
      this.applicationContext = binding.applicationContext
      methodChannel = MethodChannel(binding.binaryMessenger, "native_fcm_strings")
      methodChannel.setMethodCallHandler(this)
  }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {      
        methodChannel.setMethodCallHandler(null)
    }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    if (call.method == "getString") {
        val key = call.arguments as String
                val resId = applicationContext.resources.getIdentifier(key, "string", applicationContext.packageName)
                if (resId != 0) {
                    result.success(applicationContext.getString(resId))
                } else {
                    result.error("NOT_FOUND", "String resource not found", null)
                }
    } else {
      result.notImplemented()
    }
  }
}
