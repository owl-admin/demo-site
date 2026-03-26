<?php

namespace App\Support;

class DemoImage
{
    /**
     * 生成演示图片。
     */
    public static function make(string|int $seed, ?string $label = null, int $width = 320, int $height = 180): string
    {
        $seed = self::normalizeSeed($seed);
        [$startColor, $endColor] = self::palette($seed);
        $label = self::label($label);

        $circleX = (int)($width * 0.82);
        $circleY = (int)($height * 0.24);
        $circleR = (int)($height * 0.28);
        $waveY = (int)($height * 0.72);
        $peakY = (int)($height * 0.42);
        $tailY = (int)($height * 0.52);
        $textX = 24;
        $textY = $height - 28;

        $svg = <<<SVG
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {$width} {$height}">
  <defs>
    <linearGradient id="g" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0%" stop-color="{$startColor}" />
      <stop offset="100%" stop-color="{$endColor}" />
    </linearGradient>
  </defs>
  <rect width="{$width}" height="{$height}" rx="24" fill="url(#g)" />
  <circle cx="{$circleX}" cy="{$circleY}" r="{$circleR}" fill="rgba(255,255,255,0.18)" />
  <circle cx="52" cy="46" r="18" fill="rgba(255,255,255,0.12)" />
  <path d="M0 {$waveY} C78 {$peakY}, 154 {$height}, {$width} {$tailY} L{$width} {$height} L0 {$height} Z" fill="rgba(255,255,255,0.14)" />
  <text x="{$textX}" y="{$textY}" fill="#ffffff" font-size="24" font-family="Arial, Helvetica, sans-serif" font-weight="700">{$label}</text>
</svg>
SVG;

        return 'data:image/svg+xml;charset=UTF-8,' . rawurlencode($svg);
    }

    /**
     * 生成稳定的配色。
     *
     * @return array{string, string}
     */
    protected static function palette(int $seed): array
    {
        $palettes = [
            ['#44403c', '#78716c'],
            ['#7c2d12', '#c2410c'],
            ['#14532d', '#16a34a'],
            ['#881337', '#e11d48'],
            ['#134e4a', '#0f766e'],
            ['#3f3f46', '#71717a'],
        ];

        return $palettes[$seed % count($palettes)];
    }

    /**
     * 规范化种子值。
     */
    protected static function normalizeSeed(string|int $seed): int
    {
        return (int)sprintf('%u', crc32((string)$seed));
    }

    /**
     * 清洗图片文案。
     */
    protected static function label(?string $label): string
    {
        $label = trim((string)$label);

        // 空文案时使用默认值，避免图片内容为空。
        if ($label === '') {
            $label = 'DEMO IMAGE';
        }

        return htmlspecialchars(mb_substr($label, 0, 18), ENT_QUOTES, 'UTF-8');
    }
}
