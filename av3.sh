
#!/system/bin/sh

# Script metadata
dev="Kysertweaks"
version="3.0"
module_name="Modules"
status="No Root"

# Gather system information
brand=$(getprop ro.product.brand)
android=$(getprop ro.build.version.release)
hardware=$(getprop ro.hardware)
bit=$(getprop ro.product.cpu.abi | grep -o "64" || echo "32")
cores=$(nproc --all)
kb_ram=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
gb_ram=$(echo "scale=2; $kb_ram / 1048576" | bc)
ram_info=$(awk '/MemTotal|MemAvailable/ {if (NR==1) total=$2; if (NR==2) available=$2} END {printf "%.2f / %.2f GB", available/1024/1024, total/1024/1024}' /proc/meminfo)
storage=$(df /data | awk 'NR==2 { total=($2+$3)/1024/1024; used=$3/1024/1024; printf "%.2f / %.0f GB", used, total }')
refresh_rate=$(dumpsys SurfaceFlinger | awk '/refresh-rate/ {printf "%d", $3}')
ping=$(ping -c 1 8.8.8.8 | awk -F'time=' '/time=/ {print $2}' | cut -d' ' -f1 || echo "N/A")

# Display system information with cyberpunk style and icons
echo ""
echo "┌──[ Kysertweaks X modules v3.0 ]───────────────────────────"
echo "│  🚀 INITIALIZING SYSTEM DIAGNOSTICS..."
echo "│  👨‍💻 DEV: $dev"
echo "│  📦 MODULE: $module_name"
echo "└──────────────────────────────────────────────────"
echo ""
echo "  ╔═ 💻 SYSTEM SPECS ═════════════════════════════"
printf "  │ 📱 BRAND      : %-28s │\n" "$brand"
printf "  │ 🤖 ANDROID    : %-28s │\n" "$android"
printf "  │ 🔧 ARCH       : %-28s │\n" "$bit-bit"
printf "  │ 🧠 CPU        : %-28s │\n" "$cores cores"
printf "  │ 💾 RAM        : %-28s │\n" "$ram_info"
printf "  │ 🗄️ STORAGE    : %-28s │\n" "$storage"
printf "  │ 🌐 NETWORK    : %-28s │\n" "$ping ms"
printf "  │ 🖥️ SCREEN     : %-28s │\n" "$refresh_rate Hz"
echo "  ╚════════════════════════════════════════════"
echo ""
echo "  [ 🔋 STATUS: $status ]"
echo "  [ ⚙️ OPTIMIZATION MODES ]"
echo "  🎮 GAMING MODE  | 🚀 GPU BOOST"
echo "  🧹 CLEAN CACHE  | 📈 FPS BOOST"
echo "  ⏳ INSTALLATION IN PROGRESS... 🌩️"

# Suppress log tags without arrays
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
pm disable-user --user 0 com.samsung.android.game.gos
pm disable-user --user 0 com.samsung.android.game.gametools
pm disable-user --user 0 com.samsung.android.game.gamehome
pm uninstall --user 0 com.xiaomi.glgm
pm uninstall --user 0 com.xiaomi.joyose

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
}
sm idle-maint abort
am kill-all
log > /dev/null 2>&1
apply_properties > /dev/null 2>&1
Quick_Log() {
    for tag in \
        SQLiteQueryBuilder FuseDaemon GAv4 CAM2PORT_ FragmentManager libfuse \
        AndroidRuntime PackageManager ActivityManager WindowManager AudioManager \
        InputMethodManager BluetoothManager NetworkManagement ConnectivityManager \
        WifiManager TelephonyManager LocationManager SensorManager PowerManager \
        SurfaceFlinger MediaPlayer AudioPolicyManager InputManager AccountManager \
        DevicePolicyManager WallpaperManager BatteryManager ContentManager \
        GraphicsStats JobScheduler UsbManager VpnManager NotificationManager \
        AlarmManager ClipboardManager InputDispatcher NetworkStats BackupManager \
        KeyguardManager DeviceIdleController ActivityTaskManager DisplayManager \
        UsbHostManager AppOps HardwarePropertiesManager StorageManager \
        ServiceManager DockObserver PersistentDataBlockManager \
        NetworkTimeUpdateService ThermalManager PrintManager NetworkPolicy \
        BluetoothAdapter BluetoothSocket BluetoothDevice MediaRouter MediaSession \
        LocationProvider ConnectivityService BatteryStatsService ProcessStats \
        PackageInstaller DownloadManager SystemServer HardwareService \
        PowerManagerService InputMethodManagerService StatusBarManagerService \
        NetworkManagementService NetworkPolicyManagerService TelephonyRegistry \
        MountService WindowManagerService DisplayManagerService \
        ActivityManagerService ActivityTaskManagerService AlarmManagerService \
        NotificationManagerService VibratorService ConsumerIrService \
        DevicePolicyManagerService LocationManagerService InputManagerService \
        AudioService MediaPlayerService AudioPolicyService BluetoothService \
        BluetoothGattService BluetoothHidService BluetoothPanService \
        BluetoothMapService BluetoothPbapService BluetoothSapService
    do
        setprop "log.tag.$tag" S
    done
}

# Apply performance properties
apply_performance_props() {
    for prop in \
        "debug.sf.enable_hwc_vds=1" \
        "debug.sf.hw=1" \
        "debug.egl.hw=1" \
        "debug.sf.enable_adpf_cpu_hint=1" \
        "debug.gr.swapinterval=0" \
        "debug.sf.swapinterval=0" \
        "debug.egl.swapinterval=0" \
        "debug.performance.tuning=1" \
        "debug.perf.tuning=1"
    do
        setprop "${prop%%=*}" "${prop#*=}"
    done
}

# Apply low graphics settings
apply_graphics_settings() {
    settings put global gfx_quality low
    settings put global render_quality low
    settings put global shadow_quality disable
    settings put global texture_quality low
    settings put global effects_quality low
    settings put global graphics_quality low
    settings put global lights_quality low
    settings put global shader_quality low
    setprop debug.sf.phase_offset_threshold_for_next_vsync_ns 0
}

# Boost specific packages
boost_packages() {
    for pkg in com.android.systemui com.dts.freefireth com.dts.freefiremax; do
        for mode in speed speed-profile everything assume-verified; do
            cmd package compile -m "$mode" -f "$pkg" || echo "Failed to compile $pkg in $mode mode"
        done
    done
}

# Set game performance mode
set_game_performance() {
    for game in com.dts.freefireth com.dts.freefiremax; do
        cmd game mode performance "$game" || echo "Failed to set performance mode for $game"
        cmd game set-game-mode "$game" 2
        cmd game set-game-performance-mode "$game" 2
        cmd game set-game-profile-mode "$game" 2
    done
}

# Compile game packages with optimizations
compile_games() {
    for game in com.dts.freefireth com.dts.freefiremax; do
        cmd package compile -m quicken -f "$game" \
            reduce-shadow-quality=high \
            disable-filtering \
            disable-blur \
            reduce-image-quality=high \
            no-opt \
            remove-logging \
            define-strip-debug-symbols \
            use-prenormalized-normals \
            model-compression=multicore-art \
            resource-compression \
            linear-alloc \
            extract-startup \
            position-independent \
            virtual-abis \
            secondary-dex \
            storage-caching \
            zygote \
            compiler-filter-summary=speed \
            incremental=full \
            avoid-hard-coded-indexes \
            force-jumbo \
            thin-apk \
            cache-compiled-layouts \
            texture-quality=low \
            disable-anti-aliasing \
            shadow-quality=smooth \
            draw-distance=short \
            fps-limit=90 \
            frame-rate-level=3 \
            peak-texture \
            disable-ambient-sound \
            shader-quality=low \
            reduce-lighting-quality=low \
            object-detail=low \
            water-quality=low \
            texture-resolution=low \
            disable-depth-of-field \
            ambient-occlusion=low \
            max-object=low \
            disable-vsync \
            post-processing-quality=low \
            disable-tessellation \
            follage-quality=low \
            disable-hdr \
            animation-quality=low \
            reflection-quality=low \
            disable-ambient-inclusion \
            compiler-backend=optimize \
            anisotropic-filtering=low \
            disable-chromatic-aberration \
            global-illumination= \
            disable-lens-flare \
            snow-quality= \
            reduce-shader-complexity=medium \
            ray-tracing= \
            disable-intensive-gpu-effects \
            disable-dynamic-gpu-load-balancing \
            disable-asynchronous-cpu \
            physic-quality=low \
            audio-processing-quality=medium \
            disable-cpu-logging \
            disable-background-cpu-processes \
            dynamic-lighting-quality= \
            disable-network-cpu-processes \
            shader-resolution=low \
            sound-effect-quality=medium \
            optimize-render-target=optimize \
            optimize-render-distance=medium \
            disable-unnecessary-visual-effects \
            force-gfx-direct \
            force-gfx-st \
            disable-dynamic-weather \
            multi-dex \
            no-debug \
            extract-startup \
            minify \
            compiler-backend=speed \
            linear-alloc \
            force-dex-preopt \
            secondary-dex-files=library-dex1.dex,library-dex2.dex \
            position-independent \
            compile-dynamic-reference \
            compile-pic \
            cache-compiled-layouts \
            layoutlib-compile-file-path \
            zip-compression-level=4 \
            app-image-zip-size=256m \
            image-zip-section-align=64k \
            dex-segment=int-class.dex \
            force-dex-version-override \
            thin-apk \
            force-jumbo \
            big-app \
            large-heap \
            high-memory \
            no-cache-syscall \
            large-dalvik-cache \
            image-dex2oat-filter=quicken \
            model-compression=Draco \
            texture-atlas \
            use-prenormalized-normals \
            audio-compression=ultra \
            generate-mipmaps \
            storage-caching \
            shadow-map-compression=monothic \
            enable-streaming \
            generate-compact-dex \
            deduplicate-code \
            disable-gpu-memory-limit \
            gpu-busy-penalty=quicken \
            no-locals \
            no-version-vectors \
            optimize \
            no-strict-math \
            compiler-backend=skia \
            no-static-analysis \
            no-type-checks || echo "Failed to compile $game"
    done
}

# Configure game settings
configure_games() {
    for game in com.dts.freefireth com.dts.freefiremax; do
        settings put system perf_proc_game_List "$game"
        settings put system rt_pkg_black_list "${game}ent"
        settings put system rt_templimit_ceiling 36
        settings put system rt_templimit_bottom 36
        cmd device_config put game_package "com.roblox.client.vnggames,$game" fps_limit=90
        settings put system predownload_ui_enable "[{\"pkgName\":\"$game\",\"predownload\":true}]"
    done
}

# Tune sensitivity
tune_sensitivity() {
    setprop debug.sf.enable_advanced_sf_phase_offset 1
    settings put global device_idle_constants \
        "inactive_to=15000,sensing_to=0,locating_to=0,location_accuracy=10.0,\
motion_inactive_to=0,idle_after_inactive_to=0,idle_pending_to=30000,\
max_idle_pending_to=60000,idle_pending_factor=1.5,idle_to=900000,\
max_idle_to=21600000,idle_factor=1.5,min_time_to_alarm=600000,\
max_temp_app_whitelist_duration=10000,mms_temp_app_whitelist_duration=30000,\
sms_temp_app_whitelist_duration=30000,light_after_inactive_to=3000,\
light_pre_idle_to=60000,light_idle_to=120000,light_idle_factor=1.5,\
light_max_idle_to=180000,light_idle_maintenance_min_budget=60000,\
light_idle_maintenance_max_budget=180000,min_light_maintenance_time=5000,\
min_deep_maintenance_time=30000,notification_whitelist_duration=60000"
}

# Main function
main() {
    apply_performance_props
    apply_graphics_settings
    boost_packages
    set_game_performance
    compile_games
    configure_games
    tune_sensitivity
    Quick_Log
}

# Execute main function
main > /dev/null 2>&1
echo ""
echo "  ┌──[ ✅ INSTALLATION COMPLETE ]──────────────────"
echo "  │  🎉 ModuleXAimlock by Kysertweaks - Unleash the Power!"
echo "  │  🛠️ System Optimized. Ready for Action! 🚀"
echo "  └──────────────────────────────────────────────"