# Templates Migration to @hanzo/ui - Complete

## Migration Summary (Latest Update)

Successfully migrated 4 business-focused templates to use @hanzo/ui component library with monochromatic color schemes.

### Templates Updated

1. **saas/** - SaaS boilerplate
   - ✅ Migrated to @hanzo/ui components
   - ✅ Applied monochromatic color scheme (black/gray)
   - ✅ Added comprehensive README with usage instructions
   - ✅ TypeScript strict mode enabled
   - ✅ Responsive design maintained

2. **startup/** - Startup toolkit
   - ✅ Migrated to @hanzo/ui components
   - ✅ Applied monochromatic color scheme
   - ✅ Added comprehensive README
   - ✅ TypeScript strict mode enabled
   - ✅ Responsive design maintained

3. **mobile/** - Mobile app builder
   - ✅ Migrated to @hanzo/ui components
   - ✅ Applied monochromatic color scheme
   - ✅ Mobile-first responsive design
   - ✅ Touch-optimized components
   - ✅ Added comprehensive README with mobile-specific guidance

4. **devtool/** - Development tools platform
   - ✅ Migrated to @hanzo/ui components
   - ✅ Applied monochromatic color scheme with developer aesthetics
   - ✅ Developer-focused styling with monospace fonts
   - ✅ Added comprehensive README with tool integration examples

### Key Changes Made

#### Component Migration
- Replaced all local button implementations with `@hanzo/ui/components` Button component
- Replaced custom cards with Card, CardContent, CardHeader, CardTitle components
- Updated all imports to use correct export paths (`@hanzo/ui/components`)

#### Color Scheme Updates
- Primary color: `#000000` (black)
- Secondary color: `#666666` (gray)
- Removed all colored gradients
- Applied consistent monochromatic theme across all templates

#### Import Pattern Fix
All @hanzo/ui components must be imported from the `/components` export:
```typescript
import { Button, Card, CardContent } from '@hanzo/ui/components'
```

---

# @hanzo/ui Template Migration & Standardization Plan

## Executive Summary
Comprehensive implementation plan for migrating all Hanzo templates to use the @hanzo/ui component library with standardized shadcn/ui patterns. This plan defines the strategy, technical requirements, and execution workflow for a parallel development effort.

## Download/Export System Implementation (Completed)

### Overview
Successfully implemented a comprehensive download and export functionality for the Hanzo template gallery, enabling users to download templates as ZIP files, create GitHub repositories, and deploy to various cloud platforms with a single click.

### Implementation Details

#### 1. Template Data Structure Updates
- Added new fields to the Template interface:
  - `downloadable?: boolean` - Flags if template can be downloaded
  - `templatePath?: string` - Path to template directory
  - `deployUrls?: object` - Platform-specific deployment URLs
    - Vercel, Netlify, Railway, Render support

#### 2. API Routes Created
- **`/api/download/[template]/route.ts`**: Generates ZIP files for templates
  - Archives template directory excluding node_modules, .git, build artifacts
  - Streams ZIP file to client for download
  - Maximum compression level (9) for smaller downloads

- **`/api/github/create/route.ts`**: Creates GitHub repositories from templates
  - Uses GitHub API with user authentication
  - Creates repository with README and template information
  - Includes deployment badges and quick start instructions

- **`/api/deploy/[platform]/route.ts`**: Handles platform deployments
  - Supports Vercel, Netlify, Railway, and Render
  - Generates platform-specific deployment URLs
  - Passes environment variables and configuration

#### 3. UI/UX Enhancements

##### Template Detail Page Updates
- **Download Button**: Primary action to download template as ZIP
- **Create GitHub Repo**: Creates new repository with template
- **Deploy Dropdown**: One-click deploy to multiple platforms
- **Installation Instructions**: Comprehensive setup guide with:
  - CLI installation commands
  - Alternative installation methods
  - Step-by-step quick start guide
  - Environment variable configuration

##### Gallery Page Updates
- Download button on each template card
- Loading states for async operations
- Disabled states for non-downloadable templates

#### 4. Features Implemented
- ✅ ZIP file generation and download
- ✅ GitHub repository creation with template
- ✅ One-click deploy buttons for:
  - Vercel
  - Netlify
  - Railway
  - Render
- ✅ Prominent installation instructions
- ✅ Environment variable guidance
- ✅ Multiple installation methods
- ✅ Responsive design for all screen sizes

### Technical Implementation

#### Dependencies Added
```json
{
  "archiver": "^7.0.0",
  "@types/archiver": "^6.0.0"
}
```

#### Key Functions
```typescript
// Download handler
const handleDownload = async (template: Template) => {
  const response = await fetch(`/api/download/${template.id}`)
  const blob = await response.blob()
  // Create download link and trigger download
}

// GitHub creation
const handleCreateGitHub = async () => {
  const response = await fetch('/api/github/create', {
    method: 'POST',
    body: JSON.stringify({templateId, repoName, description})
  })
  // Opens created repository
}

// Platform deployment
const handleDeploy = (platform: string) => {
  window.open(template.deployUrls[platform], '_blank')
}
```

### User Experience Flow
1. User browses template gallery
2. Clicks on template to view details
3. Can download ZIP, create GitHub repo, or deploy directly
4. Clear installation instructions guide setup
5. Environment variables documented for services

### Security Considerations
- GitHub token handled securely via headers
- File exclusion patterns prevent sensitive data in downloads
- API routes validate template existence and permissions

## 1. Migration Strategy

### 1.1 Component Library Standardization
```typescript
// All templates MUST use these imports exclusively
import { Button } from '@hanzo/ui/primitives'
import { Card, CardHeader, CardTitle, CardContent, CardFooter } from '@hanzo/ui/primitives'
import { Input } from '@hanzo/ui/primitives'
import { Select } from '@hanzo/ui/primitives'
import { Dialog } from '@hanzo/ui/primitives'
import { Badge } from '@hanzo/ui/primitives'
import { Avatar } from '@hanzo/ui/primitives'
import { Tabs } from '@hanzo/ui/primitives'
// ... all other components from @hanzo/ui/primitives
```

### 1.2 Migration Priority Order
1. **Phase 1 - Core Templates** (Already using @hanzo/ui)
   - gallery (preview system)
   - next/devforge
   - next/saasify
   - next/startupkit
   - next/mobilefirst
   - next/analyticsdash

2. **Phase 2 - Standalone Templates**
   - crypto-portfolio
   - blog-platform
   - ai-chat-interface
   - analytics-dashboard
   - ecommerce-storefront
   - kanban-board
   - markdown-editor
   - social-feed
   - video-streaming
   - saas-landing

3. **Phase 3 - Framework-Specific**
   - vite/* templates
   - Legacy templates (analytics, devtool, mobile, saas, startup)

### 1.3 Theme System Requirements
```css
/* Monochromatic theme with CSS variables */
:root {
  --background: 0 0% 100%;
  --foreground: 0 0% 3.9%;
  --card: 0 0% 100%;
  --card-foreground: 0 0% 3.9%;
  --primary: 0 0% 9%;
  --primary-foreground: 0 0% 98%;
  --secondary: 0 0% 96.1%;
  --secondary-foreground: 0 0% 9%;
  --muted: 0 0% 96.1%;
  --muted-foreground: 0 0% 45.1%;
  --accent: 0 0% 96.1%;
  --accent-foreground: 0 0% 9%;
  --destructive: 0 84.2% 60.2%;
  --destructive-foreground: 0 0% 98%;
  --border: 0 0% 89.8%;
  --input: 0 0% 89.8%;
  --ring: 0 0% 3.9%;
  --radius: 0.5rem;
}

.dark {
  --background: 0 0% 3.9%;
  --foreground: 0 0% 98%;
  --card: 0 0% 3.9%;
  --card-foreground: 0 0% 98%;
  --primary: 0 0% 98%;
  --primary-foreground: 0 0% 9%;
  --secondary: 0 0% 14.9%;
  --secondary-foreground: 0 0% 98%;
  --muted: 0 0% 14.9%;
  --muted-foreground: 0 0% 63.9%;
  --accent: 0 0% 14.9%;
  --accent-foreground: 0 0% 98%;
  --destructive: 0 62.8% 30.6%;
  --destructive-foreground: 0 0% 98%;
  --border: 0 0% 14.9%;
  --input: 0 0% 14.9%;
  --ring: 0 0% 83.1%;
}
```

## 2. Template Requirements

### 2.1 Technical Stack
- **Framework**: Next.js 15.3.5+ with App Router
- **React**: v19
- **TypeScript**: Strict mode enabled
- **Styling**: Tailwind CSS v3.4+
- **Components**: @hanzo/ui/primitives exclusively
- **Icons**: lucide-react
- **Animations**: framer-motion (optional)

### 2.2 Directory Structure
```
/template-name/
├── app/
│   ├── layout.tsx        # Root layout with theme provider
│   ├── page.tsx          # Main landing page
│   └── globals.css       # Theme variables & Tailwind
├── components/
│   ├── sections/         # Page sections (Hero, Features, etc)
│   └── shared/          # Shared components
├── lib/
│   ├── utils.ts         # cn() utility
│   └── site.ts          # Site configuration
├── public/              # Static assets
├── package.json         # Dependencies
├── tailwind.config.js   # Tailwind configuration
├── tsconfig.json        # TypeScript config
└── README.md           # Documentation
```

### 2.3 Component Patterns

#### Button Variants
```typescript
// MUST use these exact variants
<Button variant="default">Default</Button>
<Button variant="destructive">Destructive</Button>
<Button variant="outline">Outline</Button>
<Button variant="secondary">Secondary</Button>
<Button variant="ghost">Ghost</Button>
<Button variant="link">Link</Button>

// Sizes
<Button size="default">Default</Button>
<Button size="sm">Small</Button>
<Button size="lg">Large</Button>
<Button size="icon">Icon</Button>
```

#### Card Composition
```typescript
<Card>
  <CardHeader>
    <CardTitle>Title</CardTitle>
    <CardDescription>Description</CardDescription>
  </CardHeader>
  <CardContent>
    {/* Content */}
  </CardContent>
  <CardFooter>
    {/* Actions */}
  </CardFooter>
</Card>
```

#### Form Patterns
```typescript
// Use shadcn/ui form patterns with react-hook-form
import { Form, FormField, FormItem, FormLabel, FormControl, FormMessage } from '@hanzo/ui/primitives'
import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
```

### 2.4 Responsive Design
```typescript
// Mobile-first responsive classes
<div className="container mx-auto px-4 md:px-6 lg:px-8">
  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 md:gap-6 lg:gap-8">
    {/* Content */}
  </div>
</div>
```

## 3. Implementation Tasks

### 3.1 Per-Template Checklist
- [ ] Remove all local component definitions from `/components/ui`
- [ ] Update all imports to use `@hanzo/ui/primitives`
- [ ] Implement monochromatic theme in `globals.css`
- [ ] Ensure all Button components use standard variants
- [ ] Verify Card components use proper composition
- [ ] Add responsive breakpoints (mobile, tablet, desktop)
- [ ] Create comprehensive README with:
  - Installation instructions
  - Configuration options
  - Component usage examples
  - Deployment guide
- [ ] Add export/download functionality for template code
- [ ] Test on all screen sizes
- [ ] Verify dark mode toggle works correctly
- [ ] Run TypeScript strict mode checks
- [ ] Ensure no console errors or warnings

### 3.2 Missing Templates to Add
1. **AI Chat Interface** - Modern chat UI with streaming responses
2. **Search Interface** - AI-powered search with filters
3. **E-commerce Dashboard** - Complete shop management
4. **API Documentation** - Interactive API docs
5. **Admin Panel** - Full-featured admin dashboard
6. **Learning Platform** - Course management system
7. **Social Network** - Community platform
8. **Project Management** - Task and project tracking
9. **File Manager** - Cloud storage interface
10. **Email Client** - Modern email interface

## 4. Development Workflow

### 4.1 Parallel Processing Strategy
```bash
# Dev 1 - Core Templates
cd /Users/z/work/hanzo/templates/next/devforge && make migrate
cd /Users/z/work/hanzo/templates/next/saasify && make migrate
cd /Users/z/work/hanzo/templates/next/startupkit && make migrate

# Dev 2 - Content Templates  
cd /Users/z/work/hanzo/templates/blog-platform && make migrate
cd /Users/z/work/hanzo/templates/crypto-portfolio && make migrate
cd /Users/z/work/hanzo/templates/ai-chat-interface && make migrate

# Dev 3 - Business Templates
cd /Users/z/work/hanzo/templates/analytics-dashboard && make migrate
cd /Users/z/work/hanzo/templates/ecommerce-storefront && make migrate
cd /Users/z/work/hanzo/templates/saas-landing && make migrate

# Dev 4 - Tool Templates
cd /Users/z/work/hanzo/templates/kanban-board && make migrate
cd /Users/z/work/hanzo/templates/markdown-editor && make migrate
cd /Users/z/work/hanzo/templates/video-streaming && make migrate
```

### 4.2 Migration Script
```bash
#!/bin/bash
# migrate-template.sh

TEMPLATE_DIR=$1

# Remove local UI components
rm -rf $TEMPLATE_DIR/components/ui

# Update package.json
npm uninstall @radix-ui/react-* class-variance-authority clsx tailwind-merge
npm install @hanzo/ui@latest lucide-react

# Update imports (using sed/awk)
find $TEMPLATE_DIR -name "*.tsx" -o -name "*.ts" | xargs sed -i '' 's/from ".*\/components\/ui\//from "@hanzo\/ui\/primitives/g'

# Run TypeScript check
npm run type-check

# Test build
npm run build
```

### 4.3 Quality Assurance
```typescript
// Test suite for each template
describe('Template Migration', () => {
  test('All imports use @hanzo/ui', () => {
    // Scan for local UI imports
  })
  
  test('Theme variables are defined', () => {
    // Check CSS variables
  })
  
  test('Responsive on all breakpoints', () => {
    // Test at 375px, 768px, 1024px, 1440px
  })
  
  test('Dark mode toggle works', () => {
    // Verify theme switching
  })
  
  test('No TypeScript errors', () => {
    // Run tsc --noEmit
  })
})
```

## 5. Component Standardization Guide

### 5.1 Button Component
```typescript
// Standard implementation
import { Button } from '@hanzo/ui/primitives'

// Usage examples
<Button>Click me</Button>
<Button variant="outline" size="lg">Large Outline</Button>
<Button variant="ghost" size="icon">
  <Icon className="h-4 w-4" />
</Button>
<Button disabled>Disabled</Button>
<Button asChild>
  <Link href="/path">Link Button</Link>
</Button>
```

### 5.2 Card Component
```typescript
// Standard card pattern
import { Card, CardHeader, CardTitle, CardDescription, CardContent, CardFooter } from '@hanzo/ui/primitives'

<Card className="w-full max-w-md">
  <CardHeader>
    <CardTitle>Card Title</CardTitle>
    <CardDescription>Optional description</CardDescription>
  </CardHeader>
  <CardContent>
    <p>Card content goes here</p>
  </CardContent>
  <CardFooter className="flex justify-between">
    <Button variant="outline">Cancel</Button>
    <Button>Save</Button>
  </CardFooter>
</Card>
```

### 5.3 Form Components
```typescript
// Standard form pattern
import { Input } from '@hanzo/ui/primitives'
import { Label } from '@hanzo/ui/primitives'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@hanzo/ui/primitives'

<div className="space-y-4">
  <div className="space-y-2">
    <Label htmlFor="email">Email</Label>
    <Input id="email" type="email" placeholder="name@example.com" />
  </div>
  
  <div className="space-y-2">
    <Label htmlFor="role">Role</Label>
    <Select>
      <SelectTrigger id="role">
        <SelectValue placeholder="Select a role" />
      </SelectTrigger>
      <SelectContent>
        <SelectItem value="admin">Admin</SelectItem>
        <SelectItem value="user">User</SelectItem>
      </SelectContent>
    </Select>
  </div>
</div>
```

### 5.4 Layout Patterns
```typescript
// Container pattern
<div className="container mx-auto px-4 py-8 md:px-6 lg:px-8">
  {/* Content */}
</div>

// Grid pattern
<div className="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
  {/* Grid items */}
</div>

// Section pattern
<section className="py-12 md:py-16 lg:py-20">
  <div className="container">
    <h2 className="text-3xl font-bold tracking-tight md:text-4xl">
      Section Title
    </h2>
    {/* Section content */}
  </div>
</section>
```

### 5.5 Animation Patterns
```typescript
// With framer-motion
import { motion } from 'framer-motion'

<motion.div
  initial={{ opacity: 0, y: 20 }}
  animate={{ opacity: 1, y: 0 }}
  transition={{ duration: 0.5 }}
>
  {/* Animated content */}
</motion.div>

// Standard transitions
<div className="transition-all duration-200 hover:scale-105">
  {/* Hover effect */}
</div>
```

## 6. Testing Requirements

### 6.1 Unit Tests
- Component renders correctly
- Props are passed properly
- Event handlers work
- Accessibility requirements met

### 6.2 Integration Tests
- Theme switching works
- Forms submit correctly
- Navigation functions
- API calls succeed

### 6.3 E2E Tests
- User flows complete
- Responsive design works
- Performance metrics met
- No console errors

## 7. Documentation Requirements

### 7.1 README Template
```markdown
# [Template Name]

[Brief description]

## Features
- Feature 1
- Feature 2
- Feature 3

## Quick Start
\`\`\`bash
npm install
npm run dev
\`\`\`

## Configuration
[Configuration options]

## Components
[Component documentation]

## Deployment
[Deployment instructions]

## License
MIT
```

### 7.2 Component Documentation
- Props table
- Usage examples
- Styling options
- Accessibility notes

## 8. Success Criteria

### 8.1 Technical
- ✅ All imports from @hanzo/ui/primitives
- ✅ No local UI component definitions
- ✅ TypeScript strict mode passes
- ✅ No console errors/warnings
- ✅ Build succeeds
- ✅ Tests pass

### 8.2 Visual
- ✅ Consistent monochromatic theme
- ✅ Responsive on all devices
- ✅ Dark mode works
- ✅ Smooth animations
- ✅ Accessible (WCAG 2.1 AA)

### 8.3 Documentation
- ✅ Comprehensive README
- ✅ Component examples
- ✅ Configuration guide
- ✅ Deployment instructions

## 9. Execution Timeline

### Week 1
- Migrate Phase 1 templates (core templates)
- Create migration tooling/scripts
- Establish testing framework

### Week 2
- Migrate Phase 2 templates (standalone)
- Add missing high-value templates
- Perform integration testing

### Week 3
- Migrate Phase 3 templates (framework-specific)
- Complete documentation
- Final QA and deployment

## 10. Team Assignment

### Developer 1 - Core Templates Expert
- next/devforge
- next/saasify
- next/startupkit
- Create migration scripts

### Developer 2 - Content Templates Expert
- blog-platform
- changelog
- portfolio
- ai-chat-interface (new)

### Developer 3 - Business Templates Expert
- analytics-dashboard
- ecommerce-storefront
- saas-landing
- admin-panel (new)

### Developer 4 - Tool Templates Expert
- kanban-board
- markdown-editor
- video-streaming
- search-interface (new)

## Implementation Commands

```bash
# Start migration for a template
cd /Users/z/work/hanzo/templates/[template-name]
npm install @hanzo/ui@latest lucide-react
rm -rf components/ui
# Update all imports
# Test and validate

# Run tests
npm run type-check
npm run lint
npm run build
npm test

# Validate migration
grep -r "from.*components/ui" . # Should return nothing
grep -r "@hanzo/ui/primitives" . # Should find imports
```

## Conclusion

This plan provides a comprehensive roadmap for migrating all Hanzo templates to use the standardized @hanzo/ui component library. The parallel execution strategy allows for efficient development while maintaining quality standards. Each developer can work independently on their assigned templates while following the same patterns and requirements.

The key to success is:
1. Strict adherence to @hanzo/ui/primitives imports
2. Consistent use of the monochromatic theme system
3. Following shadcn/ui component patterns exactly
4. Thorough testing and documentation
5. Parallel execution for speed

Execute this plan with precision and we'll have a world-class template library that showcases the power of the Hanzo ecosystem.