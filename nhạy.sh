#!/system/bin/sh
#>>>Tool x5 screen sensitivity 
#copyright kysertweaks 
#Dev: Kysertweaks
echo ">>> Đang kiểm tra thiết bị..."
MODEL=$(getprop ro.product.model)
BRAND=$(getprop ro.product.brand)
ANDROID=$(getprop ro.build.version.release)
echo "Reset Màn Hình"
wm size reset 

echo "[INFO] Thiết bị: $BRAND $MODEL (Android $ANDROID)"

disable_if_exists() {
    pkg=$1
    if pm list packages | grep -q "$pkg"; then
        echo ">>> Tắt $pkg"
        pm disable-user --user 0 "$pkg"
    else
        echo ">>> Không tìm thấy $pkg"
    fi
}

disable_if_exists "com.coloros.gamespace"
disable_if_exists "com.coloros.gamespaceui"
disable_if_exists "com.coloros.gesture"
disable_if_exists "com.coloros.smarttouch"
disable_if_exists "com.oplus.touchpanel"
disable_if_exists "com.oplus.games"

CURRENT_PRESSURE=$(settings get system touch.pressure.scale)
CURRENT_SIZE=$(settings get system touch.size.scale)

[ -z "$CURRENT_PRESSURE" ] && CURRENT_PRESSURE=1
[ -z "$CURRENT_SIZE" ] && CURRENT_SIZE=1

echo ">>> Độ nhạy áp lực hiện tại: $CURRENT_PRESSURE"
echo ">>> Độ nhạy kích thước hiện tại: $CURRENT_SIZE"

NEW_PRESSURE=$(echo "$CURRENT_PRESSURE * 5" | bc)
NEW_SIZE=$(echo "$CURRENT_SIZE * 5" | bc)

settings put system touch.pressure.scale "$NEW_PRESSURE"
settings put system touch.size.scale "$NEW_SIZE"

echo "[OK] Đã tăng áp lực từ $CURRENT_PRESSURE → $NEW_PRESSURE"
echo "[OK] Đã tăng kích thước từ $CURRENT_SIZE → $NEW_SIZE"

size=$(wm size | grep -o '[0-9]*x[0-9]*')
width=$(echo "$size" | cut -d'x' -f1)
height=$(echo "$size" | cut -d'x' -f2)
scale=1.2
new_width=$(echo "$width * $scale" | bc | cut -d'.' -f1)
new_height=$(echo "$height * $scale" | bc | cut -d'.' -f1)
wm size ${new_width}x${new_height} 
