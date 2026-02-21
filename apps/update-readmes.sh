#!/bin/bash

# Array of templates with descriptions
declare -a TEMPLATES=(
    "ai-chat-interface:Modern chat UI with streaming responses and markdown support"
    "ecommerce-storefront:Complete online store with cart and product management"
    "analytics-dashboard:Data visualization dashboard with charts and metrics"
    "saas-landing:High-converting landing page with pricing and features"
    "social-feed:Twitter/X-like social feed with posts and interactions"
    "kanban-board:Trello-like task board with drag-and-drop"
    "markdown-editor:Live markdown editor with preview and export"
    "crypto-portfolio:Cryptocurrency portfolio tracker with live prices"
    "blog-platform:Medium-like blog with articles and authors"
    "video-streaming:YouTube-like video platform with player and comments"
)

for template_entry in "${TEMPLATES[@]}"; do
    IFS=':' read -r template description <<< "$template_entry"

    # Convert template name to title case
    title=$(echo "$template" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')

    cat > "/Users/z/work/hanzo/templates/$template/README.md" << EOF
# $title

$description

Built with [@hanzo/ui](https://github.com/hanzoai/ui) components - a modern React component library based on Radix UI and Tailwind CSS.

## 🚀 Quick Start

### Deploy to Hanzo Cloud

[![Deploy to Hanzo Cloud](https://img.shields.io/badge/Deploy%20to-Hanzo%20Cloud-purple?style=for-the-badge&logo=rocket)](https://hanzo.app/deploy?template=https://github.com/hanzoai/template-$template)

**Instant deployment** - Click to deploy this template to Hanzo Cloud. If you're not signed in, we'll create a public repo for you and you can start editing immediately!

### Edit on Hanzo

[![Edit on Hanzo](https://img.shields.io/badge/Edit%20on-Hanzo-blue?style=for-the-badge&logo=react)](https://hanzo.app/edit/github/hanzoai/template-$template)

**Cloud IDE** - Click to open this template in Hanzo's cloud development environment. No local setup required!

### Local Development

\`\`\`bash
# Clone this template
git clone https://github.com/hanzoai/template-$template.git
cd $template

# Install dependencies
npm install
# or
pnpm install

# Start development server
npm run dev
# or
pnpm dev

# Open http://localhost:3000
\`\`\`

## 🚢 Deploy to Hugging Face

This template includes a built-in publish option for Hugging Face Spaces:

1. **Login to Hugging Face** in your terminal:
   \`\`\`bash
   huggingface-cli login
   \`\`\`

2. **Use the built-in publish command**:
   \`\`\`bash
   npm run publish-hf
   # or
   pnpm publish-hf
   \`\`\`

   This will automatically:
   - Create a new Space in your HF account
   - Configure it for Next.js deployment
   - Push all necessary files
   - Your app will be live at: \`https://huggingface.co/spaces/YOUR_USERNAME/$template\`

3. **Or manually push** to an existing Space:
   \`\`\`bash
   git remote add hf https://huggingface.co/spaces/YOUR_USERNAME/$template
   git push hf main
   \`\`\`

## 🎨 Features

EOF

    # Add template-specific features
    case "$template" in
        "ai-chat-interface")
            cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'
- **Modern Design**: Clean, responsive UI with violet/purple theme
- **Streaming Responses**: Real-time message streaming
- **Markdown Support**: Rich text formatting in messages
- **Dark Mode**: Built-in dark mode support
- **TypeScript**: Full type safety
- **Production Ready**: Optimized for performance
EOF
            ;;
        "ecommerce-storefront")
            cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'
- **Product Grid**: Beautiful product showcase with filters
- **Shopping Cart**: Full cart functionality with quantity controls
- **Filters & Search**: Advanced product filtering
- **Responsive Design**: Works perfectly on all devices
- **Dark Mode**: Built-in dark mode support
- **TypeScript**: Full type safety
EOF
            ;;
        "analytics-dashboard")
            cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'
- **Metric Cards**: Key performance indicators at a glance
- **Interactive Charts**: Beautiful data visualizations
- **Real-time Updates**: Live data refresh
- **Responsive Layout**: Adapts to any screen size
- **Dark Mode**: Built-in dark mode support
- **TypeScript**: Full type safety
EOF
            ;;
        "saas-landing")
            cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'
- **Hero Section**: Eye-catching header with CTA
- **Pricing Tiers**: Beautiful pricing comparison
- **Feature Grid**: Showcase product capabilities
- **Testimonials**: Social proof section
- **Dark Mode**: Built-in dark mode support
- **TypeScript**: Full type safety
EOF
            ;;
        "social-feed")
            cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'
- **Post Creation**: Create and share posts
- **Comments**: Engage with community
- **Real-time Updates**: Live feed refresh
- **User Profiles**: Avatar and user info
- **Dark Mode**: Built-in dark mode support
- **TypeScript**: Full type safety
EOF
            ;;
        "kanban-board")
            cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'
- **Drag & Drop**: Intuitive task management
- **Multiple Columns**: Organize workflow stages
- **Task Cards**: Rich task information
- **Priority Labels**: Visual task prioritization
- **Dark Mode**: Built-in dark mode support
- **TypeScript**: Full type safety
EOF
            ;;
        "markdown-editor")
            cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'
- **Live Preview**: See changes in real-time
- **Syntax Highlighting**: Code block support
- **Export Options**: Download as MD or HTML
- **Toolbar**: Quick formatting buttons
- **Dark Mode**: Built-in dark mode support
- **TypeScript**: Full type safety
EOF
            ;;
        "crypto-portfolio")
            cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'
- **Portfolio Tracking**: Monitor holdings
- **Live Prices**: Real-time price updates
- **Charts**: Historical price charts
- **Profit/Loss**: Track performance
- **Dark Mode**: Built-in dark mode support
- **TypeScript**: Full type safety
EOF
            ;;
        "blog-platform")
            cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'
- **Article Editor**: Rich text editing
- **Categories**: Organize content
- **Comments**: Reader engagement
- **Author Profiles**: Writer showcase
- **Dark Mode**: Built-in dark mode support
- **TypeScript**: Full type safety
EOF
            ;;
        "video-streaming")
            cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'
- **Video Player**: Custom video controls
- **Comments**: Viewer engagement
- **Related Videos**: Content discovery
- **Playlists**: Video collections
- **Dark Mode**: Built-in dark mode support
- **TypeScript**: Full type safety
EOF
            ;;
    esac

    # Add common footer
    cat >> "/Users/z/work/hanzo/templates/$template/README.md" << 'EOF'

## 📦 What's Included

- Next.js 14 with App Router
- React 18 with Server Components
- TypeScript configuration
- Tailwind CSS with custom theme
- ESLint and Prettier configs
- @hanzo/ui component library
- Lucide React icons
- Hugging Face deployment config

## 🛠️ Customization

### Theme Colors

Edit `tailwind.config.js` to customize the color scheme:

```js
theme: {
  extend: {
    colors: {
      primary: {
        DEFAULT: "hsl(var(--primary))",
        foreground: "hsl(var(--primary-foreground))",
      },
      // Add your custom colors
    }
  }
}
```

### Components

All UI components are in `components/ui/`. They're built with:
- Radix UI primitives for accessibility
- Tailwind CSS for styling
- Full TypeScript support

## 📚 Documentation

- [Hanzo Documentation](https://hanzo.app/docs)
- [@hanzo/ui Components](https://github.com/hanzoai/ui)
- [Template Gallery](https://huggingface.co/spaces/hanzo-community/gallery)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

Built with ❤️ by [Hanzo AI](https://hanzo.ai)
EOF

    echo "✅ Updated README for $template"
done

echo "🎉 All README files updated with Deploy to Hanzo Cloud buttons!"