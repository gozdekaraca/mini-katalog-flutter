Add-Type -AssemblyName System.Drawing
$output = Join-Path $PSScriptRoot '..\assets\images\banner.png'
$directory = Split-Path -Parent $output
New-Item -ItemType Directory -Force -Path $directory | Out-Null
$bitmap = [System.Drawing.Bitmap]::new(1200, 480)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$rect = [System.Drawing.Rectangle]::new(0, 0, 1200, 480)
$brush = [System.Drawing.Drawing2D.LinearGradientBrush]::new($rect, [System.Drawing.Color]::FromArgb(49,92,85), [System.Drawing.Color]::FromArgb(214,232,218), 15)
$graphics.FillRectangle($brush, $rect)
$font = [System.Drawing.Font]::new('Segoe UI', 52, [System.Drawing.FontStyle]::Bold)
$small = [System.Drawing.Font]::new('Segoe UI', 24)
$white = [System.Drawing.Brushes]::White
$graphics.DrawString('Yeni sezon, sade seçimler', $font, $white, 60, 145)
$graphics.DrawString('Mini Katalog', $small, $white, 64, 225)
$bitmap.Save($output, [System.Drawing.Imaging.ImageFormat]::Png)
$small.Dispose(); $font.Dispose(); $brush.Dispose(); $graphics.Dispose(); $bitmap.Dispose()
