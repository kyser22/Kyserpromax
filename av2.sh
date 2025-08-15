#!/system/bin/sh
echo "✅ Thiết bị được hỗ trợ!"
dev="Kysertweaks"
version="V2"
android=$(getprop ro.build.version.release)
bit=$(getprop ro.product.cpu.abi)
cores=$(nproc)
refresh_rate=$(dumpsys SurfaceFlinger | grep -m1 "refresh-rate" | awk '{printf("%d", $3)}')
brand=$(getprop ro.product.brand)
hardware=$(getprop ro.hardware)

kb_ram=$(grep MemTotal /proc/meminfo | awk '{print $2}')
ram_info=$(grep -E "MemTotal|MemAvailable" /proc/meminfo | \
awk 'NR==1{total=$2} NR==2{available=$2} END{printf "%.2f / %.2f GB", available/1024/1024, total/1024/1024}')

storage=$(df /data | awk 'NR==2 { total=($2+$3)/1024/1024; used=$3/1024/1024; printf "%.2f / %.0f GB", used, total }')

ping=$(ping -c 1 8.8.8.8 | grep 'time=' | awk -F'time=' '{print $2}' | cut -d' ' -f1)
[ -z "$ping" ] && ping="No Connection"

sleep 0.5
echo ""
echo "┌────────────────────────────────────────────┐"
echo "│          ⚙️  ModuleX Aimlock ${version} SYSTEM PATCH         │"
echo "├────────────────────────────────────────────┤"
printf "│ 👤 Dev        : %-32s│
" "$dev"
printf "│ 📦 Module     : %-32s│
" "Demo Booster"
printf "│ 🔋 Root       : %-32s│
" "No Root"
printf "│ 📱 Brand      : %-32s│
" "$brand"
printf "│ 💿 Android    : %-32s│
" "$android"
printf "│ 🧬 ABI        : %-32s│
" "$bit"
printf "│ 🛠️  Hardware   : %-32s│
" "$hardware"
echo "├────────────────────────────────────────────┤"
echo "│ 🚀 [ GAMING MODE ]   [ CLEAN CACHE ]            │"
echo "│ 🎮 [ GPU BOOST ]     [ FPS OPTIMIZE ]           │"
echo "├────────────────────────────────────────────┤"
printf "│ 🧠 CPU Cores : %-32s│
" "$cores cores"
printf "│ 🧠 RAM Info  : %-32s│
" "$ram_info"
printf "│ 💾 Storage   : %-32s│
" "$storage"
printf "│ 🌐 Ping      : %-32s│
" "$ping ms"
printf "│ ⚡ Refresh   : %-32s│
" "$refresh_rate Hz"
echo "└────────────────────────────────────────────┘"
echo ""
echo "⏳ Đang khởi động tối ưu hóa hệ thống, vui lòng chờ... 🌪️"
sm idle-maint run
am idle-maintenance
setprop log.tag.SQLiteQueryBuilder WARN
setprop log.tag.FuseDaemon WARN
setprop log.tag.GAv4 WARN
setprop log.tag.CAM2PORT_ WARN
setprop log.tag.FragmentManager WARN
setprop log.tag.libfuse WARN
setprop log.tag.AndroidRuntime WARN
setprop log.tag.PackageManager WARN
setprop log.tag.ActivityManager WARN
setprop log.tag.WindowManager WARN
setprop log.tag.AudioManager WARN
setprop log.tag.InputMethodManager WARN
setprop log.tag.BluetoothManager WARN
setprop log.tag.NetworkManagement WARN
setprop log.tag.ConnectivityManager WARN
setprop log.tag.WifiManager WARN
setprop log.tag.TelephonyManager WARN
setprop log.tag.LocationManager WARN
setprop log.tag.SensorManager WARN
setprop log.tag.PowerManager WARN
setprop log.tag.SurfaceFlinger WARN
setprop log.tag.MediaPlayer WARN
setprop log.tag.AudioPolicyManager WARN
setprop log.tag.InputManager WARN
setprop log.tag.AccountManager WARN
setprop log.tag.DevicePolicyManager WARN
setprop log.tag.WallpaperManager WARN
setprop log.tag.BatteryManager WARN
setprop log.tag.ContentManager WARN
setprop log.tag.GraphicsStats WARN
setprop log.tag.JobScheduler WARN
setprop log.tag.UsbManager WARN
setprop log.tag.VpnManager WARN
setprop log.tag.NotificationManager WARN
setprop log.tag.AlarmManager WARN
setprop log.tag.ClipboardManager WARN
setprop log.tag.InputDispatcher WARN
setprop log.tag.NetworkStats WARN
setprop log.tag.BackupManager WARN
setprop log.tag.KeyguardManager WARN
setprop log.tag.DeviceIdleController WARN
setprop log.tag.ActivityTaskManager WARN
setprop log.tag.DisplayManager WARN
setprop log.tag.UsbHostManager WARN
setprop log.tag.AppOps WARN
setprop log.tag.HardwarePropertiesManager WARN
setprop log.tag.StorageManager WARN
setprop log.tag.ServiceManager WARN
setprop log.tag.DockObserver WARN
setprop log.tag.PersistentDataBlockManager WARN
setprop log.tag.NetworkTimeUpdateService WARN
setprop log.tag.ThermalManager WARN
setprop log.tag.PrintManager WARN
setprop log.tag.NetworkPolicy WARN
setprop log.tag.BluetoothAdapter WARN
setprop log.tag.BluetoothSocket WARN
setprop log.tag.BluetoothDevice WARN
setprop log.tag.MediaRouter WARN
setprop log.tag.MediaSession WARN
setprop log.tag.LocationProvider WARN
setprop log.tag.ConnectivityService WARN
setprop log.tag.BatteryStatsService WARN
setprop log.tag.ProcessStats WARN
setprop log.tag.PackageInstaller WARN
setprop log.tag.SystemServer WARN
setprop log.tag.HardwareService WARN
setprop log.tag.PowerManagerService WARN
setprop log.tag.InputMethodManagerService WARN
setprop log.tag.StatusBarManagerService WARN
setprop log.tag.NetworkManagementService WARN
setprop log.tag.NetworkPolicyManagerService WARN
setprop log.tag.TelephonyRegistry WARN
setprop log.tag.MountService WARN
setprop log.tag.WindowManagerService WARN
setprop log.tag.DisplayManagerService WARN
setprop log.tag.ActivityManagerService WARN
setprop log.tag.ActivityTaskManagerService WARN
setprop log.tag.AlarmManagerService WARN
setprop log.tag.NotificationManagerService WARN
setprop log.tag.VibratorService WARN
setprop log.tag.ConsumerIrService WARN
setprop log.tag.DevicePolicyManagerService WARN
setprop log.tag.LocationManagerService WARN
setprop log.tag.InputManagerService WARN
setprop log.tag.AudioService WARN
setprop log.tag.MediaPlayerService WARN
setprop log.tag.AudioPolicyService WARN
setprop log.tag.BluetoothService WARN
setprop log.tag.BluetoothGattService WARN
setprop log.tag.BluetoothHidService WARN
setprop log.tag.BluetoothPanService WARN
setprop log.tag.BluetoothMapService WARN
setprop log.tag.BluetoothPbapService WARN
setprop log.tag.BluetoothSapService WARN
log > /dev/null 2>&1  
for a in debug.sf.early.app.duration debug.sf.early.sf.duration debug.sf.earlyGl.app.duration debug.sf.earlyGl.sf.duration debug.sf.earlyGl_app_phase_offset_ns debug.sf.earlyGl_phase_offset_ns debug.sf.early_app_phase_offset_ns debug.sf.early_phase_offset_ns debug.sf.late.app.duration debug.sf.late.sf.duration debug.sf.late_app_phase_offset_ns debug.sf.late_phase_offset_ns;do setprop "$a" 16666666;done;while true;do sleep 1;refresh_rate="$(dumpsys SurfaceFlinger|grep refresh-rate|awk '{print $3}')";sleep 1;duration="$(echo "1000000000/$refresh_rate/3"|bc)";sleep 1;for surface_flinger in $(getprop|grep duration|grep debug.sf|cut -f1 -d]|tr -d [);do setprop "$surface_flinger" "$duration";done;sleep 1;offset="$(echo "1000000000/$refresh_rate/3/2"|bc)";sleep 1;for surface_flinger in $(getprop|grep phase_offset_ns|grep debug.sf|cut -f1 -d]|tr -d [);do setprop "$surface_flinger" "$offset";done;sleep 1;done>/dev/null 2>&1&
pe() {
#Tối ưu HWC:
setprop debug.egl.swapinterval 0
setprop debug.hwc.flattenning_enabled false
setprop debug.hwc.hdr_nbm_enable false
setprop debug.hwc.trace_hint_sessions false
setprop debug.hwc.normalize_hint_session_durations false
setprop debug.hwc.use_rate_limiter true
setprop debug.hwc.test_plan true
setprop debug.hwc.force_gpu 0
setprop debug.hwc.nodirtyregion 0
setprop debug.hwc.winupdate 1
setprop debug.hwc.showfps 0
setprop debug.hwc.dynThreshold 1.5
setprop debug.hwc.bq_count 4
setprop debug.hwc.compose_level 0
setprop debug.hwc.otf 1
setprop debug.hwc.fakevsync 0
setprop debug.hwc.logvsync 0
setprop debug.hwc.asyncdisp 1
setprop debug.hwc.min_sdr_dimming 0
setprop debug.hwc_dump_en 1
setprop debug.hwc.enable_vds_dump 0
setprop debug.hwc.simulate 0
setprop debug.sf.vsp_trace 0
setprop debug.sf.drop_missed_frames 0
setprop debug.egl.trace 0
setprop debug.hwui.skia_tracing_enabled 0
setprop debug.hwui.skia_atrace_enabled 0
setprop debug.hwui.profile 0
setprop debug.display.allow_non_native_refresh_rate_override 1
setprop debug.hwui.skip_empty_damage 1
setprop debug.sf.layer_history_trace 0
setprop debug.sf.enable_gl_callback 0
setprop debug.sf.luma_sampling 1
setprop debug.sf.use_frame_rate_priority 1
setprop debug.sf.vsync_trace_detailed_info 0
setprop debug.sf.showbackground 0
setprop debug.sf.showupdates 0
setprop debug.onetrace.tag 0
setprop debug.atrace.tags.enableflags 0
setprop debug.fdtrack_enable 0
setprop debug.hwui.early_z 1
setprop debug.hwui.capture_skp_frames 0
setprop debug.hwui.trace_skia 0
setprop debug.mdpcomp.logs 0
setprop debug.sf.dump 0
setprop debug.sf.ddms 0
setprop debug.egl.hw 1
setprop debug.sf.hw 1
settings put global activity_manager_constants max_cached_processes 2048  
setprop debug.egl.force_msaa false  
setprop debug.egl.force_fxaa false  
setprop debug.egl.force_taa false  
setprop debug.egl.force_ssaa false  
setprop debug.egl.force_smaa false  
setprop debug.egl.native_scaling false
setprop debug.hwui.disable_vsync true
setprop debug.egl.vsync 0
setprop debug.rs.vsync false
setprop debug.hwui.use_vsync false
setprop debug.hwui.disable_cpu_vsync true
setprop debug.hwui.disable_gpu_vsync true
setprop debug.hwui.vsync 0
setprop debug.hwui.vsync_enabled 0
setprop debug.hwui.disable_vsync_support true
setprop debug.hwui.vsync_support 0
setprop debug.hwui.vsync_support_enabled 0
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
cmd power set-fixed-performance-mode-enabled true
}
pe > /dev/null 2>&1  
touch() {
settings put secure long_press_timeout 350
settings put secure multi_press_timeout 250
settings put secure key_press_timeout 200
settings put secure double_tap_timeout 150
settings put system pointer_speed 7
settings put system touch.pressure.scale 0.001 
settings put system touch.size.calibration diameter 
settings put system touch.size.scale 1 
settings put system touch.size.bias 0 
settings put system touch.size.isSummed 0 
settings put system touch.orientation.calibration none 
settings put system touch.distance.calibration none 
settings put system touch.distance.scale 0 
settings put system touch.coverage.calibration box 
settings put system touch.gestureMode spots 
settings put system MultitouchSettleInterval 1ms 
settings put system MultitouchMinDistance 1px 
settings put system TapInterval 1ms 
settings put system TapSlop 1px
settings put system accelerometer_rotation 1
settings put system multitouch_min_distance 1
settings put system multitouch_settle_interval 1
settings put global touch_latency 1
settings put global touch_response_boost 1
settings put global touch_prediction 1
settings put global touch_slop 4
}
log() {
    prop=(
    "log.tag.stats_log WARN"
    "log.tag.FA WARN"
    "log.tag.AF::MmapTrack WARN"
    "log.tag.AF::OutputTrack WARN"
    "log.tag.AF::PatchRecord WARN"
    "log.tag.AF::PatchTrack WARN"
    "log.tag.AF::RecordHandle WARN"
    "log.tag.AF::RecordTrack WARN"
    "log.tag.AF::Track WARN"
    "log.tag.AF::TrackBase WARN"
    "log.tag.AF::TrackHandle WARN"
    "log.tag.APM-KpiMonitor WARN"
    "log.tag.APM-ServiceJ WARN"
    "log.tag.APM-SessionJ WARN"
    "log.tag.APM-SessionN WARN"
    "log.tag.APM-Subscriber WARN"
    "log.tag.APM::AudioCollections WARN"
    "log.tag.APM::AudioInputDescriptor WARN"
    "log.tag.APM::AudioOutputDescriptor WARN"
    "log.tag.APM::AudioPatch WARN"
    "log.tag.APM::AudioPolicyEngine WARN"
    "log.tag.APM::AudioPolicyEngine::Base WARN"
    "log.tag.APM::AudioPolicyEngine::Config WARN"
    "log.tag.APM::AudioPolicyEngine::ProductStrategy WARN"
    "log.tag.APM::AudioPolicyEngine::VolumeGroup WARN"
    "log.tag.APM::Devices WARN"
    "log.tag.APM::IOProfile WARN"
    "log.tag.APM::Serializer WARN"
    "log.tag.APM::VolumeCurve WARN"
    "log.tag.APM_AudioPolicyManager WARN"
    "log.tag.APM_ClientDescriptor WARN"
    "log.tag.AT WARN"
    "log.tag.AccountManager WARN"
    "log.tag.ActivityManager WARN"
    "log.tag.ActivityManagerService WARN"
    "log.tag.ActivityTaskManager WARN"
    "log.tag.ActivityTaskManagerService WARN"
    "log.tag.AdnRecord WARN"
    "log.tag.AdnRecordCache WARN"
    "log.tag.AdnRecordLoader WARN"
    "log.tag.AirplaneHandler WARN"
    "log.tag.AlarmManager WARN"
    "log.tag.AlarmManagerService WARN"
    "log.tag.AndroidRuntime WARN"
    "log.tag.AppOps WARN"
    "log.tag.AudioAttributes WARN"
    "log.tag.AudioEffect WARN"
    "log.tag.AudioFlinger WARN"
    "log.tag.AudioFlinger::DeviceEffectProxy WARN"
    "log.tag.AudioFlinger::DeviceEffectProxy::ProxyCallback WARN"
    "log.tag.AudioFlinger::EffectBase WARN"
    "log.tag.AudioFlinger::EffectChain WARN"
    "log.tag.AudioFlinger::EffectHandle WARN"
    "log.tag.AudioFlinger::EffectModule WARN"
    "log.tag.AudioFlinger_Threads WARN"
    "log.tag.AudioHwDevice WARN"
    "log.tag.AudioManager WARN"
    "log.tag.AudioPolicy WARN"
    "log.tag.AudioPolicyEffects WARN"
    "log.tag.AudioPolicyIntefaceImpl WARN"
    "log.tag.AudioPolicyManager WARN"
    "log.tag.AudioPolicyService WARN"
    "log.tag.AudioProductStrategy WARN"
    "log.tag.AudioRecord WARN"
    "log.tag.AudioService WARN"
    "log.tag.AudioSystem WARN"
    "log.tag.AudioTrack WARN"
    "log.tag.AudioTrackShared WARN"
    "log.tag.AudioVolumeGroup WARN"
    "log.tag.BackupManager WARN"
    "log.tag.BatteryManager WARN"
    "log.tag.BatteryStatsService WARN"
    "log.tag.BluetoothAdapter WARN"
    "log.tag.BluetoothDevice WARN"
    "log.tag.BluetoothGattService WARN"
    "log.tag.BluetoothHidService WARN"
    "log.tag.BluetoothManager WARN"
    "log.tag.BluetoothMapService WARN"
    "log.tag.BluetoothPanService WARN"
    "log.tag.BluetoothPbapService WARN"
    "log.tag.BluetoothSapService WARN"
    "log.tag.BluetoothService WARN"
    "log.tag.BluetoothSocket WARN"
    "log.tag.BufferQueueDump WARN"
    "log.tag.BufferQueueProducer WARN"
    "log.tag.C2K_AT WARN"
    "log.tag.C2K_ATConfig WARN"
    "log.tag.C2K_RILC WARN"
    "log.tag.CAM2PORT_ WARN"
    "log.tag.CapaSwitch WARN"
    "log.tag.CarrierExpressServiceImpl WARN"
    "log.tag.CarrierExpressServiceImplExt WARN"
    "log.tag.ClipboardManager WARN"
    "log.tag.ConnectivityManager WARN"
    "log.tag.ConnectivityService WARN"
    "log.tag.ConsumerIrService WARN"
    "log.tag.ContentManager WARN"
    "log.tag.CountryDetector WARN"
    "log.tag.DMC-ApmService WARN"
    "log.tag.DMC-Core WARN"
    "log.tag.DMC-DmcService WARN"
    "log.tag.DMC-EventsSubscriber WARN"
    "log.tag.DMC-ReqQManager WARN"
    "log.tag.DMC-SessionManager WARN"
    "log.tag.DMC-TranslatorLoader WARN"
    "log.tag.DMC-TranslatorUtils WARN"
    "log.tag.DSSelector WARN"
    "log.tag.DSSelectorOP01 WARN"
    "log.tag.DSSelectorOP02 WARN"
    "log.tag.DSSelectorOP09 WARN"
    "log.tag.DSSelectorOP18 WARN"
    "log.tag.DSSelectorOm WARN"
    "log.tag.DSSelectorUtil WARN"
    "log.tag.DataDispatcher WARN"
    "log.tag.DeviceIdleController WARN"
    "log.tag.DevicePolicyManager WARN"
    "log.tag.DevicePolicyManagerService WARN"
    "log.tag.DisplayManager WARN"
    "log.tag.DisplayManagerService WARN"
    "log.tag.DockObserver WARN"
    "log.tag.DownloadManager WARN"
    "log.tag.ExternalSimMgr WARN"
    "log.tag.FastCapture WARN"
    "log.tag.FastMixer WARN"
    "log.tag.FastMixerState WARN"
    "log.tag.FastThread WARN"
    "log.tag.FragmentManager WARN"
    "log.tag.FuseDaemon WARN"
    "log.tag.GAv4 WARN"
    "log.tag.GraphicsStats WARN"
    "log.tag.GsmCallTkrHlpr WARN"
    "log.tag.GsmCdmaConn WARN"
    "log.tag.GsmCdmaPhone WARN"
    "log.tag.HardwarePropertiesManager WARN"
    "log.tag.HardwareService WARN"
    "log.tag.IAudioFlinger WARN"
    "log.tag.IMSRILRequest WARN"
    "log.tag.IMS_RILA WARN"
    "log.tag.IccCardProxy WARN"
    "log.tag.IccPhoneBookIM WARN"
    "log.tag.IccProvider WARN"
    "log.tag.ImsApp WARN"
    "log.tag.ImsBaseCommands WARN"
    "log.tag.ImsCall WARN"
    "log.tag.ImsCallProfile WARN"
    "log.tag.ImsCallSession WARN"
    "log.tag.ImsEcbm WARN"
    "log.tag.ImsEcbmProxy WARN"
    "log.tag.ImsManager WARN"
    "log.tag.ImsPhone WARN"
    "log.tag.ImsPhoneBase WARN"
    "log.tag.ImsPhoneCall WARN"
    "log.tag.ImsService WARN"
    "log.tag.ImsVTProvider WARN"
    "log.tag.InputDispatcher WARN"
    "log.tag.InputManager WARN"
    "log.tag.InputManagerService WARN"
    "log.tag.InputMethodManager WARN"
    "log.tag.InputMethodManagerService WARN"
    "log.tag.InterfaceManager WARN"
    "log.tag.IsimFileHandler WARN"
    "log.tag.IsimRecords WARN"
    "log.tag.JobScheduler WARN"
    "log.tag.KeyguardManager WARN"
    "log.tag.LCM-Subscriber WARN"
    "log.tag.LIBC2K_RIL WARN"
    "log.tag.LocationManager WARN"
    "log.tag.LocationManagerService WARN"
    "log.tag.LocationProvider WARN"
    "log.tag.MAPI-CommandProcessor WARN"
    "log.tag.MAPI-MdiRedirector WARN"
    "log.tag.MAPI-MdiRedirectorCtrl WARN"
    "log.tag.MAPI-NetworkSocketConnection WARN"
    "log.tag.MAPI-SocketConnection WARN"
    "log.tag.MAPI-SocketListener WARN"
    "log.tag.MAPI-TranslatorManager WARN"
    "log.tag.MDM-Subscriber WARN"
    "log.tag.MTKSST WARN"
    "log.tag.MTK_APPList WARN"
    "log.tag.MediaPlayer WARN"
    "log.tag.MediaPlayerService WARN"
    "log.tag.MediaRouter WARN"
    "log.tag.MediaSession WARN"
    "log.tag.MipcEventHandler WARN"
    "log.tag.MountService WARN"
    "log.tag.MtkAdnRecord WARN"
    "log.tag.MtkCsimFH WARN"
    "log.tag.MtkEmbmsAdaptor WARN"
    "log.tag.MtkFactory WARN"
    "log.tag.MtkGsmCdmaConn WARN"
    "log.tag.MtkIccCardProxy WARN"
    "log.tag.MtkIccPHBIM WARN"
    "log.tag.MtkIccProvider WARN"
    "log.tag.MtkIccSmsInterfaceManager WARN"
    "log.tag.MtkImsManager WARN"
    "log.tag.MtkImsService WARN"
    "log.tag.MtkIsimFH WARN"
    "log.tag.MtkPhoneNotifr WARN"
    "log.tag.MtkPhoneNumberUtils WARN"
    "log.tag.MtkPhoneSwitcher WARN"
    "log.tag.MtkRecordLoader WARN"
    "log.tag.MtkRuimFH WARN"
    "log.tag.MtkSIMFH WARN"
    "log.tag.MtkSIMRecords WARN"
    "log.tag.MtkSmsCbHeader WARN"
    "log.tag.MtkSmsManager WARN"
    "log.tag.MtkSmsMessage WARN"
    "log.tag.MtkSpnOverride WARN"
    "log.tag.MtkSubCtrl WARN"
    "log.tag.MtkTelephonyManagerEx WARN"
    "log.tag.MtkUiccCard WARN"
    "log.tag.MtkUiccCardApp WARN"
    "log.tag.MtkUiccCtrl WARN"
    "log.tag.MtkUsimFH WARN"
    "log.tag.MtkUsimPhoneBookManager WARN"
    "log.tag.MwiRIL WARN"
    "log.tag.NetAgentService WARN"
    "log.tag.NetAgent_IO WARN"
    "log.tag.NetLnkEventHdlr WARN"
    "log.tag.NetworkManagement WARN"
    "log.tag.NetworkManagementService WARN"
    "log.tag.NetworkPolicy WARN"
    "log.tag.NetworkPolicyManagerService WARN"
    "log.tag.NetworkStats WARN"
    "log.tag.NetworkTimeUpdateService WARN"
    "log.tag.NotificationManager WARN"
    "log.tag.NotificationManagerService WARN"
    "log.tag.OperatorUtils WARN"
    "log.tag.PKM-Lib WARN"
    "log.tag.PKM-MDM WARN"
    "log.tag.PKM-Monitor WARN"
    "log.tag.PKM-SA WARN"
    "log.tag.PKM-Service WARN"
    "log.tag.PQ_DS WARN"
    "log.tag.PackageInstaller WARN"
    "log.tag.PackageManager WARN"
    "log.tag.PersistentDataBlockManager WARN"
    "log.tag.Phone WARN"
    "log.tag.PhoneConfigurationSettings WARN"
    "log.tag.PhoneFactory WARN"
    "log.tag.PowerHalAddressUitls WARN"
    "log.tag.PowerHalMgrImpl WARN"
    "log.tag.PowerHalMgrServiceImpl WARN"
    "log.tag.PowerHalWifiMonitor WARN"
    "log.tag.PowerManager WARN"
    "log.tag.PowerManagerService WARN"
    "log.tag.PrintManager WARN"
    "log.tag.ProcessStats WARN"
    "log.tag.ProxyController WARN"
    "log.tag.RFX WARN"
    "log.tag.RIL WARN"
    "log.tag.RIL-Fusion WARN"
    "log.tag.RIL-Netlink WARN"
    "log.tag.RIL-Parcel WARN"
    "log.tag.RIL-SocListen WARN"
    "log.tag.RIL-Socket WARN"
    "log.tag.RILC WARN"
    "log.tag.RILC-OP WARN"
    "log.tag.RILD WARN"
    "log.tag.RILMD2-SS WARN"
    "log.tag.RIL_UIM_SOCKET WARN"
    "log.tag.RadioManager WARN"
    "log.tag.RfxAction WARN"
    "log.tag.RfxBaseHandler WARN"
    "log.tag.RfxChannelMgr WARN"
    "log.tag.RfxCloneMgr WARN"
    "log.tag.RfxContFactory WARN"
    "log.tag.RfxController WARN"
    "log.tag.RfxDebugInfo WARN"
    "log.tag.RfxDisThread WARN"
    "log.tag.RfxFragEnc WARN"
    "log.tag.RfxHandlerMgr WARN"
    "log.tag.RfxIdToMsgId WARN"
    "log.tag.RfxIdToStr WARN"
    "log.tag.RfxMainThread WARN"
    "log.tag.RfxMclDisThread WARN"
    "log.tag.RfxMclMessenger WARN"
    "log.tag.RfxMclStatusMgr WARN"
    "log.tag.RfxMessage WARN"
    "log.tag.RfxObject WARN"
    "log.tag.RfxOpUtils WARN"
    "log.tag.RfxRilAdapter WARN"
    "log.tag.RfxRilUtils WARN"
    "log.tag.RfxRoot WARN"
    "log.tag.RfxStatusMgr WARN"
    "log.tag.RfxTimer WARN"
    "log.tag.RilClient WARN"
    "log.tag.RilOemClient WARN"
    "log.tag.RilOpProxy WARN"
    "log.tag.RmmCapa WARN"
    "log.tag.RmmCommSimOpReq WARN"
    "log.tag.RmmDcEvent WARN"
    "log.tag.RmmDcPdnManager WARN"
    "log.tag.RmmDcUrcHandler WARN"
    "log.tag.RmmDcUtility WARN"
    "log.tag.RmmEccNumberReqHdlr WARN"
    "log.tag.RmmEccNumberUrcHandler WARN"
    "log.tag.RmmEmbmsReq WARN"
    "log.tag.RmmEmbmsUrc WARN"
    "log.tag.RmmImsCtlReqHdl WARN"
    "log.tag.RmmImsCtlUrcHdl WARN"
    "log.tag.RmmMwi WARN"
    "log.tag.RmmNwAsyncHdlr WARN"
    "log.tag.RmmNwHdlr WARN"
    "log.tag.RmmNwNrtReqHdlr WARN"
    "log.tag.RmmNwRTReqHdlr WARN"
    "log.tag.RmmNwRatSwHdlr WARN"
    "log.tag.RmmNwReqHdlr WARN"
    "log.tag.RmmNwUrcHdlr WARN"
    "log.tag.RmmOemHandler WARN"
    "log.tag.RmmOpRadioReq WARN"
    "log.tag.RmmPhbReq WARN"
    "log.tag.RmmPhbUrc WARN"
    "log.tag.RmmRadioReq WARN"
    "log.tag.RmmSimBaseHandler WARN"
    "log.tag.RmmSimCommReq WARN"
    "log.tag.RmmSimCommUrc WARN"
    "log.tag.RmmWp WARN"
    "log.tag.RtmCapa WARN"
    "log.tag.RtmCommSimCtrl WARN"
    "log.tag.RtmDC WARN"
    "log.tag.RtmEccNumberController WARN"
    "log.tag.RtmEmbmsAt WARN"
    "log.tag.RtmEmbmsUtil WARN"
    "log.tag.RtmIms WARN"
    "log.tag.RtmImsConference WARN"
    "log.tag.RtmImsConfigController WARN"
    "log.tag.RtmImsDialog WARN"
    "log.tag.RtmModeCont WARN"
    "log.tag.RtmMwi WARN"
    "log.tag.RtmNwCtrl WARN"
    "log.tag.RtmPhb WARN"
    "log.tag.RtmRadioConfig WARN"
    "log.tag.RtmRadioCont WARN"
    "log.tag.RtmWp WARN"
    "log.tag.SIMRecords WARN"
    "log.tag.SQLiteQueryBuilder WARN"
    "log.tag.SensorManager WARN"
    "log.tag.ServiceManager WARN"
    "log.tag.SimSwitchOP01 WARN"
    "log.tag.SimSwitchOP02 WARN"
    "log.tag.SimSwitchOP18 WARN"
    "log.tag.SlotQueueEntry WARN"
    "log.tag.SpnOverride WARN"
    "log.tag.StatusBarManagerService WARN"
    "log.tag.StorageManager WARN"
    "log.tag.SurfaceFlinger WARN"
    "log.tag.SystemServer WARN"
    "log.tag.Telecom WARN"
    "log.tag.TelephonyManager WARN"
    "log.tag.TelephonyRegistry WARN"
    "log.tag.ThermalManager WARN"
    "log.tag.ToneGenerator WARN"
    "log.tag.UiccCard WARN"
    "log.tag.UiccController WARN"
    "log.tag.UsbHostManager WARN"
    "log.tag.UsbManager WARN"
    "log.tag.UxUtility WARN"
    "log.tag.VT WARN"
    "log.tag.VibratorService WARN"
    "log.tag.VpnManager WARN"
    "log.tag.VsimAdaptor WARN"
    "log.tag.WORLDMODE WARN"
    "log.tag.WallpaperManager WARN"
    "log.tag.WfoApp WARN"
    "log.tag.WifiManager WARN"
    "log.tag.WindowManager WARN"
    "log.tag.WindowManagerService WARN"
    "log.tag.WpfaCcciDataHeaderEncoder WARN"
    "log.tag.WpfaCcciReader WARN"
    "log.tag.WpfaCcciSender WARN"
    "log.tag.WpfaControlMsgHandler WARN"
    "log.tag.WpfaDriver WARN"
    "log.tag.WpfaDriverAccept WARN"
    "log.tag.WpfaDriverAdapter WARN"
    "log.tag.WpfaDriverDeReg WARN"
    "log.tag.WpfaDriverMessage WARN"
    "log.tag.WpfaDriverRegFilter WARN"
    "log.tag.WpfaDriverULIpPkt WARN"
    "log.tag.WpfaDriverUtilis WARN"
    "log.tag.WpfaDriverVersion WARN"
    "log.tag.WpfaFilterRuleReqHandler WARN"
    "log.tag.WpfaParsing WARN"
    "log.tag.WpfaRingBuffer WARN"
    "log.tag.WpfaRuleContainer WARN"
    "log.tag.WpfaRuleRegister WARN"
    "log.tag.WpfaShmAccessController WARN"
    "log.tag.WpfaShmReadMsgHandler WARN"
    "log.tag.WpfaShmSynchronizer WARN"
    "log.tag.WpfaShmWriteMsgHandler WARN"
    "log.tag.brevent.event WARN"
    "log.tag.libPowerHal WARN"
    "log.tag.libfuse WARN"
    "log.tag.mipc_lib WARN"
    "log.tag.mtkpower@impl WARN"
    "log.tag.mtkpower_client WARN"
    "log.tag.trm_lib WARN"
    "log.tag.wpfa_iptable_android WARN"
    "log.tag.Networklogger WARN"
    "log.tag.AudioFlinger::DeviceEffectProxy WARN"
    )
    for commands in "${disable_log[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
}
apply_properties() {
    set_prop=(
        "debug.sf.hw 1"
        "debug.egl.hw 1"
        "debug.perf.tuning 1"
        "debug.sf.frame_rate_multiple_threshold 999"
        "debug.sf_frame_rate_multiple_fences 999"
        "debug.hwui.target_gpu_time_percent 100"
        "debug.hwui.target_cpu_time_percent 100"
        "debug.sf.enable_gl_backpressure 1"
        "debug.sf.disable_backpressure 1"
        "debug.performance.tuning 1"
        "debug.sf.use_frame_rate_priority 1"
        "debug.graphics.game_default_frame_rate.disabled true"
        "debug.sf.auto_latch_unsignaled 1"
        "debug.sf.latch_unsignaled 0"
        "debug.sf.enable_hwc_vds 1"
        "debug.hwui.use_hint_manager true"
        "debug.sf.enable_adpf_cpu_hint true"
        "debug.renderengine.graphite true"
        "debug.rs.default-CPU-driver 1"
        "debug.sf.fp16_client_target 1"
        "debug.hwui.use_buffer_age 1"
        "debug.sf.predict_hwc_composition_strategy true"
        "debug.display.allow_non_native_refresh_rate_override true"
        "debug.hwui.show_dirty_regions false"
        "debug.sf.predict_hwc_composition_strategy true"
    )
    vsync=(
        "debug.egl.swapinterval 0"
        "debug.gr.swapinterval 0"
        "debug.sf.swapinterval 0"
    )
    limit=(
        "thermal_limit_refresh_rate 1"
        "fps_limit 0"
    )
    glob=(
        "force_gpu_rendering 1"
        "GPUTUNER_SWITCH true"
        "CPUTUNER_SWITCH true"
        "DYNAMIC_PERFORMANCE_DEFAULT_STATUS 1"
        "DYNAMIC_PERFORMANCE_STATUS 1"
        "low_power 0"
        "miui_cpu_model 2"
        "cached_apps_freezer enable"
    )
    overlay=(
        "game_overlay com.dts.freefireth mode=2,angle=true,fps=$refresh_rate,loadingBoost=999999999"
        "game_overlay com.dts.freefiremax mode=2,angle=true,fps=$refresh_rate,loadingBoost=999999999"
    )
    optimal=(
        "dalvik.vm.checkjni 0"
        "dalvik.vm.dex2oat-minidebuginfo false"
        "dalvik.vm.minidebuginfo false"
        "dalvik.vm.useartservice true"
        "dalvik.vm.usejit true"
    )
    secure=(
        "long_press_timeout 200"
        "multi_press_timeout 200"
        "game_auto_temperature 0"
        "game_dashboard_always_on 1"
        "high_priority 1"
    )
    msaa=(
        "debug.egl.force_msaa 0"
        "debug.hwui.force_fxaa 0" 
        "debug.hwui.force_smaa 0" 
        "debug.hwui.force_msaa 0" 
        "debug.hwui.force_txaa 0" 
        "debug.hwui.force_csaa 0" 
        "debug.hwui.force_dlss 0" 
        "debug.sf.showupdates 0"
        "debug.sf.showfps 0"
        "debug.sf.showcpu 0"
        "debug.sf.showbackground 0"
    )
    cmd=(
        "set-adaptive-power-saver-enabled false"
        "set-fixed-performance-mode-enabled true"
        "set-mode 0"
    )
    am=(
        "clear-debug-app all"
        "clear-exit-info all"
        "clear-watch-heap all"
    )
    debloat=(
        "0 com.xiaomi.joyose"
        "0 com.xiaomi.glgm"
        "0 com.samsung.android.game.gos"
        "0 com.samsung.android.game.gametools"
        "0 com.samsung.android.game.gamehome"
    )
    SurfaceFlinger=(
        "use_adpf_cpu_hint true"
        "adpf_gpu_sf true"
        "adpf_use_fmq_channel true"
    )
logcat=$(getprop dalvik.vm.heapgrowthlimit)    
if [ -n "$logcat" ]; then
    logcat -G "$logcat"
else
    logcat -G 256K
    logcat -c 
    fi
    
if [ -n "$(getprop ro.hardware.vulkan)" ]; then
    renderer="skiavk" 
else
    renderer="skiagl"
fi
cmd thermalservice override-status 0
setprop debug.hwui.renderer "$renderer"
setprop debug.renderengine.backend skiagputhreaded
setprop debug.sf.use_phase_offsets_as_durations true

    for commands in "${set_prop[@]}"; do
    IFS=' ' read -r key value <<< "$commands"
    setprop "$key" "$value"
done
    for commands in "${vsync[@]}"; do
    IFS=' ' read -r key value <<< "$commands"
    setprop "$key" "$value"
done
    for commands in "${limit[@]}"; do
    IFS=' ' read -r key value <<< "$commands"
    settings put system "$key" "$value"
done
    for commands in "${glob[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    settings put global "$name" "$value"
done
    for commands in "${overlay[@]}"; do
    IFS=' ' read -r namespace key value <<< "$commands"
    device_config put "$namespace" "$key" "$value"
done
    for commands in "${optimal[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    setprop "$name" "$value"
done
    for commands in "${secure[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    settings put secure "$name" "$value"
done
    for commands in "${msaa[@]}"; do
    IFS=' ' read -r name value <<< "$commands"
    settings put global "$name" "$value"
done
    for commands in "${cmd[@]}"; do
    IFS=' ' read -r key value <<< "$commands"
    cmd power "$key" "$value"
done
    for commands in "${debloat[@]}"; do
    IFS=' ' read -r key value <<< "$commands"
    pm uninstall --user "$key" "$value"
done
    for commands in "${am[@]}"; do
    IFS=' ' read -r key value <<< "$commands"
    am "$key" "$value"
done
    for commands in "${SurfaceFlinger[@]}"; do
    IFS=' ' read -r key value <<< "$commands"
    dumpsys SurfaceFlinger "$key" "$value"
done
frame_ns=$(echo "1000000000 / $refresh_rate" | bc)
early_app=$(echo "$frame_ns * 0.4" | bc)
early_sf=$(echo "$frame_ns * 0.35" | bc)
earlyGl_app=$(echo "$frame_ns * 0.4" | bc)
earlyGl_sf=$(echo "$frame_ns * 0.35" | bc)
late_app=$(echo "$frame_ns * 0.4" | bc)
late_sf=$(echo "$frame_ns * 0.35" | bc)

early_app_phase=$(echo "-$early_app" | bc)
early_sf_phase=$(echo "-$early_sf" | bc)
earlyGl_app_phase=$(echo "-$earlyGl_app" | bc)
earlyGl_phase=$(echo "-$earlyGl_sf" | bc)
late_app_phase=$(echo "-$late_app" | bc)
late_sf_phase=$(echo "-$late_sf" | bc)
setprop debug.sf.early.app.duration "$early_app"
setprop debug.sf.early.sf.duration "$early_sf"
setprop debug.sf.earlyGl.app.duration "$earlyGl_app"
setprop debug.sf.earlyGl.sf.duration "$earlyGl_sf"
setprop debug.sf.late.app.duration "$late_app"
setprop debug.sf.late.sf.duration "$late_sf"
setprop debug.sf.early_app_phase_offset_ns "$early_app_phase"
setprop debug.sf.early_gl_app_phase_offset_ns "$earlyGl_app_phase"
setprop debug.sf.early_gl_phase_offset_ns "$earlyGl_phase"
setprop debug.sf.early_phase_offset_ns "$early_sf_phase"
setprop debug.sf.high_fps_early_gl_phase_offset_ns "$earlyGl_phase"
setprop debug.sf.high_fps_early_phase_offset_ns "$early_sf_phase"
setprop debug.sf.high_fps_late_app_phase_offset_ns "$late_app_phase"
setprop debug.sf.high_fps_late_sf_phase_offset_ns "$late_sf_phase"
settings put system pointer_speed 5     
settings put system touch_sensitivity 3    
settings put system touch_responsiveness 2
settings put global touch.size.scale 1.2  
settings put global touch.size.bias 0      
settings put global touch.pressure.scale 0.6
settings put global touch.orientation.scale 0.9 
settings put system smooth_display_enabled 1
settings put global game_driver_all_apps 1
settings put global game_driver_opt_out_apps 0
settings put global game_driver_sphal_libraries 1
setprop debug.touch.calibrate true                 
setprop debug.touch.slop 0                         
setprop debug.touch.delay 0                      
setprop debug.touch.sensitivity 8                  
setprop debug.touch.response 0                    
setprop debug.touch.velocity_scale 5             
setprop debug.touch.tap_timeout 0                 
setprop debug.touch.longpress_timeout 150          
setprop debug.touch.pressure_sensitivity 1      
setprop debug.touch.pollrate 120                  
setprop debug.inputdispatcher.max_events_per_sec 240
setprop debug.inputdispatcher.report_touch_event_delay 0
setprop debug.inputreader.velocity.control.resolution 0.001
setprop debug.inputreader.velocity.control.scale 3.0
setprop debug.inputreader.velocity.control.xscale 2.5
setprop debug.inputreader.velocity.control.yscale 5.5
setprop debug.inputreader.velocity.control.resolution 0.001
setprop debug.inputreader.velocity.control.scale 3.0
setprop debug.inputreader.velocity.control.xscale 2.5
setprop debug.inputreader.velocity.control.yscale 5.5
}
sm idle-maint abort
am kill-all
log > /dev/null 2>&1
apply_properties > /dev/null 2>&1
  echo -ne "System loading.\  
"
  sleep 1
  echo -ne "System loading./ 
"
  sleep 1
echo " System Installed Successfully"