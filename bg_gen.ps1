Add-Type -AssemblyName System.Drawing

$baseDir = "c:\Users\uta_0\.antigravity\tr\dev"
$w = 4096
$h = 2048

# =============================================
# === 昼 (bg_day.png) ===
# =============================================
$bmp = New-Object System.Drawing.Bitmap $w, $h
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::LightSkyBlue)

$cc = [System.Drawing.Color]::White
$bc = New-Object System.Drawing.SolidBrush $cc
$g.FillEllipse($bc, 400, 320, 600, 200)
$g.FillEllipse($bc, 640, 240, 600, 280)
$g.FillEllipse($bc, 1400, 800, 400, 160)
$g.FillEllipse($bc, -80, 1000, 480, 200)
$g.FillEllipse($bc, 2600, 400, 720, 240)
$g.FillEllipse($bc, 3200, 600, 560, 200)
$g.FillEllipse($bc, 2200, 1200, 400, 160)
$bc.Dispose()

$mc = [System.Drawing.Color]::ForestGreen
$bm = New-Object System.Drawing.SolidBrush $mc
$pts = New-Object System.Drawing.Point[] 3
$pts[0] = New-Object System.Drawing.Point(-200, $h); $pts[1] = New-Object System.Drawing.Point(600, 1120); $pts[2] = New-Object System.Drawing.Point(1400, $h)
$g.FillPolygon($bm, $pts)
$pts[0] = New-Object System.Drawing.Point(800, $h); $pts[1] = New-Object System.Drawing.Point(1600, 800); $pts[2] = New-Object System.Drawing.Point(2400, $h)
$g.FillPolygon($bm, $pts)
$pts[0] = New-Object System.Drawing.Point(2000, $h); $pts[1] = New-Object System.Drawing.Point(3000, 1000); $pts[2] = New-Object System.Drawing.Point(4000, $h)
$g.FillPolygon($bm, $pts)
$pts[0] = New-Object System.Drawing.Point(3400, $h); $pts[1] = New-Object System.Drawing.Point(3920, 1320); $pts[2] = New-Object System.Drawing.Point(4400, $h)
$g.FillPolygon($bm, $pts)
$bm.Dispose()

$bmp.Save("$baseDir\bg_day.png", [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()
Write-Host "bg_day.png done"

# =============================================
# === 夕方 (bg_evening.png) ===
# =============================================
$bmp = New-Object System.Drawing.Bitmap $w, $h
$g = [System.Drawing.Graphics]::FromImage($bmp)
$skyC = [System.Drawing.Color]::FromArgb(255, 140, 80)
$g.Clear($skyC)

$cc = [System.Drawing.Color]::FromArgb(255, 210, 160)
$bc = New-Object System.Drawing.SolidBrush $cc
$g.FillEllipse($bc, 400, 320, 600, 200)
$g.FillEllipse($bc, 640, 240, 600, 280)
$g.FillEllipse($bc, 1400, 800, 400, 160)
$g.FillEllipse($bc, -80, 1000, 480, 200)
$g.FillEllipse($bc, 2600, 400, 720, 240)
$g.FillEllipse($bc, 3200, 600, 560, 200)
$g.FillEllipse($bc, 2200, 1200, 400, 160)
$bc.Dispose()

$mc = [System.Drawing.Color]::FromArgb(60, 80, 40)
$bm = New-Object System.Drawing.SolidBrush $mc
$pts = New-Object System.Drawing.Point[] 3
$pts[0] = New-Object System.Drawing.Point(-200, $h); $pts[1] = New-Object System.Drawing.Point(600, 1120); $pts[2] = New-Object System.Drawing.Point(1400, $h)
$g.FillPolygon($bm, $pts)
$pts[0] = New-Object System.Drawing.Point(800, $h); $pts[1] = New-Object System.Drawing.Point(1600, 800); $pts[2] = New-Object System.Drawing.Point(2400, $h)
$g.FillPolygon($bm, $pts)
$pts[0] = New-Object System.Drawing.Point(2000, $h); $pts[1] = New-Object System.Drawing.Point(3000, 1000); $pts[2] = New-Object System.Drawing.Point(4000, $h)
$g.FillPolygon($bm, $pts)
$pts[0] = New-Object System.Drawing.Point(3400, $h); $pts[1] = New-Object System.Drawing.Point(3920, 1320); $pts[2] = New-Object System.Drawing.Point(4400, $h)
$g.FillPolygon($bm, $pts)
$bm.Dispose()

$bmp.Save("$baseDir\bg_evening.png", [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()
Write-Host "bg_evening.png done"

# =============================================
# === 夜 (bg_night.png) ===
# =============================================
$bmp = New-Object System.Drawing.Bitmap $w, $h
$g = [System.Drawing.Graphics]::FromImage($bmp)
$skyC = [System.Drawing.Color]::FromArgb(15, 15, 60)
$g.Clear($skyC)

# -- 星をSetPixelで直接描画 (ブラシ不要) --
$starColor = [System.Drawing.Color]::FromArgb(255, 255, 220)
$rand = New-Object System.Random(42)
for ($i = 0; $i -lt 200; $i++) {
    $sx = $rand.Next(0, $w)
    $sy = $rand.Next(0, [int]($h * 0.55))
    $starSize = $rand.Next(2, 5)
    for ($dx = 0; $dx -lt $starSize; $dx++) {
        for ($dy = 0; $dy -lt $starSize; $dy++) {
            $px = $sx + $dx; $py = $sy + $dy
            if ($px -ge 0 -and $px -lt $w -and $py -ge 0 -and $py -lt $h) {
                $bmp.SetPixel($px, $py, $starColor)
            }
        }
    }
}
Write-Host "stars done"

# -- 月をSetPixelで描画 --
$moonColor = [System.Drawing.Color]::FromArgb(255, 255, 200)
$moonCX = 3290; $moonCY = 290; $moonR = 90
for ($mx = -$moonR; $mx -le $moonR; $mx++) {
    for ($my = -$moonR; $my -le $moonR; $my++) {
        if (($mx*$mx + $my*$my) -le ($moonR*$moonR)) {
            $px = $moonCX + $mx; $py = $moonCY + $my
            if ($px -ge 0 -and $px -lt $w -and $py -ge 0 -and $py -lt $h) {
                $bmp.SetPixel($px, $py, $moonColor)
            }
        }
    }
}
Write-Host "moon done"

# -- クレーター --
$craterColor = [System.Drawing.Color]::FromArgb(30, 30, 60)
$craters = @(
    @{cx=3260; cy=260; r=20},
    @{cx=3305; cy=325; r=15},
    @{cx=3232; cy=312; r=12}
)
foreach ($cr in $craters) {
    $cR = $cr.r
    for ($cx2 = -$cR; $cx2 -le $cR; $cx2++) {
        for ($cy2 = -$cR; $cy2 -le $cR; $cy2++) {
            if (($cx2*$cx2 + $cy2*$cy2) -le ($cR*$cR)) {
                $px = $cr.cx + $cx2; $py = $cr.cy + $cy2
                if ($px -ge 0 -and $px -lt $w -and $py -ge 0 -and $py -lt $h) {
                    $bmp.SetPixel($px, $py, $craterColor)
                }
            }
        }
    }
}
Write-Host "craters done"

# -- 雲 (暗い雲) --
$cc = [System.Drawing.Color]::FromArgb(40, 40, 80)
$bc = New-Object System.Drawing.SolidBrush $cc
$g.FillEllipse($bc, 400, 320, 600, 200)
$g.FillEllipse($bc, 640, 240, 600, 280)
$g.FillEllipse($bc, 1400, 800, 400, 160)
$g.FillEllipse($bc, -80, 1000, 480, 200)
$g.FillEllipse($bc, 2600, 400, 720, 240)
$g.FillEllipse($bc, 3200, 600, 560, 200)
$g.FillEllipse($bc, 2200, 1200, 400, 160)
$bc.Dispose()

# -- 山 (暗い山) --
$mc = [System.Drawing.Color]::FromArgb(10, 30, 15)
$bm = New-Object System.Drawing.SolidBrush $mc
$pts = New-Object System.Drawing.Point[] 3
$pts[0] = New-Object System.Drawing.Point(-200, $h); $pts[1] = New-Object System.Drawing.Point(600, 1120); $pts[2] = New-Object System.Drawing.Point(1400, $h)
$g.FillPolygon($bm, $pts)
$pts[0] = New-Object System.Drawing.Point(800, $h); $pts[1] = New-Object System.Drawing.Point(1600, 800); $pts[2] = New-Object System.Drawing.Point(2400, $h)
$g.FillPolygon($bm, $pts)
$pts[0] = New-Object System.Drawing.Point(2000, $h); $pts[1] = New-Object System.Drawing.Point(3000, 1000); $pts[2] = New-Object System.Drawing.Point(4000, $h)
$g.FillPolygon($bm, $pts)
$pts[0] = New-Object System.Drawing.Point(3400, $h); $pts[1] = New-Object System.Drawing.Point(3920, 1320); $pts[2] = New-Object System.Drawing.Point(4400, $h)
$g.FillPolygon($bm, $pts)
$bm.Dispose()

$bmp.Save("$baseDir\bg_night.png", [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()
Write-Host "bg_night.png done"

Write-Host "All backgrounds generated!"
