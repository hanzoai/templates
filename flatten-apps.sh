#!/bin/bash

# Flatten all nested template directories into apps/*-suffix format

set -e

echo "🔄 Flattening apps/ directory structure..."
echo ""

# Brainwave
if [ -d "apps/brainwave/nextjs" ]; then
  mv "apps/brainwave/nextjs" "apps/brainwave-nextjs"
  rmdir "apps/brainwave" 2>/dev/null || rm -rf "apps/brainwave"
  echo "✓ brainwave/nextjs → brainwave-nextjs"
fi

# Bento Cards
if [ -d "apps/bento-cards/v1" ]; then
  mv "apps/bento-cards/v1" "apps/bento-cards-v1"
  echo "✓ bento-cards/v1 → bento-cards-v1"
fi
if [ -d "apps/bento-cards/v2-ai" ]; then
  mv "apps/bento-cards/v2-ai" "apps/bento-cards-v2-ai"
  echo "✓ bento-cards/v2-ai → bento-cards-v2-ai"
fi
if [ -d "apps/bento-cards/v3" ]; then
  mv "apps/bento-cards/v3" "apps/bento-cards-v3"
  echo "✓ bento-cards/v3 → bento-cards-v3"
fi
if [ -d "apps/bento-cards/v4-crypto" ]; then
  mv "apps/bento-cards/v4-crypto" "apps/bento-cards-v4-crypto"
  echo "✓ bento-cards/v4-crypto → bento-cards-v4-crypto"
fi
rmdir "apps/bento-cards" 2>/dev/null || rm -rf "apps/bento-cards"

# Bitcloud
if [ -d "apps/bitcloud/html" ]; then
  mv "apps/bitcloud/html" "apps/bitcloud-html"
  echo "✓ bitcloud/html → bitcloud-html"
fi
if [ -d "apps/bitcloud/react" ]; then
  mv "apps/bitcloud/react" "apps/bitcloud-react"
  echo "✓ bitcloud/react → bitcloud-react"
fi
rmdir "apps/bitcloud" 2>/dev/null || rm -rf "apps/bitcloud"

# Social
if [ -d "apps/social/nextjs" ]; then
  mv "apps/social/nextjs" "apps/social-nextjs"
  echo "✓ social/nextjs → social-nextjs"
fi
rmdir "apps/social" 2>/dev/null || rm -rf "apps/social"

# Xora
if [ -d "apps/xora/html" ]; then
  mv "apps/xora/html" "apps/xora-html"
  echo "✓ xora/html → xora-html"
fi
if [ -d "apps/xora/react" ]; then
  mv "apps/xora/react" "apps/xora-react"
  echo "✓ xora/react → xora-react"
fi
rmdir "apps/xora" 2>/dev/null || rm -rf "apps/xora"

# Folio
if [ -d "apps/folio/html" ]; then
  mv "apps/folio/html" "apps/folio-html"
  echo "✓ folio/html → folio-html"
fi
rmdir "apps/folio" 2>/dev/null || rm -rf "apps/folio"

# Kael Donovan
if [ -d "apps/kael-donovan/v1/kael-donovan" ]; then
  mv "apps/kael-donovan/v1/kael-donovan" "apps/kael-donovan-v1"
  echo "✓ kael-donovan/v1/kael-donovan → kael-donovan-v1"
fi
rm -rf "apps/kael-donovan" 2>/dev/null || true

# Flowmint Portfolio
if [ -d "apps/flowmint-portfolio/v1" ]; then
  mv "apps/flowmint-portfolio/v1" "apps/flowmint-portfolio-v1"
  echo "✓ flowmint-portfolio/v1 → flowmint-portfolio-v1"
fi
rmdir "apps/flowmint-portfolio" 2>/dev/null || rm -rf "apps/flowmint-portfolio"

# Fitness
if [ -d "apps/fitness/react" ]; then
  mv "apps/fitness/react" "apps/fitness-react"
  echo "✓ fitness/react → fitness-react"
fi
rmdir "apps/fitness" 2>/dev/null || rm -rf "apps/fitness"

# Code Templates
if [ -d "apps/code-templates/app" ]; then
  mv "apps/code-templates/app" "apps/code-app"
  echo "✓ code-templates/app → code-app"
fi
if [ -d "apps/code-templates/landing" ]; then
  mv "apps/code-templates/landing" "apps/code-landing"
  echo "✓ code-templates/landing → code-landing"
fi
rmdir "apps/code-templates" 2>/dev/null || rm -rf "apps/code-templates"

# Fusion V2
if [ -d "apps/fusion-v2-saas-nft/Fusion V2 - SaaS NFT Template" ]; then
  mv "apps/fusion-v2-saas-nft/Fusion V2 - SaaS NFT Template" "apps/fusion-v2-saas-nft-nextjs"
  echo "✓ fusion-v2-saas-nft/Fusion V2 - SaaS NFT Template → fusion-v2-saas-nft-nextjs"
fi
rmdir "apps/fusion-v2-saas-nft" 2>/dev/null || rm -rf "apps/fusion-v2-saas-nft"

# Streamline shadcn
if [ -d "apps/streamline-shadcn/streamline-nextjs-template-1.1.0" ]; then
  mv "apps/streamline-shadcn/streamline-nextjs-template-1.1.0" "apps/streamline-shadcn-nextjs"
  echo "✓ streamline-shadcn/... → streamline-shadcn-nextjs"
fi
rmdir "apps/streamline-shadcn" 2>/dev/null || rm -rf "apps/streamline-shadcn"

echo ""
echo "✅ Flattening complete!"
echo ""
echo "Next: Update templates-data.ts paths"
