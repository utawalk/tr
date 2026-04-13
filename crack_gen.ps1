Add-Type -AssemblyName System.Drawing

# ひび割れオーバーレイスプライトシート
# 透明背景の上にひびの線だけを描画する
# フレーム0: 軽いひび(1段階目)  フレーム1: 大きなひび(2段階目)
$bmp = New-Object System.Drawing.Bitmap 64, 32
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::Transparent)

$darkCrack = [System.Drawing.Color]::FromArgb(40, 30, 30)

# --- フレーム0: 軽いひび (x=0) ---
$pen1 = New-Object System.Drawing.Pen $darkCrack, 2
# 中央から斜めに1本のひび
$g.DrawLine($pen1, 16, 8, 12, 16)
$g.DrawLine($pen1, 12, 16, 18, 24)
$pen1.Dispose()

# --- フレーム1: 大きなひび (x=32) ---
$pen2 = New-Object System.Drawing.Pen $darkCrack, 2
# 複数のひびが広がっている
$g.DrawLine($pen2, 44, 4, 48, 12)
$g.DrawLine($pen2, 48, 12, 42, 20)
$g.DrawLine($pen2, 42, 20, 46, 28)
# 2本目のひび
$g.DrawLine($pen2, 54, 6, 56, 14)
$g.DrawLine($pen2, 56, 14, 52, 22)
# 3本目(左側)
$g.DrawLine($pen2, 36, 10, 40, 18)
$g.DrawLine($pen2, 40, 18, 38, 26)
$pen2.Dispose()

$bmp.Save("c:\Users\uta_0\.antigravity\tr\dev\crack.png", [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()
Write-Host "crack.png done"
