const fs = require('fs');
const path = require('path');

const templates = [
  {
    name: 'devtool',
    brand: 'DevForge',
    tagline: 'Code Smarter, Ship Faster',
    description: 'The ultimate developer tools platform for modern development workflows',
    primaryColor: '#00d4ff',
    secondaryColor: '#00ff88',
    features: [
      'AI-Powered Code Generation',
      'Real-time Collaboration',
      'Automated Testing Suite',
      'CI/CD Pipeline Integration'
    ]
  },
  {
    name: 'mobile',
    brand: 'MobileFirst',
    tagline: 'Build Native Apps Without Code',
    description: 'Create stunning mobile applications with our no-code platform',
    primaryColor: '#8b5cf6',
    secondaryColor: '#ec4899',
    features: [
      'Drag & Drop Interface',
      'Cross-Platform Deploy',
      'Real Device Preview',
      'App Store Publishing'
    ]
  },
  {
    name: 'saas',
    brand: 'SaaSify',
    tagline: 'Launch Your SaaS in Days, Not Months',
    description: 'Everything you need to build, launch, and scale your SaaS business',
    primaryColor: '#3b82f6',
    secondaryColor: '#6366f1',
    features: [
      'Multi-tenant Architecture',
      'Subscription Management',
      'Analytics Dashboard',
      'Enterprise Security'
    ]
  },
  {
    name: 'startup',
    brand: 'StartupKit',
    tagline: 'Everything You Need to Launch',
    description: 'The complete toolkit for startup success',
    primaryColor: '#f97316',
    secondaryColor: '#fbbf24',
    features: [
      'Pitch Deck Builder',
      'Investor CRM',
      'Financial Modeling',
      'Team Collaboration'
    ]
  },
  {
    name: 'analytics',
    brand: 'AnalyticsDash',
    tagline: 'Data That Drives Decisions',
    description: 'Real-time analytics and insights for data-driven teams',
    primaryColor: '#14b8a6',
    secondaryColor: '#06b6d4',
    features: [
      'Real-time Dashboards',
      'Custom Metrics',
      'Predictive Analytics',
      'Data Export & API'
    ]
  }
];

templates.forEach(template => {
  const basePath = `/Users/z/work/hanzo/templates/${template.name}`;

  // Create package.json
  const packageJson = {
    name: `@hanzo/${template.name}-template`,
    version: '0.1.0',
    private: true,
    scripts: {
      dev: 'next dev',
      build: 'next build',
      start: 'next start',
      lint: 'next lint'
    },
    dependencies: {
      '@hanzo/ui': 'latest',
      '@radix-ui/react-slot': '^1.2.3',
      '@radix-ui/react-icons': '^1.3.2',
      'class-variance-authority': '^0.7.1',
      'clsx': '^2.1.1',
      'framer-motion': '^11.18.2',
      'lucide-react': '^0.525.0',
      'next': '15.3.5',
      'next-themes': '^0.4.6',
      'react': '^19.0.0',
      'react-dom': '^19.0.0',
      'tailwind-merge': '^3.3.1'
    },
    devDependencies: {
      '@types/node': '^20',
      '@types/react': '^19',
      '@types/react-dom': '^19',
      'eslint': '^9',
      'eslint-config-next': '15.3.5',
      'tailwindcss': '^3.4.17',
      'typescript': '^5'
    }
  };

  fs.writeFileSync(
    path.join(basePath, 'package.json'),
    JSON.stringify(packageJson, null, 2)
  );

  // Create lib/site.ts
  const siteConfig = `export const siteConfig = {
  name: "${template.brand}",
  tagline: "${template.tagline}",
  description: "${template.description}",
  url: "https://${template.name}.hanzo.ai",
  primaryColor: "${template.primaryColor}",
  secondaryColor: "${template.secondaryColor}",
  features: ${JSON.stringify(template.features, null, 2).replace(/\n/g, '\n  ')}
};

export type SiteConfig = typeof siteConfig;`;

  fs.writeFileSync(path.join(basePath, 'lib', 'site.ts'), siteConfig);

  // Create app/globals.css
  const globalsCss = `@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --primary: ${template.primaryColor};
    --secondary: ${template.secondaryColor};
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --border: 214.3 31.8% 91.4%;
  }

  .dark {
    --background: 222.2 84% 4.9%;
    --foreground: 210 40% 98%;
    --border: 217.2 32.6% 17.5%;
  }
}`;

  fs.writeFileSync(path.join(basePath, 'app', 'globals.css'), globalsCss);

  console.log(`Created ${template.brand} template files`);
});

console.log('All template files created!');