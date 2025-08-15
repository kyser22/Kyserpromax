#!/system/bin/sh

# Script metadata
dev="kysertweaks"
version="v1"
module_name="toiuufaifai"
status="No Root"

# Thu thập thông tin hệ thống
brand=$(getprop ro.product.brand)
android=$(getprop ro.build.version.release)
bit=$(getprop ro.product.cpu.abi | grep -o "64" || echo "32")
cores=$(nproc --all)
kb_ram=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
gb_ram=$(echo "scale=2; $kb_ram / 1048576" | bc)
ram_info=$(awk '/MemTotal|MemAvailable/ {if (NR==1) total=$2; if (NR==2) available=$2} END {if (available=="") available=0; printf "%.2f / %.2f GB", available/1024/1024, total/1024/1024}' /proc/meminfo)
storage=$(df /data | awk 'NR==2 { total=($2+$3)/1024/1024; used=$3/1024/1024; printf "%.2f / %.0f GB", used, total }')
refresh_rate=$(dumpsys SurfaceFlinger | awk '/refresh-rate/ {printf "%d", $3}')
ping=$(ping -c 1 8.8.8.8 | awk -F'time=' '/time=/ {print $2}' | cut -d' ' -f1 || echo "N/A")

# Hiển thị thông tin
echo ""
echo "╭──────────────────────────────────────────────╮"
echo "│                 ⚙️ KyserFaiFai                │"
echo "├──────────────────────────────────────────────┤"
printf "│ 🧑‍💻 𝘿𝙚𝙫       : %-30s │\n" "$dev"
printf "│ 📦 𝙈𝙤𝙙𝙪𝙡𝙚    : %-30s │\n" "$module_name"
printf "│ 🔋 𝙎𝙩𝙖𝙩𝙪𝙨    : %-30s │\n" "$status"
printf "│ 📱 𝘽𝙧𝙖𝙣𝙙     : %-30s │\n" "$brand"
printf "│ 🤖 𝘼𝙣𝙙𝙧𝙤𝙞𝙙   : %-30s │\n" "$android"
printf "│ 🔧 𝘽𝙞𝙩𝘾𝙝𝙚𝙘𝙠  : %-30s │\n" "$bit-bit"
echo "├──────────────────────────────────────────────┤"
echo "│ 🎮 [ GAMING MODE ]    🚿 [ CLEAN CACHE ]       │"
echo "│ 🚀 [ GPU BOOST ]      📈 [ FPS BOOST ]         │"
echo "├──────────────────────────────────────────────┤"
printf "│ 🧠 𝘾𝙋𝙐      : %-30s │\n" "$cores cores"
printf "│ 💾 𝙍𝘼𝙈       : %-30s │\n" "$ram_info"
printf "│ 🗂️ 𝙎𝙩𝙤𝙧𝙖𝙜𝙚  : %-30s │\n" "$storage"
printf "│ 🌐 𝙉𝙚𝙩𝙬𝙤𝙧𝙠  : %-30s │\n" "$ping ms"
printf "│ ⚡ 𝙎𝙘𝙧𝙚𝙚𝙣   : %-30s │\n" "$refresh_rate Hz"
echo "╰──────────────────────────────────────────────╯"
echo "⏳ Installing... Please wait 🌪️"

# Hàm tối ưu hóa hệ thống
system_optimize() {
    settings put global animator_duration_scale 0.0
    settings put global window_animation_scale 0.0
    settings put global transition_animation_scale 0.0
    settings put global development_settings_enabled 1
    settings put global adb_enabled 0
    settings put global adaptive_battery_management_enabled 0
    setprop ro.sys.fw.bg_apps_limit 10
    setprop debug.performance.tuning 1
    setprop debug.system_debugging 0
    setprop debug.systemui_optimization 1
    settings put global notification_bubbles_enabled 0
    setprop debug.low_power_apps 1
    setprop debug.sf.disable_overlays 1
    setprop debug.input_dispatcher 1
    settings put secure location_mode 0
    setprop debug.fast_boot 1
    setprop debug.performance_mode 1
    setprop debug.memory_leak_detection 0
    setprop dalvik.vm.heapgrowthlimit 256m
    setprop dalvik.vm.large-heap 1
    setprop dalvik.vm.large-dalvik-cache 1
    setprop debug.bg_app_killing 0
    setprop debug.memory_compression 1
    setprop debug.memory_debugging 0
    setprop dalvik.vm.image-dex2oat-filter quicken
    settings put global wifi_scan_always_enabled 0
    settings put global device_idle_constants inactive_to=25000
    setprop debug.thermal_throttling 0
    setprop debug.system_caching 1
}

# Hàm tối ưu hóa GPU
gpu_optimize() {
    setprop debug.sf.hw 1
    setprop debug.sf.no_vsync 1
    setprop debug.egl.hw 1
    settings put global graphics_quality low
    setprop debug.sf.disable_post_processing 1
    setprop debug.sf.enable_adpf_cpu_hint 1
    settings put global texture_quality low
    settings put global shadow_quality disable
    setprop debug.gr.swapinterval 0
    setprop debug.sf.enable_hwc_vds 1
    setprop debug.egl.anti_aliasing 0
    settings put global shader_quality low
    setprop debug.sf.low_latency_mode 1
    setprop debug.egl.tessellation 0
    setprop debug.sf.cache_compiled_layouts 1
    settings put global draw_distance short
    settings put global ambient_occlusion low
    setprop debug.sf.enable_streaming 1
    setprop debug.egl.hdr 0
    settings put global reflection_quality low
    setprop debug.egl.lens_flare 0
    setprop debug.sf.optimize_render_target 1
    setprop debug.sf.dynamic_weather 0
    setprop debug.sf.texture_atlas 1
    setprop debug.egl.anisotropic_filtering low
    setprop debug.egl.chromatic_aberration 0
    setprop debug.sf.model_compression Draco
    setprop debug.sf.intensive_gpu_effects 0
    setprop debug.gpu_performance_mode 1
    setprop debug.gpu_logging 0
}

# Hàm tối ưu hóa mạng
network_optimize() {
    setprop net.tcp.delack 0
    setprop net.dns1 8.8.8.8
    setprop net.dns2 8.8.4.4
    setprop debug.network_debugging 0
    setprop debug.network_performance 1
    setprop debug.network_throttling 0
    setprop wifi.performance_mode 1
    setprop debug.network_low_latency 1
    setprop debug.network_logging 0
    setprop debug.network_caching 1
    setprop debug.network_gaming_mode 1
    setprop net.ipv6.conf.all.disable_ipv6 1
    setprop debug.network_acceleration 1
    setprop net.core.rmem_max 524288
    setprop net.ipv4.tcp_congestion_control cubic
    setprop debug.network_telemetry 0
    setprop debug.network_fast_mode 1
    settings put global wifi_scan_interval 180
    settings put global background_data 0
    setprop debug.network_priority 1
}

# Hàm tối ưu Free Fire (com.dts.freefireth)
freefire_optimize() {
    cmd device_config put game_package com.dts.freefireth mode=performance
    cmd device_config put game_package com.dts.freefireth fps_limit=90
    settings put system predownload_ui_enable "[{\"pkgName\":\"com.dts.freefireth\",\"predownload\":true}]"
    cmd package compile -m speed -f com.dts.freefireth
    cmd package compile -m quicken -f com.dts.freefireth
    cmd package compile -m quicken -f com.dts.freefireth texture-quality=low
    cmd package compile -m quicken -f com.dts.freefireth disable-vsync
    cmd package compile -m quicken -f com.dts.freefireth shadow-quality=smooth
    cmd package compile -m quicken -f com.dts.freefireth frame-rate-level=3
    cmd package compile -m quicken -f com.dts.freefireth disable-ambient-sound
    cmd package compile -m quicken -f com.dts.freefireth reduce-lighting-quality=low
    cmd package compile -m quicken -f com.dts.freefireth draw-distance=short
    cmd package compile -m quicken -f com.dts.freefireth disable-hdr
    cmd package compile -m quicken -f com.dts.freefireth shader-quality=low
    cmd package compile -m quicken -f com.dts.freefireth disable-anti-aliasing
    cmd package compile -m quicken -f com.dts.freefireth object-detail=low
    cmd package compile -m quicken -f com.dts.freefireth disable-depth-of-field
    cmd package compile -m quicken -f com.dts.freefireth ambient-occlusion=low
    cmd package compile -m quicken -f com.dts.freefireth disable-tessellation
    cmd package compile -m quicken -f com.dts.freefireth foliage-quality=low
    cmd package compile -m quicken -f com.dts.freefireth animation-quality=low
    cmd package compile -m quicken -f com.dts.freefireth disable-chromatic-aberration
    cmd package compile -m quicken -f com.dts.freefireth optimize-render-target=optimize
    cmd package compile -m quicken -f com.dts.freefireth disable-dynamic-weather
    cmd package compile -m quicken -f com.dts.freefireth remove-logging
    cmd package compile -m quicken -f com.dts.freefireth reduce-shadow-quality=high
    cmd package compile -m quicken -f com.dts.freefireth disable-filtering
    cmd package compile -m quicken -f com.dts.freefireth disable-blur
    cmd package compile -m quicken -f com.dts.freefireth reduce-image-quality=high
    cmd package compile -m quicken -f com.dts.freefireth no-opt
    cmd package compile -m quicken -f com.dts.freefireth define-strip-debug-symbols
    cmd package compile -m quicken -f com.dts.freefireth use-prenormalized-normals
    cmd package compile -m quicken -f com.dts.freefireth model-compression=multicore-art
    cmd package compile -m quicken -f com.dts.freefireth resource-compression
    cmd package compile -m quicken -f com.dts.freefireth linear-alloc
    cmd package compile -m quicken -f com.dts.freefireth extract-startup
    cmd package compile -m quicken -f com.dts.freefireth position-independent
    cmd package compile -m quicken -f com.dts.freefireth virtual-abis
    cmd package compile -m quicken -f com.dts.freefireth secondary-dex
    cmd package compile -m quicken -f com.dts.freefireth storage-caching
    cmd package compile -m quicken -f com.dts.freefireth zygote
    cmd package compile -m quicken -f com.dts.freefireth compiler-filter-summary=speed
    cmd package compile -m quicken -f com.dts.freefireth incremental=full
    cmd package compile -m quicken -f com.dts.freefireth avoid-hard-coded-indexes
    cmd package compile -m quicken -f com.dts.freefireth force-jumbo
    cmd package compile -m quicken -f com.dts.freefireth thin-apk
    cmd package compile -m quicken -f com.dts.freefireth cache-compiled-layouts
    cmd package compile -m quicken -f com.dts.freefireth peak-texture
    cmd package compile -m quicken -f com.dts.freefireth water-quality=low
    cmd package compile -m quicken -f com.dts.freefireth max-object=low
    cmd package compile -m quicken -f com.dts.freefireth post-processing-quality=low
    cmd package compile -m quicken -f com.dts.freefireth compiler-backend=optimize
    cmd package compile -m quicken -f com.dts.freefireth anisotropic-filtering=low
    cmd package compile -m quicken -f com.dts.freefireth global-illumination=
    cmd package compile -m quicken -f com.dts.freefireth disable-lens-flare
    cmd package compile -m quicken -f com.dts.freefireth snow-quality=
    cmd package compile -m quicken -f com.dts.freefireth reduce-shader-complexity=medium
    cmd package compile -m quicken -f com.dts.freefireth ray-tracing=
    cmd package compile -m quicken -f com.dts.freefireth disable-intensive-gpu-effects
}

# Hàm tối ưu Free Fire Max (com.dts.freefiremax)
freefiremax_optimize() {
    cmd device_config put game_package com.dts.freefiremax mode=performance
    cmd device_config put game_package com.dts.freefiremax fps_limit=90
    settings put system predownload_ui_enable "[{\"pkgName\":\"com.dts.freefiremax\",\"predownload\":true}]"
    cmd package compile -m speed -f com.dts.freefiremax
    cmd package compile -m quicken -f com.dts.freefiremax
    cmd package compile -m quicken -f com.dts.freefiremax texture-quality=low
    cmd package compile -m quicken -f com.dts.freefiremax disable-vsync
    cmd package compile -m quicken -f com.dts.freefiremax shadow-quality=smooth
    cmd package compile -m quicken -f com.dts.freefiremax frame-rate-level=3
    cmd package compile -m quicken -f com.dts.freefiremax disable-ambient-sound
    cmd package compile -m quicken -f com.dts.freefiremax reduce-lighting-quality=low
    cmd package compile -m quicken -f com.dts.freefiremax draw-distance=short
    cmd package compile -m quicken -f com.dts.freefiremax disable-hdr
    cmd package compile -m quicken -f com.dts.freefiremax shader-quality=low
    cmd package compile -m quicken -f com.dts.freefiremax disable-anti-aliasing
    cmd package compile -m quicken -f com.dts.freefiremax object-detail=low
    cmd package compile -m quicken -f com.dts.freefiremax disable-depth-of-field
    cmd package compile -m quicken -f com.dts.freefiremax ambient-occlusion=low
    cmd package compile -m quicken -f com.dts.freefiremax disable-tessellation
    cmd package compile -m quicken -f com.dts.freefiremax foliage-quality=low
    cmd package compile -m quicken -f com.dts.freefiremax animation-quality=low
    cmd package compile -m quicken -f com.dts.freefiremax disable-chromatic-aberration
    cmd package compile -m quicken -f com.dts.freefiremax optimize-render-target=optimize
    cmd package compile -m quicken -f com.dts.freefiremax disable-dynamic-weather
    cmd package compile -m quicken -f com.dts.freefiremax remove-logging
    cmd package compile -m quicken -f com.dts.freefiremax reduce-shadow-quality=high
    cmd package compile -m quicken -f com.dts.freefiremax disable-filtering
    cmd package compile -m quicken -f com.dts.freefiremax disable-blur
    cmd package compile -m quicken -f com.dts.freefiremax reduce-image-quality=high
    cmd package compile -m quicken -f com.dts.freefiremax no-opt
    cmd package compile -m quicken -f com.dts.freefiremax define-strip-debug-symbols
    cmd package compile -m quicken -f com.dts.freefiremax use-prenormalized-normals
    cmd package compile -m quicken -f com.dts.freefiremax model-compression=multicore-art
    cmd package compile -m quicken -f com.dts.freefiremax resource-compression
    cmd package compile -m quicken -f com.dts.freefiremax linear-alloc
    cmd package compile -m quicken -f com.dts.freefiremax extract-startup
    cmd package compile -m quicken -f com.dts.freefiremax position-independent
    cmd package compile -m quicken -f com.dts.freefiremax virtual-abis
    cmd package compile -m quicken -f com.dts.freefiremax secondary-dex
    cmd package compile -m quicken -f com.dts.freefiremax storage-caching
    cmd package compile -m quicken -f com.dts.freefiremax zygote
    cmd package compile -m quicken -f com.dts.freefiremax compiler-filter-summary=speed
    cmd package compile -m quicken -f com.dts.freefiremax incremental=full
    cmd package compile -m quicken -f com.dts.freefiremax avoid-hard-coded-indexes
    cmd package compile -m quicken -f com.dts.freefiremax force-jumbo
    cmd package compile -m quicken -f com.dts.freefiremax thin-apk
    cmd package compile -m quicken -f com.dts.freefiremax cache-compiled-layouts
    cmd package compile -m quicken -f com.dts.freefiremax peak-texture
    cmd package compile -m quicken -f com.dts.freefiremax water-quality=low
    cmd package compile -m quicken -f com.dts.freefiremax max-object=low
    cmd package compile -m quicken -f com.dts.freefiremax post-processing-quality=low
    cmd package compile -m quicken -f com.dts.freefiremax compiler-backend=optimize
    cmd package compile -m quicken -f com.dts.freefiremax anisotropic-filtering=low
    cmd package compile -m quicken -f com.dts.freefiremax global-illumination=
    cmd package compile -m quicken -f com.dts.freefiremax disable-lens-flare
    cmd package compile -m quicken -f com.dts.freefiremax snow-quality=
    cmd package compile -m quicken -f com.dts.freefiremax reduce-shader-complexity=medium
    cmd package compile -m quicken -f com.dts.freefiremax ray-tracing=
    cmd package compile -m quicken -f com.dts.freefiremax disable-intensive-gpu-effects
}

# Hàm tắt logging hệ thống
disable_logging() {
    setprop log.tag.SQLiteQueryBuilder S
    setprop log.tag.FuseDaemon S
    setprop log.tag.GAv4 S
    setprop log.tag.CAM2PORT_ S
    setprop log.tag.FragmentManager S
    setprop log.tag.libfuse S
    setprop log.tag.AndroidRuntime S
    setprop log.tag.PackageManager S
    setprop log.tag.ActivityManager S
    setprop log.tag.WindowManager S
    setprop log.tag.AudioManager S
    setprop log.tag.InputMethodManager S
    setprop log.tag.BluetoothManager S
    setprop log.tag.NetworkManagement S
    setprop log.tag.ConnectivityManager S
    setprop log.tag.WifiManager S
    setprop log.tag.TelephonyManager S
    setprop log.tag.LocationManager S
    setprop log.tag.SensorManager S
    setprop log.tag.PowerManager S
    setprop log.tag.SurfaceFlinger S
    setprop log.tag.MediaPlayer S
    setprop log.tag.AudioPolicyManager S
    setprop log.tag.InputManager S
    setprop log.tag.AccountManager S
    setprop log.tag.DevicePolicyManager S
    setprop log.tag.WallpaperManager S
    setprop log.tag.BatteryManager S
    setprop log.tag.ContentManager S
    setprop log.tag.GraphicsStats S
    setprop log.tag.JobScheduler S
    setprop log.tag.UsbManager S
    setprop log.tag.VpnManager S
    setprop log.tag.NotificationManager S
    setprop log.tag.AlarmManager S
    setprop log.tag.ClipboardManager S
    setprop log.tag.InputDispatcher S
    setprop log.tag.NetworkStats S
    setprop log.tag.BackupManager S
    setprop log.tag.KeyguardManager S
    setprop log.tag.DeviceIdleController S
    setprop log.tag.ActivityTaskManager S
    setprop log.tag.DisplayManager S
    setprop log.tag.UsbHostManager S
    setprop log.tag.AppOps S
    setprop log.tag.HardwarePropertiesManager S
    setprop log.tag.StorageManager S
    setprop log.tag.ServiceManager S
    setprop log.tag.DockObserver S
    setprop log.tag.PersistentDataBlockManager S
    setprop log.tag.NetworkTimeUpdateService S
    setprop log.tag.ThermalManager S
    setprop log.tag.PrintManager S
    setprop log.tag.NetworkPolicy S
    setprop log.tag.BluetoothAdapter S
    setprop log.tag.BluetoothSocket S
    setprop log.tag.BluetoothDevice S
    setprop log.tag.MediaRouter S
    setprop log.tag.MediaSession S
}

# Hàm chính gọi các hàm tối ưu
main() {
    system_optimize
    gpu_optimize
    network_optimize
    freefire_optimize
    freefiremax_optimize
    disable_logging
}

# Gọi hàm chính
main > /dev/null 2>&1
echo "Done"