# Hanzo AI Typography Guidelines

## Font Families


**Purpose**: Primary typeface for all UI, web, and marketing materials

**Characteristics**:
- Modern, geometric sans-serif
- Excellent readability at all sizes
- Optimized for screens
- Open source (SIL Open Font License)

**Where to Use**:
- Website body text
- Application UI
- Marketing materials
- Documentation
- Presentations

**Download**: https://rsms.me/inter/

**Weights Available**:
- Thin (100) - Avoid, too light
- Extra Light (200) - Avoid, too light
- Light (300) - Use sparingly
- Regular (400) - Body text
- Medium (500) - Emphasis, subheadings
- Semi Bold (600) - Strong emphasis
- Bold (700) - Headings, CTAs
- Extra Bold (800) - Hero text
- Black (900) - Avoid, too heavy

### Code Typeface: JetBrains Mono

**Purpose**: Code samples, terminal output, technical documentation

**Characteristics**:
- Monospaced (all characters same width)
- Designed for developers
- Clear character differentiation (0 vs O, 1 vs l vs I)
- Ligatures for programming symbols

**Where to Use**:
- Code blocks
- Command line examples
- API documentation
- Technical specifications
- Developer tools

**Download**: https://www.jetbrains.com/lp/mono/

**Weights Available**:
- Light (300) - Light code samples
- Regular (400) - Primary code text
- Medium (500) - Emphasized code
- Bold (700) - Keywords, highlighting

## Type Scale

### Web/Digital Scale

Based on 16px base size with 1.25 ratio:

| Style | Size | Line Height | Weight | Usage |
|-------|------|-------------|--------|--------|
| Hero | 64px (4rem) | 72px (1.125) | 800 | Landing page hero |
| H1 | 48px (3rem) | 56px (1.167) | 700 | Page titles |
| H2 | 36px (2.25rem) | 44px (1.222) | 700 | Section headings |
| H3 | 28px (1.75rem) | 36px (1.286) | 600 | Subsection headings |
| H4 | 24px (1.5rem) | 32px (1.333) | 600 | Minor headings |
| H5 | 20px (1.25rem) | 28px (1.4) | 600 | Labels, small headings |
| H6 | 16px (1rem) | 24px (1.5) | 600 | Micro headings |
| Body Large | 20px (1.25rem) | 32px (1.6) | 400 | Lead paragraphs |
| Body | 16px (1rem) | 26px (1.625) | 400 | Default body text |
| Body Small | 14px (0.875rem) | 22px (1.571) | 400 | Secondary text |
| Caption | 12px (0.75rem) | 18px (1.5) | 400 | Captions, labels |
| Tiny | 10px (0.625rem) | 16px (1.6) | 500 | Micro text (use sparingly) |

### Print Scale

Based on 12pt base size:

| Style | Size | Leading | Weight | Usage |
|-------|------|---------|--------|--------|
| Display | 72pt | 80pt | Bold | Posters, large format |
| Title | 36pt | 44pt | Bold | Report titles |
| Heading 1 | 24pt | 32pt | Bold | Chapter headings |
| Heading 2 | 18pt | 26pt | Semi Bold | Section headings |
| Heading 3 | 14pt | 20pt | Semi Bold | Subsection headings |
| Body | 12pt | 18pt | Regular | Body text |
| Caption | 10pt | 14pt | Regular | Captions, footnotes |

## Type Pairing


**For**: Web, applications, documentation

```
Heading: Inter Bold 32px
Body: Inter Regular 16px
Code: JetBrains Mono 14px
```

**Example**:
```html
<h1 style="font-family: Zen, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; font-weight: 700; font-size: 32px;">
  Hamiltonian Market Maker
</h1>
<p style="font-family: Zen, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; font-weight: 400; font-size: 16px;">
  A novel AMM design for heterogeneous compute resources.
</p>
<code style="font-family: Zen Mono, ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace; font-size: 14px;">
  const hmm = new HamiltonianMarketMaker();
</code>
```

## Hierarchy & Rhythm

### Visual Hierarchy

**Establish Clear Levels**:
1. **Primary**: Hero text, page titles (largest, boldest)
2. **Secondary**: Section headings (large, bold)
3. **Tertiary**: Subsection headings (medium, semi-bold)
4. **Body**: Paragraph text (regular weight)
5. **Supporting**: Captions, labels (smaller, lighter)

**Example Structure**:
```
[Hero: 64px Bold]        ← Strongest emphasis
  [H2: 36px Bold]       ← Section breaks
    [H3: 28px Semi-Bold] ← Subsections
      [Body: 16px Regular] ← Content
        [Caption: 12px Regular] ← Meta info
```

### Vertical Rhythm

**Baseline Grid**: Use 8px baseline grid for consistency

**Spacing Multiples**: Use multiples of 8px (or 4px for fine-tuning)
- Paragraph spacing: 24px
- Section spacing: 48px
- Heading margins: 32px top, 16px bottom
- Line height: 1.5-1.6 for body text

**Example CSS**:
```css
h1 {
  margin-top: 48px;
  margin-bottom: 24px;
  line-height: 1.167;
}

h2 {
  margin-top: 40px;
  margin-bottom: 16px;
  line-height: 1.222;
}

p {
  margin-bottom: 24px;
  line-height: 1.625;
}
```

## Responsive Typography

### Mobile-First Approach

**Base Sizes** (320px viewport):
- Body: 14px → 16px at 768px
- H1: 32px → 48px at 768px
- H2: 24px → 36px at 768px

**Fluid Typography** (viewport-based scaling):
```css
/* Fluid font size between 320px and 1200px */
h1 {
  font-size: clamp(32px, 4vw + 16px, 64px);
}

body {
  font-size: clamp(14px, 1.5vw + 10px, 16px);
}
```

**Breakpoints**:
- **Mobile**: 320-767px (smaller text)
- **Tablet**: 768-1023px (medium text)
- **Desktop**: 1024px+ (full scale text)

### Responsive Line Length

**Optimal Characters Per Line**: 60-80 characters

**Implementation**:
```css
.content {
  max-width: 680px; /* ~70 chars at 16px */
  margin: 0 auto;
  padding: 0 24px;
}
```

## Accessibility

### Minimum Sizes

**WCAG 2.1 Guidelines**:
- Body text: Minimum 16px (1rem)
- Small text: Minimum 14px (0.875rem) for secondary information
- Avoid text smaller than 12px (0.75rem) unless absolutely necessary

### Contrast Requirements

**Text on Backgrounds**:
- Large text (18pt+/24px+): Minimum 3:1 contrast (AA)
- Normal text: Minimum 4.5:1 contrast (AA)
- Enhanced: 7:1 contrast (AAA) for better readability

**Hanzo Brand Colors**:
- Deep Blue (#004E89) on White: 8.59:1 ✅ (AAA)
- Vibrant Orange (#FF6B35) on White: 3.14:1 ⚠️ (Large text only)
- Dark Gray (#343A40) on White: 11.51:1 ✅ (AAA)

### Readability Best Practices

1. **Line Height**: 1.5-1.6 for body text (WCAG recommendation)
2. **Line Length**: 60-80 characters for optimal reading
3. **Alignment**: Left-align body text (easier for dyslexic readers)
4. **Letter Spacing**: Default (don't tighten body text)
5. **Font Weight**: Avoid weights below 400 for body text

## Typography in Context

### Website

**Navigation**:
```css
.nav-link {
  font-family: Zen, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  font-weight: 500;
  font-size: 16px;
  letter-spacing: -0.02em;
}
```

**Hero Section**:
```css
.hero-title {
  font-family: Zen, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  font-weight: 800;
  font-size: 64px;
  line-height: 1.125;
  letter-spacing: -0.03em; /* Tighter for large text */
}

.hero-subtitle {
  font-family: Zen, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  font-weight: 400;
  font-size: 20px;
  line-height: 1.6;
}
```

**Body Content**:
```css
.content p {
  font-family: Zen, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  font-weight: 400;
  font-size: 16px;
  line-height: 1.625;
  color: #343A40;
}
```

**Code Blocks**:
```css
pre code {
  font-family: Zen Mono, ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;
  font-weight: 400;
  font-size: 14px;
  line-height: 1.6;
}
```

### Documentation

**Technical Docs**:
- **Headings**: Inter Bold
- **Body**: Inter Regular 16px
- **Code**: JetBrains Mono 14px
- **Notes/Warnings**: Inter Medium with colored background

**Example Structure**:
```markdown


The API uses Bearer tokens for authentication. (Inter Regular 16px)

```javascript (JetBrains Mono 14px)
const response = await fetch('/api/v1/auth', {
  headers: {
    'Authorization': 'Bearer YOUR_TOKEN'
  }
});
```

> **Note**: Tokens expire after 24 hours. (Inter Medium 14px)
```

### Presentations

**Title Slide**:
- Title: Inter Extra Bold 72px
- Subtitle: Inter Regular 32px
- Speaker: Inter Medium 24px

**Content Slides**:
- Heading: Inter Bold 48px
- Body: Inter Regular 24px
- Bullet points: Inter Regular 20px
- Code: JetBrains Mono 18px

**Tips**:
- Larger text for projection
- Higher contrast for visibility
- Less text per slide
- Consistent hierarchy throughout

### Marketing Materials

**Print Ads**:
- Headline: Inter Extra Bold, large
- Body: Inter Regular, readable at distance
- CTA: Inter Bold, prominent

**Social Media Graphics**:
- Primary text: Inter Bold 48-64px
- Secondary text: Inter Regular 24-32px
- Always test legibility at thumbnail size

## Web Font Loading

### Implementation

**Using Google Fonts** (if hosted):
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="" rel="stylesheet">
```

**Self-Hosted** (recommended for performance):
```css
```

**CSS Variables**:
```css
:root {
  --font-sans: Zen, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  --font-mono: Zen Mono, ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;
}

body {
  font-family: Zen, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
}

code, pre {
  font-family: Zen Mono, ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;
}
```

### Performance Optimization

1. **Font Subsetting**: Include only necessary characters/weights
2. **WOFF2 Format**: Use WOFF2 (best compression)
3. **Preload**: Preload critical fonts
4. **Font-Display**: Use `swap` to prevent invisible text

```html
<link rel="preload" href="/fonts/Inter-Regular.woff2" as="font" type="font/woff2" crossorigin>
```

## Common Mistakes to Avoid

### ❌ Don't

1. **Too Many Weights**: Don't use more than 4-5 font weights
2. **Too Small**: Don't use text smaller than 12px
3. **All Caps**: Don't overuse ALL CAPS (reduces readability)
4. **Too Wide**: Don't let lines exceed 100 characters
5. **Too Tight**: Don't reduce letter-spacing on body text
6. **Too Many Fonts**: Stick to Inter + JetBrains Mono
7. **Centered Body Text**: Don't center-align long paragraphs
8. **Low Contrast**: Don't use light gray text on white
9. **Inconsistent Hierarchy**: Don't skip heading levels
10. **Stretching/Condensing**: Don't artificially modify font width

### ✅ Do

1. **Limit Weights**: Use Regular (400), Medium (500), Semi-Bold (600), Bold (700)
2. **Readable Sizes**: 16px minimum for body text
3. **Title Case**: Use Title Case for headings
4. **Optimal Width**: 60-80 characters per line
5. **Standard Spacing**: Use default letter-spacing for body
6. **Two Fonts Max**: Inter for UI, JetBrains Mono for code
7. **Left-Align**: Left-align body text and paragraphs
8. **Strong Contrast**: Dark text on light, or light on dark
9. **Clear Hierarchy**: Consistent heading levels
10. **Maintain Proportions**: Use original font proportions

---

**Last Updated**: 2025-10-29  
**Version**: 1.0.0
