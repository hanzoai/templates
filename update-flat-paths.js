#!/usr/bin/env node

const fs = require('fs');
const file = 'apps/gallery/app/templates-data.ts';
let content = fs.readFileSync(file, 'utf8');

const replacements = [
  ['apps/brainwave/nextjs', 'apps/brainwave-nextjs'],
  ['apps/social/nextjs', 'apps/social-nextjs'],
  ['apps/kael-donovan/v1/kael-donovan', 'apps/kael-donovan-v1'],
  ['apps/fusion-v2-saas-nft/Fusion V2 - SaaS NFT Template', 'apps/fusion-v2-saas-nft-nextjs'],
  ['apps/streamline-shadcn/streamline-nextjs-template-1.1.0', 'apps/streamline-shadcn-nextjs'],
  ['apps/flowmint-portfolio/v1', 'apps/flowmint-portfolio-v1'],
  ['apps/bento-cards/v2-ai/react', 'apps/bento-cards-v2-ai-react'],
  ['apps/bento-cards/v1/react', 'apps/bento-cards-v1-react'],
  ['apps/bento-cards/v2-ai', 'apps/bento-cards-v2-ai'],
  ['apps/bento-cards/v1', 'apps/bento-cards-v1'],
  ['apps/fitness/react', 'apps/fitness-react'],
  ['apps/bitcloud/react', 'apps/bitcloud-react'],
  ['apps/code-templates/app', 'apps/code-app'],
  ['apps/code-templates/landing', 'apps/code-landing'],
  ['apps/bento-cards/v3', 'apps/bento-cards-v3'],
  ['apps/zuzu-next-app', 'apps/zuzu'],
  ['apps/xora/html', 'apps/xora-html'],
  ['apps/bitcloud/html', 'apps/bitcloud-html'],
  ['apps/folio/html', 'apps/folio-html'],
  ['apps/xora/react', 'apps/xora-react'],
];

let updateCount = 0;
replacements.forEach(([oldPath, newPath]) => {
  const regex = new RegExp(oldPath.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), 'g');
  if (content.includes(oldPath)) {
    content = content.replace(regex, newPath);
    updateCount++;
    console.log(`✓ ${oldPath} → ${newPath}`);
  }
});

fs.writeFileSync(file, content);
console.log(`\n✅ Updated ${updateCount} template paths`);
