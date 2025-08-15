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

echo ">>> Đang lấy độ phân giải hiện tại..."

# Lấy kích thước hiện tại
size=$(wm size 2>/dev/null | grep -o '[0-9]\+x[0-9]\+')
if [ -z "$size" ]; then
  echo ">>> Lỗi: Không thể lấy độ phân giải hiện tại. Kiểm tra lệnh 'wm size' hoặc quyền truy cập."
  exit 1
fi

# Tách chiều rộng và chiều cao
width=$(echo "$size" | cut -d'x' -f1)
height=$(echo "$size" | cut -d'x' -f2)
echo ">>> Kích thước gốc: ${width}x${height}"

# Tính toán kích thước mới (làm tròn để đảm bảo giá trị nguyên)
new_width=$(printf "%.0f" $(echo "$width * 1.8" | bc))
new_height=$(printf "%.0f" $(echo "$height * 1.8" | bc))
echo ">>> Nhân độ phân giải lên 1.8 lần..."
echo ">>> Kích thước mới: ${new_width}x${new_height}"

# Áp dụng độ phân giải mới
if ! wm size "${new_width}x${new_height}" 2>/dev/null; then
  echo ">>> Lỗi: Không thể áp dụng độ phân giải mới. Kiểm tra quyền hoặc thiết bị."
  exit 1
fi

echo ">>> Đã áp dụng độ phân giải mới!"
echo ">>> Dùng 'wm size reset' để khôi phục mặc định."
