Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap 128, 32
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::Transparent)

function DrawColor {
    param ($c, $x, $y, $w, $h)
    $brush = New-Object System.Drawing.SolidBrush($c)
    $g.FillRectangle($brush, $x, $y, $w, $h)
    $brush.Dispose()
}

$cSkin = [System.Drawing.Color]::FromArgb(255, 255, 218, 185)
$cHair = [System.Drawing.Color]::FromArgb(255, 255, 105, 180)
$cDress = [System.Drawing.Color]::FromArgb(255, 255, 69, 0)
$cEye = [System.Drawing.Color]::FromArgb(255, 0, 0, 0)
$cShoe = [System.Drawing.Color]::FromArgb(255, 139, 69, 19)

# Frame 0: Idle
DrawColor $cHair 8 2 16 16
DrawColor $cSkin 10 6 12 10
DrawColor $cEye 18 10 2 2
DrawColor $cDress 10 16 12 10
DrawColor $cSkin 14 18 4 6
DrawColor $cSkin 10 26 4 4
DrawColor $cSkin 18 26 4 4
DrawColor $cShoe 10 30 4 2
DrawColor $cShoe 18 30 4 2

# Frame 1: Walk1
DrawColor $cHair 40 1 16 16
DrawColor $cSkin 42 5 12 10
DrawColor $cEye 50 9 2 2
DrawColor $cDress 42 15 12 10
DrawColor $cSkin 44 17 4 6
DrawColor $cSkin 40 25 4 4
DrawColor $cSkin 52 25 4 4
DrawColor $cShoe 40 29 4 2
DrawColor $cShoe 52 29 4 2

# Frame 2: Walk2
DrawColor $cHair 72 3 16 16
DrawColor $cSkin 74 7 12 10
DrawColor $cEye 82 11 2 2
DrawColor $cDress 74 17 12 10
DrawColor $cSkin 76 19 4 6
DrawColor $cSkin 78 27 4 3
DrawColor $cShoe 78 30 4 2

# Frame 3: Jump
DrawColor $cHair 104 0 16 17
DrawColor $cSkin 106 4 12 10
DrawColor $cEye 114 8 2 2
DrawColor $cDress 106 14 12 10
DrawColor $cSkin 112 10 4 6
DrawColor $cSkin 104 24 6 4
DrawColor $cSkin 114 26 4 4
DrawColor $cShoe 104 28 6 2
DrawColor $cShoe 114 30 4 2

$bmp.Save("c:\Users\uta_0\.antigravity\tr\player.png", [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()
