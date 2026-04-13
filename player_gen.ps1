Add-Type -AssemblyName System.Drawing

# 最終画像: 128x32
$final = New-Object System.Drawing.Bitmap 128, 32
$fg = [System.Drawing.Graphics]::FromImage($final)
$fg.Clear([System.Drawing.Color]::Transparent)

# 色マップ (名前→Color)
$cm = @{}
$cm['Skin']      = [System.Drawing.Color]::FromArgb(255,255,224,189)
$cm['SkinS']     = [System.Drawing.Color]::FromArgb(255,235,195,155)
$cm['Hair']      = [System.Drawing.Color]::FromArgb(255,255,105,150)
$cm['HairD']     = [System.Drawing.Color]::FromArgb(255,210,70,115)
$cm['Band']      = [System.Drawing.Color]::FromArgb(255,255,50,80)
$cm['Eye']       = [System.Drawing.Color]::FromArgb(255,40,120,220)
$cm['EyeH']      = [System.Drawing.Color]::FromArgb(255,180,220,255)
$cm['Mouth']     = [System.Drawing.Color]::FromArgb(255,220,100,100)
$cm['Cheek']     = [System.Drawing.Color]::FromArgb(255,255,170,170)
$cm['Top']       = [System.Drawing.Color]::FromArgb(255,240,240,250)
$cm['TopS']      = [System.Drawing.Color]::FromArgb(255,200,200,220)
$cm['Skirt']     = [System.Drawing.Color]::FromArgb(255,70,110,200)
$cm['SkirtD']    = [System.Drawing.Color]::FromArgb(255,50,80,160)
$cm['Boot']      = [System.Drawing.Color]::FromArgb(255,150,90,50)
$cm['BootD']     = [System.Drawing.Color]::FromArgb(255,110,65,30)
$cm['Belt']      = [System.Drawing.Color]::FromArgb(255,180,140,60)
$cm['White']     = [System.Drawing.Color]::White

function DR($x,$y,$w,$h,$cn) {
    $b = New-Object System.Drawing.SolidBrush $cm[$cn]
    $fg.FillRectangle($b, $x, $y, $w, $h)
    $b.Dispose()
}

# ===== フレーム0: 待機 (ox=0) =====
DR 11 1 10 3 'Hair';  DR 11 3 10 3 'Hair';  DR 12 4 8 2 'HairD'
DR 8 3 3 14 'Hair';   DR 8 9 3 5 'HairD';   DR 21 3 3 14 'Hair';  DR 21 9 3 5 'HairD'
DR 11 5 10 1 'Band'
DR 11 4 10 9 'Skin';  DR 11 10 10 3 'SkinS'
DR 12 7 3 3 'White';  DR 13 7 2 3 'Eye';    DR 13 7 1 1 'EyeH'
DR 17 7 3 3 'White';  DR 18 7 2 3 'Eye';    DR 18 7 1 1 'EyeH'
DR 15 11 2 1 'Mouth';
DR 12 10 2 1 'Cheek'; DR 18 10 2 1 'Cheek'
DR 12 13 8 4 'Top';   DR 12 15 8 2 'TopS';  DR 12 17 8 1 'Belt'
DR 10 13 2 4 'Skin';  DR 20 13 2 4 'Skin'
DR 11 18 10 4 'Skirt'; DR 11 20 10 2 'SkirtD'
DR 13 22 2 3 'Skin';  DR 17 22 2 3 'Skin'
DR 12 25 4 3 'Boot';  DR 16 25 4 3 'Boot'
DR 12 27 4 1 'BootD'; DR 16 27 4 1 'BootD'

# ===== フレーム1: 歩行1 (ox=32) =====
$ox=32
DR ($ox+11) 1 10 3 'Hair';  DR ($ox+11) 3 10 3 'Hair';  DR ($ox+12) 4 8 2 'HairD'
DR ($ox+8) 3 3 13 'Hair';   DR ($ox+8) 9 3 4 'HairD'
DR ($ox+21) 3 3 13 'Hair';  DR ($ox+21) 9 3 4 'HairD'
DR ($ox+11) 5 10 1 'Band'
DR ($ox+11) 4 10 9 'Skin';  DR ($ox+11) 10 10 3 'SkinS'
DR ($ox+12) 7 3 3 'White';  DR ($ox+13) 7 2 3 'Eye';  DR ($ox+13) 7 1 1 'EyeH'
DR ($ox+17) 7 3 3 'White';  DR ($ox+18) 7 2 3 'Eye';  DR ($ox+18) 7 1 1 'EyeH'
DR ($ox+15) 11 2 1 'Mouth'
DR ($ox+12) 10 2 1 'Cheek'; DR ($ox+18) 10 2 1 'Cheek'
DR ($ox+12) 13 8 4 'Top';   DR ($ox+12) 15 8 2 'TopS'; DR ($ox+12) 17 8 1 'Belt'
DR ($ox+10) 14 2 3 'Skin';  DR ($ox+20) 12 2 3 'Skin'
DR ($ox+11) 18 10 4 'Skirt'; DR ($ox+12) 20 8 2 'SkirtD'
DR ($ox+12) 22 2 2 'Skin';  DR ($ox+18) 22 2 3 'Skin'
DR ($ox+11) 24 4 4 'Boot';  DR ($ox+17) 25 4 3 'Boot'
DR ($ox+11) 27 4 1 'BootD'; DR ($ox+17) 27 4 1 'BootD'

# ===== フレーム2: 歩行2 (ox=64) =====
$ox=64
DR ($ox+11) 1 10 3 'Hair';  DR ($ox+11) 3 10 3 'Hair';  DR ($ox+12) 4 8 2 'HairD'
DR ($ox+8) 3 3 13 'Hair';   DR ($ox+8) 9 3 4 'HairD'
DR ($ox+21) 3 3 13 'Hair';  DR ($ox+21) 9 3 4 'HairD'
DR ($ox+11) 5 10 1 'Band'
DR ($ox+11) 4 10 9 'Skin';  DR ($ox+11) 10 10 3 'SkinS'
DR ($ox+12) 7 3 3 'White';  DR ($ox+13) 7 2 3 'Eye';  DR ($ox+13) 7 1 1 'EyeH'
DR ($ox+17) 7 3 3 'White';  DR ($ox+18) 7 2 3 'Eye';  DR ($ox+18) 7 1 1 'EyeH'
DR ($ox+15) 11 2 1 'Mouth'
DR ($ox+12) 10 2 1 'Cheek'; DR ($ox+18) 10 2 1 'Cheek'
DR ($ox+12) 13 8 4 'Top';   DR ($ox+12) 15 8 2 'TopS'; DR ($ox+12) 17 8 1 'Belt'
DR ($ox+10) 12 2 3 'Skin';  DR ($ox+20) 14 2 3 'Skin'
DR ($ox+11) 18 10 4 'Skirt'; DR ($ox+12) 20 8 2 'SkirtD'
DR ($ox+12) 22 2 3 'Skin';  DR ($ox+18) 22 2 2 'Skin'
DR ($ox+11) 25 4 3 'Boot';  DR ($ox+17) 24 4 4 'Boot'
DR ($ox+11) 27 4 1 'BootD'; DR ($ox+17) 27 4 1 'BootD'

# ===== フレーム3: ジャンプ (ox=96) =====
$ox=96
DR ($ox+11) 0 10 3 'Hair';  DR ($ox+11) 2 10 3 'Hair';  DR ($ox+12) 3 8 2 'HairD'
DR ($ox+7) 1 4 11 'Hair';   DR ($ox+7) 6 4 4 'HairD'
DR ($ox+21) 1 4 11 'Hair';  DR ($ox+21) 6 4 4 'HairD'
DR ($ox+11) 4 10 1 'Band'
DR ($ox+11) 3 10 9 'Skin';  DR ($ox+11) 9 10 3 'SkinS'
DR ($ox+12) 6 3 3 'White';  DR ($ox+13) 6 2 3 'Eye';  DR ($ox+13) 6 1 1 'EyeH'
DR ($ox+17) 6 3 3 'White';  DR ($ox+18) 6 2 3 'Eye';  DR ($ox+18) 6 1 1 'EyeH'
DR ($ox+15) 10 2 1 'Mouth'
DR ($ox+12) 9 2 1 'Cheek';  DR ($ox+18) 9 2 1 'Cheek'
DR ($ox+12) 12 8 4 'Top';   DR ($ox+12) 14 8 2 'TopS'; DR ($ox+12) 16 8 1 'Belt'
DR ($ox+9) 10 3 4 'Skin';   DR ($ox+20) 10 3 4 'Skin'
DR ($ox+10) 17 12 3 'Skirt'; DR ($ox+11) 19 10 1 'SkirtD'
DR ($ox+13) 20 2 3 'Skin';  DR ($ox+17) 20 2 3 'Skin'
DR ($ox+12) 23 4 3 'Boot';  DR ($ox+16) 23 4 3 'Boot'
DR ($ox+12) 25 4 1 'BootD'; DR ($ox+16) 25 4 1 'BootD'

$final.Save("c:\Users\uta_0\.antigravity\tr\dev\player.png", [System.Drawing.Imaging.ImageFormat]::Png)
$fg.Dispose()
$final.Dispose()
Write-Host "player.png generated (cute girl, 4 frames)"
