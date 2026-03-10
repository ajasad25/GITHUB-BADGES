#!/bin/bash
# ============================================================
# GitHub Achievements — Media Downloader
# ============================================================
# Run this script to download all badge images from the
# drknzz/GitHub-Achievements repo into your local Media folder.
#
# Usage:  chmod +x download-media.sh && ./download-media.sh
# ============================================================

set -e

BASE_URL="https://raw.githubusercontent.com/drknzz/GitHub-Achievements/main/Media"
MEDIA_DIR="./Media"

echo "🏆 Downloading GitHub Achievement badge images..."
echo ""

# ── Helper ──────────────────────────────────────────────────
download() {
  local url="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  if curl -fsSL "$url" -o "$dest" 2>/dev/null; then
    echo "  ✅ $(basename "$dest")"
  else
    echo "  ⚠️  Failed: $(basename "$dest")"
  fi
}

# ── Achievement Badges ──────────────────────────────────────

echo "📦 Starstruck..."
for tier in "" "_Bronze" "_Silver" "_Gold"; do
  download "$BASE_URL/Badges/Star-Struck/PNG/StarStruck${tier}.png" \
           "$MEDIA_DIR/Badges/Star-Struck/PNG/StarStruck${tier}.png"
done
for i in 1 2 3 4 5 6; do
  download "$BASE_URL/Badges/Star-Struck/PNG/Skin-Tones/StarStruck_SkinTone${i}.png" \
           "$MEDIA_DIR/Badges/Star-Struck/PNG/Skin-Tones/StarStruck_SkinTone${i}.png"
done

echo "📦 Pull Shark..."
for tier in "" "_Bronze" "_Silver" "_Gold"; do
  download "$BASE_URL/Badges/Pull-Shark/PNG/PullShark${tier}.png" \
           "$MEDIA_DIR/Badges/Pull-Shark/PNG/PullShark${tier}.png"
done

echo "📦 Galaxy Brain..."
for tier in "" "_Bronze" "_Silver" "_Gold"; do
  download "$BASE_URL/Badges/Galaxy-Brain/PNG/GalaxyBrain${tier}.png" \
           "$MEDIA_DIR/Badges/Galaxy-Brain/PNG/GalaxyBrain${tier}.png"
done

echo "📦 Pair Extraordinaire..."
for tier in "" "_Bronze" "_Silver" "_Gold"; do
  download "$BASE_URL/Badges/Pair-Extraordinaire/PNG/PairExtraordinaire${tier}.png" \
           "$MEDIA_DIR/Badges/Pair-Extraordinaire/PNG/PairExtraordinaire${tier}.png"
done

echo "📦 Quickdraw..."
download "$BASE_URL/Badges/Quick-Draw/PNG/Skin-Tones/QuickDraw_SkinTone1.png" \
         "$MEDIA_DIR/Badges/Quick-Draw/PNG/Skin-Tones/QuickDraw_SkinTone1.png"
for i in 2 3 4 5 6; do
  download "$BASE_URL/Badges/Quick-Draw/PNG/Skin-Tones/QuickDraw_SkinTone${i}.png" \
           "$MEDIA_DIR/Badges/Quick-Draw/PNG/Skin-Tones/QuickDraw_SkinTone${i}.png"
done

echo "📦 YOLO..."
download "$BASE_URL/Badges/YOLO/PNG/YOLO_Badge.png" \
         "$MEDIA_DIR/Badges/YOLO/PNG/YOLO_Badge.png"

echo "📦 Public Sponsor..."
download "$BASE_URL/Badges/GitHub-Sponsor/PNG/GitHubSponsorBadge.png" \
         "$MEDIA_DIR/Badges/GitHub-Sponsor/PNG/GitHubSponsorBadge.png"

echo "📦 Heart On Your Sleeve..."
for tier in "" "_Bronze" "_Silver" "_Gold"; do
  download "$BASE_URL/Badges/Heart-on-your-sleeve/PNG/HeartOnYourSleeve${tier}.png" \
           "$MEDIA_DIR/Badges/Heart-on-your-sleeve/PNG/HeartOnYourSleeve${tier}.png"
done

echo "📦 Open Sourcerer..."
for tier in "" "_Bronze" "_Silver" "_Gold"; do
  download "$BASE_URL/Badges/Open-Sourcerer/PNG/OpenSourcerer${tier}.png" \
           "$MEDIA_DIR/Badges/Open-Sourcerer/PNG/OpenSourcerer${tier}.png"
done

# ── Retired Badges ──────────────────────────────────────────

echo "📦 Mars 2020 Contributor..."
download "$BASE_URL/Badges/Mars-2020-Contributor/PNG/Mars2020ContributorBadge.png" \
         "$MEDIA_DIR/Badges/Mars-2020-Contributor/PNG/Mars2020ContributorBadge.png"

echo "📦 Arctic Code Vault Contributor..."
download "$BASE_URL/Badges/2020-Arctic-Code-Vault-Contributor/PNG/2020ArcticCodeVaultBadge.png" \
         "$MEDIA_DIR/Badges/2020-Arctic-Code-Vault-Contributor/PNG/2020ArcticCodeVaultBadge.png"

# ── Highlight Badges ────────────────────────────────────────

echo "📦 Highlight badges..."
for mode in LightMode DarkMode; do
  download "$BASE_URL/Highlights/GitHub-Pro/SVG/GitHub-Pro_${mode}.svg" \
           "$MEDIA_DIR/Highlights/GitHub-Pro/SVG/GitHub-Pro_${mode}.svg"
  download "$BASE_URL/Highlights/Developer-Program-Member/SVG/DeveloperProgramMember_${mode}.svg" \
           "$MEDIA_DIR/Highlights/Developer-Program-Member/SVG/DeveloperProgramMember_${mode}.svg"
  download "$BASE_URL/Highlights/Security-Bug-Bounty-Hunter/SVG/Security-Bug-Bounty-Hunter_${mode}.svg" \
           "$MEDIA_DIR/Highlights/Security-Bug-Bounty-Hunter/SVG/Security-Bug-Bounty-Hunter_${mode}.svg"
  download "$BASE_URL/Highlights/GitHub-Campus-Expert/SVG/GitHub-Campus-Expert_${mode}.svg" \
           "$MEDIA_DIR/Highlights/GitHub-Campus-Expert/SVG/GitHub-Campus-Expert_${mode}.svg"
  download "$BASE_URL/Highlights/Security-Advisory-Credit/SVG/Security-Advisory-Credit_${mode}.svg" \
           "$MEDIA_DIR/Highlights/Security-Advisory-Credit/SVG/Security-Advisory-Credit_${mode}.svg"
done

echo ""
echo "============================================"
echo "✅ All badge images downloaded to ./Media/"
echo "============================================"
