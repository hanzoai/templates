#!/bin/bash

# Generate layout and page files for each template
TEMPLATES=("devtool" "mobile" "saas" "startup" "analytics")

for template in "${TEMPLATES[@]}"; do
  echo "Creating components for $template..."

  # Create layout.tsx
  cat > /Users/z/work/hanzo/templates/$template/app/layout.tsx << 'LAYOUT'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'
import { siteConfig } from '@/lib/site'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: `${siteConfig.name} - ${siteConfig.tagline}`,
  description: siteConfig.description,
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        {children}
      </body>
    </html>
  )
}
LAYOUT

  # Create page.tsx
  cat > /Users/z/work/hanzo/templates/$template/app/page.tsx << 'PAGE'
import { Hero } from '@/components/sections/hero'
import { Features } from '@/components/sections/features'

export default function Home() {
  return (
    <main className="min-h-screen">
      <Hero />
      <Features />
    </main>
  )
}
PAGE

  # Create Hero component
  cat > /Users/z/work/hanzo/templates/$template/components/sections/hero.tsx << 'HERO'
import { siteConfig } from '@/lib/site'

export function Hero() {
  return (
    <section className="relative py-24 px-4">
      <div className="max-w-7xl mx-auto text-center">
        <h1 className="text-5xl md:text-6xl font-bold mb-6">
          {siteConfig.name}
        </h1>
        <p className="text-2xl md:text-3xl text-gray-600 dark:text-gray-400 mb-8">
          {siteConfig.tagline}
        </p>
        <p className="text-lg text-gray-500 dark:text-gray-500 max-w-2xl mx-auto mb-12">
          {siteConfig.description}
        </p>
        <div className="flex gap-4 justify-center">
          <button
            className="px-8 py-3 rounded-lg font-medium text-white"
            style={{ backgroundColor: siteConfig.primaryColor }}
          >
            Get Started
          </button>
          <button
            className="px-8 py-3 rounded-lg font-medium border-2"
            style={{ borderColor: siteConfig.secondaryColor, color: siteConfig.secondaryColor }}
          >
            Learn More
          </button>
        </div>
      </div>
    </section>
  )
}
HERO

  # Create Features component
  cat > /Users/z/work/hanzo/templates/$template/components/sections/features.tsx << 'FEATURES'
import { siteConfig } from '@/lib/site'

export function Features() {
  return (
    <section className="py-24 px-4 bg-gray-50 dark:bg-gray-900">
      <div className="max-w-7xl mx-auto">
        <h2 className="text-3xl md:text-4xl font-bold text-center mb-12">
          Key Features
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {siteConfig.features.map((feature, index) => (
            <div
              key={index}
              className="p-6 bg-white dark:bg-gray-800 rounded-lg shadow-lg"
            >
              <div
                className="w-12 h-12 rounded-lg mb-4"
                style={{
                  background: `linear-gradient(135deg, ${siteConfig.primaryColor}, ${siteConfig.secondaryColor})`
                }}
              />
              <h3 className="text-lg font-semibold mb-2">{feature}</h3>
              <p className="text-gray-600 dark:text-gray-400">
                Powerful tools and features to enhance your workflow.
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
FEATURES

done

echo "All components created!"