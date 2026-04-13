Add-Type -AssemblyName System.Drawing

# タイルセット: 288x32 (9フレーム x 32x32)
# テラリア風のテクスチャ付きドット絵ブロック
$bmp = New-Object System.Drawing.Bitmap 288, 32
$fg = [System.Drawing.Graphics]::FromImage($bmp)
$fg.Clear([System.Drawing.Color]::Transparent)

$script:cm = @{}
# 草ブロック
$script:cm['GrassTop']    = [System.Drawing.Color]::FromArgb(255, 60, 180, 60)
$script:cm['GrassHi']     = [System.Drawing.Color]::FromArgb(255, 90, 210, 80)
$script:cm['GrassDk']     = [System.Drawing.Color]::FromArgb(255, 40, 140, 40)
$script:cm['GrassDirt']   = [System.Drawing.Color]::FromArgb(255, 150, 100, 55)
$script:cm['GrassDirtDk'] = [System.Drawing.Color]::FromArgb(255, 120, 78, 40)
# 土ブロック
$script:cm['Dirt']     = [System.Drawing.Color]::FromArgb(255, 150, 100, 55)
$script:cm['DirtHi']   = [System.Drawing.Color]::FromArgb(255, 175, 120, 70)
$script:cm['DirtDk']   = [System.Drawing.Color]::FromArgb(255, 120, 78, 40)
$script:cm['DirtSpot'] = [System.Drawing.Color]::FromArgb(255, 100, 65, 30)
# 石ブロック
$script:cm['Stone']   = [System.Drawing.Color]::FromArgb(255, 130, 130, 135)
$script:cm['StoneHi'] = [System.Drawing.Color]::FromArgb(255, 160, 160, 165)
$script:cm['StoneDk'] = [System.Drawing.Color]::FromArgb(255, 95, 95, 100)
$script:cm['StoneLn'] = [System.Drawing.Color]::FromArgb(255, 75, 75, 80)
# 石レンガ
$script:cm['Brick']   = [System.Drawing.Color]::FromArgb(255, 115, 115, 120)
$script:cm['BrickHi'] = [System.Drawing.Color]::FromArgb(255, 140, 140, 145)
$script:cm['BrickDk'] = [System.Drawing.Color]::FromArgb(255, 85, 85, 90)
$script:cm['Mortar']  = [System.Drawing.Color]::FromArgb(255, 70, 70, 72)
# 土壁
$script:cm['Wall']   = [System.Drawing.Color]::FromArgb(255, 100, 70, 45)
$script:cm['WallHi'] = [System.Drawing.Color]::FromArgb(255, 120, 85, 55)
$script:cm['WallDk'] = [System.Drawing.Color]::FromArgb(255, 75, 50, 30)
# 松明
$script:cm['TStick']  = [System.Drawing.Color]::FromArgb(255, 120, 80, 35)
$script:cm['TFlame1'] = [System.Drawing.Color]::FromArgb(255, 255, 160, 30)
$script:cm['TFlame2'] = [System.Drawing.Color]::FromArgb(255, 255, 220, 60)
$script:cm['TFlame3'] = [System.Drawing.Color]::FromArgb(255, 255, 255, 180)
$script:cm['TGlow']   = [System.Drawing.Color]::FromArgb(255, 80, 65, 20)
# 宝箱
$script:cm['ChestW']  = [System.Drawing.Color]::FromArgb(255, 120, 78, 38)
$script:cm['ChestHi'] = [System.Drawing.Color]::FromArgb(255, 155, 105, 55)
$script:cm['ChestDk'] = [System.Drawing.Color]::FromArgb(255, 85, 55, 25)
$script:cm['ChestG']  = [System.Drawing.Color]::FromArgb(255, 220, 175, 40)
$script:cm['ChestGD'] = [System.Drawing.Color]::FromArgb(255, 180, 135, 20)
$script:cm['ChestIn'] = [System.Drawing.Color]::FromArgb(255, 40, 28, 15)
# 金塊
$script:cm['Gold']   = [System.Drawing.Color]::FromArgb(255, 255, 215, 0)
$script:cm['GoldHi'] = [System.Drawing.Color]::FromArgb(255, 255, 245, 130)
$script:cm['GoldDk'] = [System.Drawing.Color]::FromArgb(255, 200, 160, 0)
$script:cm['GoldSh'] = [System.Drawing.Color]::FromArgb(255, 160, 120, 0)

function DR($x,$y,$w,$h,$cn) {
    $c = $script:cm[$cn]
    $b = New-Object System.Drawing.SolidBrush $c
    $fg.FillRectangle($b, $x, $y, $w, $h)
    $b.Dispose()
}

# ======== 0: Grass (x=0) ========
# 土のベース
DR 0 6 32 26 'Dirt'; DR 0 8 32 2 'DirtHi'
DR 2 18 4 3 'DirtDk'; DR 14 12 3 2 'DirtDk'; DR 24 20 5 3 'DirtDk'
DR 8 24 3 2 'DirtSpot'; DR 20 14 2 2 'DirtSpot'
# 草の層
DR 0 4 32 4 'GrassTop'
DR 0 4 32 1 'GrassHi'
DR 2 6 4 2 'GrassDk'; DR 12 6 5 2 'GrassDk'; DR 22 6 6 2 'GrassDk'
# 草の毛
DR 3 2 2 2 'GrassHi'; DR 8 3 1 1 'GrassHi'; DR 13 1 2 3 'GrassTop'
DR 19 2 1 2 'GrassHi'; DR 24 1 2 3 'GrassTop'; DR 29 3 2 1 'GrassHi'

# ======== 1: Dirt (x=32) ========
$ox=32
DR ($ox+0) 0 32 32 'Dirt'
DR ($ox+0) 0 32 2 'DirtHi'; DR ($ox+0) 30 32 2 'DirtDk'
DR ($ox+2) 6 5 4 'DirtHi'; DR ($ox+18) 3 4 3 'DirtHi'; DR ($ox+10) 20 6 3 'DirtHi'
DR ($ox+6) 12 3 3 'DirtDk'; DR ($ox+22) 15 4 4 'DirtDk'; DR ($ox+14) 8 3 2 'DirtDk'
DR ($ox+4) 22 2 2 'DirtSpot'; DR ($ox+26) 8 3 2 'DirtSpot'; DR ($ox+12) 26 2 2 'DirtSpot'
DR ($ox+8) 16 2 1 'DirtSpot'; DR ($ox+20) 24 3 2 'DirtSpot'

# ======== 2: Stone (x=64) ========
$ox=64
DR ($ox+0) 0 32 32 'Stone'
DR ($ox+0) 0 32 2 'StoneHi'; DR ($ox+0) 30 32 2 'StoneDk'
DR ($ox+4) 4 8 6 'StoneHi'; DR ($ox+18) 14 10 5 'StoneHi'
DR ($ox+2) 18 6 8 'StoneDk'; DR ($ox+20) 4 8 4 'StoneDk'
# ひび模様
DR ($ox+0) 10 32 1 'StoneLn'; DR ($ox+0) 22 32 1 'StoneLn'
DR ($ox+10) 0 1 10 'StoneLn'; DR ($ox+22) 10 1 12 'StoneLn'
DR ($ox+16) 22 1 10 'StoneLn'
# 小石テクスチャ
DR ($ox+6) 14 2 2 'StoneDk'; DR ($ox+14) 6 2 2 'StoneDk'; DR ($ox+26) 24 3 2 'StoneDk'

# ======== 3: Stone Brick (x=96) ========
$ox=96
DR ($ox+0) 0 32 32 'Brick'
# レンガ段1 (上半分)
DR ($ox+0) 0 15 14 'BrickHi'; DR ($ox+17) 0 15 14 'BrickDk'
DR ($ox+0) 14 32 2 'Mortar'
# レンガ段2 (下半分 オフセット)
DR ($ox+8) 16 16 14 'BrickHi'; DR ($ox+0) 16 6 14 'BrickDk'; DR ($ox+26) 16 6 14 'BrickDk'
DR ($ox+0) 30 32 2 'Mortar'
# 縦のモルタル線
DR ($ox+15) 0 2 14 'Mortar'; DR ($ox+7) 16 2 14 'Mortar'; DR ($ox+25) 16 2 14 'Mortar'
# ハイライトとシャドウ
DR ($ox+1) 1 14 1 'BrickHi'; DR ($ox+18) 1 13 1 'BrickHi'
DR ($ox+9) 17 14 1 'BrickHi'

# ======== 4: Dirt Wall (x=128) ========
$ox=128
DR ($ox+0) 0 32 32 'Wall'
DR ($ox+0) 0 32 2 'WallHi'
DR ($ox+4) 6 6 5 'WallHi'; DR ($ox+20) 16 8 4 'WallHi'; DR ($ox+10) 22 5 5 'WallHi'
DR ($ox+14) 4 4 3 'WallDk'; DR ($ox+2) 18 5 6 'WallDk'; DR ($ox+24) 6 5 4 'WallDk'
DR ($ox+8) 12 3 2 'WallDk'; DR ($ox+18) 26 4 3 'WallDk'

# ======== 5: Torch (x=160) ========
$ox=160
# 光のグロー
DR ($ox+8) 0 16 20 'TGlow'
# 棒
DR ($ox+14) 12 4 18 'TStick'; DR ($ox+15) 12 2 18 'Dirt'
# 炎外側
DR ($ox+12) 4 8 10 'TFlame1'
# 炎中側
DR ($ox+13) 5 6 7 'TFlame2'
# 炎芯
DR ($ox+14) 6 4 4 'TFlame3'
# 炎先端
DR ($ox+15) 2 2 3 'TFlame2'; DR ($ox+15) 1 2 1 'TFlame1'

# ======== 6: Chest Closed (x=192) ========
$ox=192
# 箱本体
DR ($ox+4) 10 24 18 'ChestW'
# 蓋
DR ($ox+3) 8 26 4 'ChestHi'
DR ($ox+4) 8 24 1 'ChestW'
# 境目
DR ($ox+4) 12 24 2 'ChestDk'
# 底部影
DR ($ox+4) 26 24 2 'ChestDk'
# 金具（中央ロック）
DR ($ox+13) 10 6 10 'ChestG'
DR ($ox+14) 11 4 8 'ChestGD'
DR ($ox+15) 13 2 2 'ChestG'
# 蓋の端の金属
DR ($ox+4) 9 2 3 'ChestG'; DR ($ox+26) 9 2 3 'ChestG'

# ======== 7: Chest Open (x=224) ========
$ox=224
# 箱本体
DR ($ox+4) 14 24 14 'ChestW'
DR ($ox+4) 26 24 2 'ChestDk'
# 開いた蓋 (上に跳ね上がり)
DR ($ox+3) 4 26 6 'ChestHi'
DR ($ox+4) 4 24 1 'ChestW'
DR ($ox+4) 9 24 1 'ChestDk'
# 箱の中（暗い）
DR ($ox+6) 14 20 10 'ChestIn'
# 中の光沢
DR ($ox+12) 16 4 3 'ChestGD'; DR ($ox+18) 18 3 2 'ChestGD'
# 蓋の金具
DR ($ox+14) 5 4 4 'ChestG'
# 箱の端金具
DR ($ox+4) 14 2 3 'ChestG'; DR ($ox+26) 14 2 3 'ChestG'

# ======== 8: Gold (x=256) ========
$ox=256
# 金塊メイン形状
DR ($ox+8) 8 16 16 'Gold'
# ハイライト（上面）
DR ($ox+10) 8 12 4 'GoldHi'
DR ($ox+12) 6 8 2 'GoldHi'
# 影（下面・側面）
DR ($ox+8) 20 16 4 'GoldDk'
DR ($ox+8) 16 2 8 'GoldDk'
DR ($ox+22) 16 2 8 'GoldDk'
# 底部の濃い影
DR ($ox+10) 22 12 2 'GoldSh'
# キラキラ
DR ($ox+12) 9 2 2 'GoldHi'; DR ($ox+18) 11 1 1 'GoldHi'

$bmp.Save("c:\Users\uta_0\.antigravity\tr\dev\tileset.png", [System.Drawing.Imaging.ImageFormat]::Png)
$fg.Dispose()
$bmp.Dispose()
Write-Host "tileset.png generated (9 frames, Terraria-style)"
