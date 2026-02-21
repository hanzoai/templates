#!/bin/bash

cd screenshots

# Map old names to new names for missing screenshots
declare -A mappings=(
    ["hidden-oasis.png"]="oasis.png"
    ["digiversestudio.png"]="pixel.png"
    ["kalli-html.png"]="serif.png"
    ["innovise.png"]="catalyst.png"
)

# Check for other possible original names
if [ -f "consca.png" ]; then
    ln -sf consca.png construct.png
elif [ -f "consca.jpg" ]; then
    ln -sf consca.jpg construct.png
fi

if [ -f "bitcloud-html.png" ]; then
    ln -sf bitcloud-html.png cipher-html.png
elif [ -f "bitcloud.png" ]; then
    ln -sf bitcloud.png cipher-html.png
fi

if [ -f "jobfinderapp.png" ]; then
    ln -sf jobfinderapp.png jobfinder.png
elif [ -f "jobfinderapp.jpg" ]; then
    ln -sf jobfinderapp.jpg jobfinder.png
fi

if [ -f "unfixed-studio.png" ]; then
    ln -sf unfixed-studio.png unfixed.png
elif [ -f "unfixed-studio.jpg" ]; then
    ln -sf unfixed-studio.jpg unfixed.png
fi

# Create symlinks for found mappings
for old in "${!mappings[@]}"; do
    new="${mappings[$old]}"
    if [ -f "$old" ]; then
        echo "Creating symlink: $old -> $new"
        ln -sf "$old" "$new"
    fi
done

# Check for mosaic-react (bento-cards-v1-react)
if [ -f "bento-cards-v1-react.png" ]; then
    ln -sf bento-cards-v1-react.png mosaic-react.png
elif [ -f "bento-cards-v1.png" ]; then
    ln -sf bento-cards-v1.png mosaic-react.png
elif [ -f "mosaic.png" ]; then
    ln -sf mosaic.png mosaic-react.png
fi

echo "Done creating screenshot symlinks"
