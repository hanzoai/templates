#!/bin/bash

# List of 35 renamed templates from RENAME_SWARM_SUMMARY.md
declare -a templates=(
    "synapse"
    "circle"
    "prism"
    "canvas"
    "quantum"
    "forge"
    "savor"
    "mint"
    "mosaic"
    "matrix"
    "blocks"
    "cipher"
    "prism-react"
    "gleam"
    "kinetic"
    "cipher-react"
    "launch"
    "soar"
    "deploy"
    "loop"
    "edge"
    "studio"
    "vault"
    "metrics"
    "drive"
    "oasis"
    "pixel"
    "serif"
    "catalyst"
    "construct"
    "cipher-html"
    "beta"
    "mosaic-react"
    "jobfinder"
    "temple"
    "unfixed"
)

echo "=== Template Verification Report ==="
echo "Total templates to verify: ${#templates[@]}"
echo ""

fully_verified=0
missing_items=0
errors=0

for template in "${templates[@]}"; do
    dir_exists=false
    pkg_exists=false
    readme_exists=false
    screenshot_exists=false
    
    # Check directory
    if [ -d "apps/${template}" ]; then
        dir_exists=true
    fi
    
    # Check package.json
    if [ -f "apps/${template}/package.json" ]; then
        pkg_exists=true
        # Check if name matches
        pkg_name=$(grep '"name":' "apps/${template}/package.json" | head -1)
    fi
    
    # Check README.md
    if [ -f "apps/${template}/README.md" ]; then
        readme_exists=true
    fi
    
    # Check screenshot (multiple possible locations)
    if [ -f "screenshots/${template}.png" ] || [ -f "screenshots/${template}.jpg" ] || [ -f "screenshots/${template}.jpeg" ]; then
        screenshot_exists=true
    fi
    
    # Determine status
    if $dir_exists && $pkg_exists && $readme_exists && $screenshot_exists; then
        echo "✅ ${template} - FULLY VERIFIED"
        ((fully_verified++))
    elif $dir_exists; then
        echo "⚠️  ${template} - MISSING:"
        $pkg_exists || echo "    - package.json"
        $readme_exists || echo "    - README.md"
        $screenshot_exists || echo "    - screenshot"
        ((missing_items++))
    else
        echo "❌ ${template} - DIRECTORY NOT FOUND"
        ((errors++))
    fi
done

echo ""
echo "=== Summary ==="
echo "✅ Fully Verified: ${fully_verified}/35"
echo "⚠️  Missing Items: ${missing_items}/35"
echo "❌ Errors: ${errors}/35"
