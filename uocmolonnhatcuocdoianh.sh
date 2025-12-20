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
║   █▀█ █░░ █░█ █▀ █▀ █░█ █▀█ ▀█▀ █▀▀ █▀▀ █▀█              ║
║   █▀▀ █▄▄ █▄█ ▄█ ▄█ █▀█ █▄█ ░█░ █▄█ ██▄ █▀▄              ║
║                                                            ║
║   ╭━╮╭━╮╱╱╱╱╭╮╱╱╭╮                                       ║
║   ┃┃╰╯┃┃╱╱╱╱┃┃╱╱┃┃                                       ║
║   ┃╭╮╭╮┣━━┳━╯┣╮╭┫┃╭━━╮                                  ║
║   ┃┃┃┃┃┃╭╮┃╭╮┃┃┃┃┃┃┃━┫                                  ║
║   ┃┃┃┃┃┃╰╯┃╰╯┃╰╯┃╰┫┃━┫                                  ║
║   ╰╯╰╯╰┻━━┻━━┻━━┻━┻━━╯                                  ║
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
 settings put system pointer_speed 7
 settings put system touch_pressure_scale 0.001
 settings put secure long_press_timeout 100               
 settings put secure multi_press_timeout 50               
 settings put secure touch_blocking_period 0.0            
 settings put global debug.hwui.renderer skiavk 
 settings put global debug.egl.hw 1
 settings put global debug.sf.hw 1
 setprop debug.force-opengl 1                             
 setprop debug.hwc.force_gpu_vsync 1
 setprop debug.performance.profile 1                      
 settings put system min_refresh_rate 120.0             
 settings put system peak_refresh_rate 120.0
 setprop debug.refresh_rate.min_fps 120                  
 cmd power set-fixed-performance-mode-enabled true      
 cmd game mode performance com.dts.freefireth            
 cmd game mode performance com.dts.freefiremax                 
 pm trim-caches 999999G
 settings put global cached_apps_freezer enabled          
toiuugame1s() 
{
cmd power set-fixed-performance-mode-enabled true; cmd thermalservice override-status 0; settings put system pointer_speed 7; device_config put game_overlay com.dts.freefiremax mode=2,fps=240,vsync=false,low_latency=true; cmd game mode performance com.dts.freefiremax
}
toiuugame1s >/dev/null 2>&1
toiuugamevip2() 
{
cmd power set-fixed-performance-mode-enabled true
cmd thermalservice override-status 0
settings put system peak_refresh_rate 120
settings put system min_refresh_rate 120
device_config put game_overlay com.dts.freefireth mode=2,skiavk=true,fps=120,vsync=false,low_latency=true
device_config put game_overlay com.dts.freefiremax mode=2,skiavk=true,fps=120,vsync=false,low_latency=true
cmd game mode performance com.dts.freefireth
cmd game mode performance com.dts.freefiremax
settings put system pointer_speed 7
settings put system ro.min.fling_velocity 16000
settings put system ro.max.fling_velocity 16000
setprop debug.sf.early_app_phase_offset_ns -1
setprop debug.sf.early_gl_phase_offset_ns -1
setprop debug.sf.latch_unsignaled 1
setprop debug.hwui.disable_vsync true
setprop debug.sf.disable_backpressure 1
setprop debug.hwui.renderer vulkan
setprop debug.gr.numframebuffers 3
setprop debug.egl.swapinterval 0
cmd package compile -m speed -f com.dts.freefireth
cmd package compile -m speed -f com.dts.freefiremax
setprop log.tag SUPPRESS
}
toiuugamevip2 >/dev/null 2>&1
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
ram
settings put global block_untrusted_touches 0
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
}
touch > /dev/null 2>&1  
echo ""
echo "        ┌───────────────────────────────────────────┐"
echo "        │  ✅  System Information Loaded Successfully │"
echo "        │  🔁  Refresh Rate Hiện Tại: ${refresh_rate}Hz       │"
echo "        └───────────────────────────────────────────┘"
echo ""
echo "──────────────────────────────────────────────────────────────"