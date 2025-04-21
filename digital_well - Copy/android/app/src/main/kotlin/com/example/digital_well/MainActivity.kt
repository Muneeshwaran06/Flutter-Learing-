package com.example.digital_well

import android.app.usage.UsageStats
import android.app.usage.UsageStatsManager
import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.*

class MainActivity: FlutterActivity() {
    private val CHANNEL = "digital_wellbeing"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getUsageStats") {
                val usageStats = getUsageStats()
                result.success(usageStats)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getUsageStats(): Map<String, Int> {
        val usageStatsManager = getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val endTime = System.currentTimeMillis()
        val startTime = endTime - 1000 * 60 * 60 * 24 // last 24 hours

        val stats = usageStatsManager.queryUsageStats(
            UsageStatsManager.INTERVAL_DAILY,
            startTime,
            endTime
        )

        val usageMap = mutableMapOf<String, Int>()
        for (usage in stats) {
            val timeInForeground = usage.totalTimeInForeground.toInt()
            if (timeInForeground > 0) {
                usageMap[usage.packageName] = timeInForeground
            }
        }
        return usageMap
    }
}
