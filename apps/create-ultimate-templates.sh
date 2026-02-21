#!/bin/bash

echo "🚀 Creating Ultimate Hanzo Templates with Next.js + Vite"
echo "========================================================"

# Template configurations
TEMPLATES=(
  "devforge:DevForge:Developer Tools Platform:#00d4ff:#00ff88"
  "mobilefirst:MobileFirst:Mobile App Builder:#8b5cf6:#ec4899"
  "saasify:SaaSify:SaaS Business Platform:#3b82f6:#6366f1"
  "startupkit:StartupKit:Startup Launch Toolkit:#f97316:#fbbf24"
  "analyticsdash:AnalyticsDash:Analytics Dashboard:#14b8a6:#06b6d4"
)

# Create base directories
mkdir -p next vite shared

# Shared dependencies for all templates
SHARED_DEPS='"@hanzo/ui": "latest",
    "@radix-ui/react-accordion": "^1.2.3",
    "@radix-ui/react-alert-dialog": "^1.2.3",
    "@radix-ui/react-aspect-ratio": "^1.2.3",
    "@radix-ui/react-avatar": "^1.2.3",
    "@radix-ui/react-checkbox": "^1.2.3",
    "@radix-ui/react-collapsible": "^1.2.3",
    "@radix-ui/react-context-menu": "^2.3.3",
    "@radix-ui/react-dialog": "^1.2.3",
    "@radix-ui/react-dropdown-menu": "^2.3.3",
    "@radix-ui/react-hover-card": "^1.2.3",
    "@radix-ui/react-label": "^2.2.3",
    "@radix-ui/react-menubar": "^1.2.3",
    "@radix-ui/react-navigation-menu": "^1.3.3",
    "@radix-ui/react-popover": "^1.2.3",
    "@radix-ui/react-progress": "^1.2.3",
    "@radix-ui/react-radio-group": "^1.3.3",
    "@radix-ui/react-scroll-area": "^1.3.3",
    "@radix-ui/react-select": "^2.3.3",
    "@radix-ui/react-separator": "^1.2.3",
    "@radix-ui/react-slider": "^1.3.3",
    "@radix-ui/react-slot": "^1.2.3",
    "@radix-ui/react-switch": "^1.2.3",
    "@radix-ui/react-tabs": "^1.2.3",
    "@radix-ui/react-toast": "^1.3.3",
    "@radix-ui/react-toggle": "^1.2.3",
    "@radix-ui/react-toggle-group": "^1.2.3",
    "@radix-ui/react-tooltip": "^1.2.3",
    "class-variance-authority": "^0.7.1",
    "clsx": "^2.1.1",
    "framer-motion": "^11.18.2",
    "lucide-react": "^0.456.0",
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "tailwind-merge": "^3.3.1",
    "vaul": "^1.1.2",
    "sonner": "^1.7.2",
    "recharts": "^2.15.0",
    "@react-three/fiber": "^8.18.0",
    "@react-three/drei": "^9.125.0",
    "three": "^0.172.0",
    "lottie-react": "^2.4.0",
    "react-hot-toast": "^2.4.1",
    "react-intersection-observer": "^9.14.0",
    "react-parallax-tilt": "^1.7.246",
    "react-type-animation": "^3.3.0",
    "@splinetool/react-spline": "^4.0.0",
    "react-confetti": "^6.1.0",
    "react-spring": "^9.7.5"'

# Create Next.js templates
for template in "${TEMPLATES[@]}"; do
  IFS=: read -r id name description primary secondary <<< "$template"

  echo "Creating Next.js version: $name"

  DIR="next/$id"
  mkdir -p $DIR/{app,components,lib,public}

  # Create package.json for Next.js
  cat > $DIR/package.json << EOF
{
  "name": "@hanzo/$id-next",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev --turbo",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    $SHARED_DEPS,
    "next": "15.3.5",
    "next-themes": "^0.4.6",
    "@next/font": "15.3.5"
  },
  "devDependencies": {
    "@types/node": "^20",
    "@types/react": "^19",
    "@types/react-dom": "^19",
    "@types/three": "^0.172.0",
    "eslint": "^9",
    "eslint-config-next": "15.3.5",
    "tailwindcss": "^3.4.17",
    "typescript": "^5",
    "postcss": "^8.5.6",
    "autoprefixer": "^10.4.21"
  }
}
EOF

  # Create Vite version
  VITE_DIR="vite/$id"
  mkdir -p $VITE_DIR/{src,public}

  echo "Creating Vite version: $name"

  # Create package.json for Vite
  cat > $VITE_DIR/package.json << EOF
{
  "name": "@hanzo/$id-vite",
  "version": "0.1.0",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview",
    "lint": "eslint ."
  },
  "dependencies": {
    $SHARED_DEPS
  },
  "devDependencies": {
    "@types/react": "^19",
    "@types/react-dom": "^19",
    "@types/three": "^0.172.0",
    "@vitejs/plugin-react": "^4.3.4",
    "eslint": "^9",
    "eslint-plugin-react": "^7.38.0",
    "eslint-plugin-react-hooks": "^4.6.2",
    "tailwindcss": "^3.4.17",
    "typescript": "^5",
    "vite": "^6.0.7",
    "postcss": "^8.5.6",
    "autoprefixer": "^10.4.21"
  }
}
EOF

done

echo "✨ Template structure created! Now generating components..."