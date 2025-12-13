#!/system/bin/sh
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                    © KyserTweaks System Info               ║"
echo "║════════════════════════════════════════════════════════════║"
echo "║   Date    : $(date +"%d-%m-%Y %H:%M:%S")                  ║"
echo "║   Country : Viet Nam                                       ║"
echo "║   PID     : $$                                             ║"
echo "║   UID     : $(id -u)                                       ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

cat <<'EOF'
╔════════════════════════════════════════════════════════════╗
║                                                            ║
║   ╭━━━┳╮╱╱╱╱╱╱╭╮╱╱╱╱╱╭━╮╱╭╮                              ║
║   ┃╭━━┫┃╱╱╱╱╱╭╯╰╮╱╱╱╱┃┃╰╮┃┃                              ║
║   ┃╰━━┫┃╭━━┳━┻╮╭╋━┳━━┫╭╮╰╯┣━━┳╮╭┳━━╮                  ║
║   ┃╭━━┫┃┃┃━┫╭━┫┃┃╭┫╭╮┃┃╰╮┃┃╭╮┃╰╯┃╭╮┃                  ║
║   ┃╰━━┫╰┫┃━┫╰━┫╰┫┃┃╰╯┃┃╱┃┃┃╰╯┣╮╭┫╭╮┃                  ║
║   ╰━━━┻━┻━━┻━━┻━┻╯╰━━┻╯╱╰━┻━━╯╰╯╰╯╰╯                  ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
EOF

refresh_rate=$(dumpsys SurfaceFlinger 2>/dev/null | grep -m1 "refresh-rate" | awk '{printf("%d",$3)}')
if [ -z "$refresh_rate" ]; then
  refresh_rate=60
fi

brand=$(getprop ro.product.system.brand)
model=$(getprop ro.product.model)
android_ver=$(getprop ro.build.version.release)
kernel=$(uname -r)
ram=$(free -m | awk '/Mem:/ {printf "%.0f MB / %.0f MB", $3, $2}')
storage=$(df /data | awk 'NR==2 { total=($2+$3)/1024/1024; used=$3/1024/1024; printf "%.2f / %.0f GB", used, total }')

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
printf "║  [+] Brand        : %-38s║\n" "$brand"
printf "║  [+] Model        : %-38s║\n" "$model"
printf "║  [+] Android      : %-38s║\n" "$android_ver"
printf "║  [+] Kernel       : %-38s║\n" "$kernel"
printf "║  [+] Refresh Rate : %-38s║\n" "${refresh_rate} Hz"
printf "║  [+] RAM          : %-38s║\n" "$ram"
printf "║  [+] Storage      : %-38s║\n" "$storage"
echo "╚════════════════════════════════════════════════════════════╝"
sf() {
for prop in \
  debug.sf.late.app.duration \
  debug.sf.late.sf.duration \
  debug.sf.early.app.duration \
  debug.sf.early.sf.duration \
  debug.sf.earlyGl.app.duration \
  debug.sf.earlyGl.sf.duration \
  debug.sf.early_app_phase_offset_ns \
  debug.sf.early_gl_app_phase_offset_ns \
  debug.sf.early_gl_phase_offset_ns \
  debug.sf.early_phase_offset_ns \
  debug.sf.enable_advanced_sf_phase_offset \
  debug.sf.high_fps_early_gl_phase_offset_ns \
  debug.sf.high_fps_early_phase_offset_ns \
  debug.sf.high_fps_late_app_phase_offset_ns \
  debug.sf.high_fps_late_sf_phase_offset_ns
do
   value=$(getprop "$prop")
    if [ -n "$value" ] && [[ $value != -* ]]; then
        setprop "$prop" "-$value"
    fi
done
}> /dev/null 2>&1
sf
ram() {
    setprop debug.hwui.texture_cache_size 20480
    setprop debug.hwui.layer_cache_size 20480
    setprop debug.hwui.path_cache_size 20480
    setprop debug.hwui.r_buffer_cache_size 20480
    setprop debug.hwui.gradient_cache_size 20480
    setprop debug.hwui.renderer skiagl
    setprop debug.hwui.skip_empty_damage true
    setprop debug.hwui.use_hint_manager true
    setprop debug.hwui.render_quality high
    setprop debug.hwui.overdraw hide
    setprop debug.hwui.framebuffer_optimization 1
    setprop debug.hwui.low_latency_rendering 1
    setprop debug.hwui.dynamic_framebuffer_scaling 1
}
ram> /dev/null 2>&1
kyser50k() 
{
settings put global block_untrusted_touches 0
settings put global force_gpu_rendering 1
settings put global low_power 0
setprop debug.hwui.use_buffer_age false
setprop debug.hwui.use_partial_update false
settings put global vendor.dfps.enable false
settings put global vendor.display.default_fps 120
settings put global vendor.display.fod_monitor_default_fps 120
settings put global vendor.display.idle_default_fps 120
settings put global vendor.display.video_or_camera_fps.support true
settings put global vendor.fps.switch.defaul true
settings put global vendor.fps.switch.thermal true
settings put global vendor.display.disable_mitigated_fps 1
settings put global vendor.display.enable_dpps_dynamic_fps 0
settings put global auto_sync 0
settings put global ble_scan_always_enabled 0
settings put global wifi_scan_always_enabled 0
settings put global hotword_detection_enabled 0
settings put global activity_starts_logging_enabled 0
settings put global network_recommendations_enabled 0
settings put secure adaptive_sleep 0
settings put secure screensaver_enabled 0
settings put secure send_action_app_error 0
settings put system motion_engine 0
settings put system master_motion 0
settings put system air_motion_engine 0
settings put system air_motion_wake_up 0
settings put system send_security_reports 0
settings put system intelligent_sleep_mode 0
settings put system nearby_scanning_enabled 0
settings put system nearby_scanning_permission_allowed 0
pm disable com.qualcomm.qti.cne
pm disable com.qualcomm.location.XT
cmd thermalservice override-status 0
cmd power set-adaptive-power-saver-enabled false
cmd power set-fixed-performance-mode-enabled true
setprop debug.sf.gpu_freq_indeks 7
settings put global surface_flinger.max_frame_buffer_acquired_buffers 3 
settings put global surface_flinger.use_context_priority true
settings put global surface_flinger.set_touch_timer_ms 0
settings put global surface_flinger.use_content_detection_for_refresh_rate false
settings put global surface_flinger.game_default_frame_rate_override 90
settings put global surface_flinger.enable_frame_rate_override false
setprop debug.performance.tuning 1
settings put global logcat.live disable
settings put global config hw_quickpoweron true
settings put system gsm.lte.ca.support 1
setprop debug.hwui.disable_scissor_opt true
settings put global hwui.texture_cache_size 24
settings put global hwui.texture_cache_flushrate 0.5
settings put global disable_smooth_effect true
setprop debug.composition.type mdp
settings put system sys.composition.type mdp
settings put system gpu_perf_mode 1
settings put system FPSTUNER_SWITCH true
settings put system GPUTUNER_SWITCH true
settings put system CPUTUNER_SWITCH true
settings put system NV_POWERMODE true
setprop debug.gpurend.vsync false
setprop debug.cpurend.vsync false
settings put system hw.accelerated 1
settings put system video.accelerated 1
settings put system game.accelerated 1
settings put system ui.accelerated 1
settings put system enable_hardware_accelerated true
settings put system enable_optimize_refresh_rate true
settings put system lgospd.enable 0
settings put system pcsync.enable 0
settings put system dalvik.hyperthreading true
settings put system dalvik.multithread true
setprop debug.sf.disable_client_composition_cache 1
settings put debug.sf.latch_unsignaled 1
setprop debug.sf.disable_backpressure 1
settings put system use_16bpp_alpha 1
settings put global mtk_perf_fast_start_win1
settings put global mtk_perf_response_time 1
settings put global mtk_perf_simple_start_win 1
setprop debug.mediatek.appgamepq_compress 1
setprop debug.mediatek.disp_decompress 1
setprop debug.mtk_tflite.target_nnapi 29
setprop debug.mtk.aee.feature 1
setprop debug.mediatek.performance 1
setprop debug.mediatek.game_pq_enable 1
setprop debug.mediatek.appgamepq 2
setprop debug.mediatek.high_frame_rate_sf_set_big_core_fps_threshold 120
settings put system user_refresh_rate 120
settings put system min_refresh_rate 120
settings put system peak_refresh_rate 120
settings put system user_refresh_rate infinity
settings get system user_refresh_rate
setprop debug.gfx.early_z 1
setprop debug.hwui.skip_empty_damage true
setprop debug.qctwa.preservebuf 1
setprop debug.qctwa.preservebuf.comp_level 3
setprop debug.qc.hardware 1
setprop debug.qcom.hw_hmp.min_fps -1
setprop debug.qcom.hw_hmp.max_fps -1
setprop debug.qcom.pil.q6_boost q
setprop debug.qcom.render_effect 0
setprop debug.adreno.force_rast 1
setprop debug.adreno.prefer_native_sync 1
setprop debug.adreno.q2d_decompress 1
setprop debug.rs.qcom.use_fast_math 1
setprop debug.rs.qcom.disable_expand 1
setprop debug.sf.hw 1
setprop debug.hwui.shadow.renderer monothic
setprop debug.gfx.driver.1 com.qualcomm.qti.gpudrivers.kona.api30
setprop debug.power_management_mode pref_max
setprop debug.gfx.driver 1
setprop debug.angle.overlay FPS:Vulkan*PipelineCache*
setprop debug.hwui.target_cpu_time_percent 300
setprop debug.hwui.target_gpu_time_percent 300
setprop debug.hwui.use_hint_manager true
setprop debug.multicore.processing 1
setprop debug.fb.rgb565 1
setprop debug.sf.lag_adj 0
setprop debug.sf.showfps 0
setprop debug.hwui.max_frame_time 35.55
setprop debug.sf.disable_backpressure 1
setprop debug.hbm.direct_render_pixmaps 1
setprop debug.hwui.render_compability true
setprop debug.heat_suppression 0
setprop debug.systemuicompilerfilter speed
setprop debug.sensor.hal 0
setprop debug.hwui.render_quality high
setprop debug.sf.gpu_freq_index 7
setprop debug.sf.cpu_freq_index 7
setprop debug.sf.mem_freq_index 7
setprop debug.egl.force_fxaa false
setprop debug.egl.force_taa false
setprop debug.egl.force_msaa false
setprop debug.egl.force_ssaa false
setprop debug.egl.force_smaa false
setprop debug.egl.force_mlaa false
setprop debug.egl.force_txaa false
setprop debug.egl.force_csaa false
setprop debug.hwui.fps_divisor -1
setprop debug.redroid.fps 120
setprop debug.disable_sched_boost true
setprop debug.gpu.cooling.callback_freq_limit false
setprop debug.cpu.cooling.callback_freq_limit false
setprop debug.rs.default-CPU-driver 1
setprop debug.rs.default-CPU-buffer 65536
setprop debug.hwui.use_hint_manager 1
setprop debug.egl.profiler 0
setprop debug.enable.gamed false
setprop debug.qualcomm.sns.daemon 0
setprop debug.qualcomm.sns.libsensor 1
setprop debug.sf.disable_client_composition_cache 1
setprop debug.sf.disable_client_composition_cache 1
setprop debug.sf.disable_hw_vsync true
setprop debug.hwui.disable_vsync true
setprop debug.egl.hw 1
setprop debug.sf.native_mode 1
setprop debug.gralloc.gfx_ubwc_disable 1
setprop debug.video.accelerate.hw 1
cmd looper_stats disable
cmd power set-adaptive-power-saver-enabled false
cmd power set-fixed-performance-mode-enabled true
cmd power set-mode 0
cmd thermalservice override-status 0
dumpsys deviceidle enable
dumpsys deviceidle force-idle
dumpsys deviceidle step deep
}> /dev/null 2>&1
kyser50k
touch() {
settings put secure long_press_timeout 350
settings put secure multi_press_timeout 250
settings put secure key_press_timeout 200
settings put secure double_tap_timeout 150
ettings put system touch.toolSize.isSummed 0
settings put system touch.deviceType touchScreen
settings put system view.scroll_friction 10
settings put system touch.coverage.calibration box
settings put system touch.distance.calibration area
settings put system touch.distance.scale 0
settings put system touch.gestureMode spots
settings put system touch.orientation.calibration interpolated
settings put system touch.orientationAware 1
settings put system touch.pressure.calibration amplitude
settings put system touch.pressure.scale 0.0001
settings put system touch.size.bias 0
settings put system touch.size.calibration geometric
settings put system touch.size.isSummed 0
settings put system touch.size.scale 1
settings put system touch.toolSize.areaScale 22
cmd game set --fps 120 --mode 2 --downscale 1 com.dts.freefiremax
cmd game set --fps 120 --mode 2 --downscale 1 com.dts.freefireth
am set-debug-app --persistent com.dts.freefireth 
am set-debug-app --persistent com.dts.freefiremax 
settings put secure game_mode 1
settings put secure game_auto_temperature 0
settings put global rendering_type 1
settings put global sem_enhanced_cpu_responsiveness 1
}> /dev/null 2>&1
touch
echo "Tất Cả Đã Xong Vào Game Đi Ba😘"