# Hanzo AI Color Guidelines

## Color Palette

### Primary Colors

#### Vibrant Orange
- **Hex**: `#FF6B35`
- **RGB**: `rgb(255, 107, 53)`
- **HSL**: `hsl(16, 100%, 60%)`
- **Usage**: Primary brand color, CTAs, key highlights
- **Represents**: Energy, innovation, forward momentum

#### Deep Blue
- **Hex**: `#004E89`
- **RGB**: `rgb(0, 78, 137)`
- **HSL**: `hsl(206, 100%, 27%)`
- **Usage**: Headers, stable elements, trust indicators
- **Represents**: Depth, reliability, technical expertise

#### Cyan Accent
- **Hex**: `#00D9FF`
- **RGB**: `rgb(0, 217, 255)`
- **HSL**: `hsl(189, 100%, 50%)`
- **Usage**: Accents, highlights, data visualization
- **Represents**: AI, digital innovation, transformation

### Supporting Colors

#### Neutral Palette
- **Pure White**: `#FFFFFF` - Backgrounds, clean spaces
- **Off-White**: `#F8F9FA` - Subtle backgrounds
- **Light Gray**: `#E9ECEF` - Borders, dividers
- **Medium Gray**: `#6C757D` - Secondary text
- **Dark Gray**: `#343A40` - Primary text
- **Pure Black**: `#000000` - Maximum contrast elements

#### Extended Palette

**Success States**
- **Success Green**: `#28A745` - Confirmations, positive states
- **Success Light**: `#D4EDDA` - Success backgrounds

**Warning States**
- **Warning Amber**: `#FFC107` - Cautions, pending states
- **Warning Light**: `#FFF3CD` - Warning backgrounds

**Error States**
- **Error Red**: `#DC3545` - Errors, critical alerts
- **Error Light**: `#F8D7DA` - Error backgrounds

**Info States**
- **Info Blue**: `#17A2B8` - Informational messages
- **Info Light**: `#D1ECF1` - Info backgrounds

## Color Combinations

### Recommended Pairings

1. **Hero Sections**
   - Background: Deep Blue (#004E89)
   - Text: White (#FFFFFF)
   - Accent: Vibrant Orange (#FF6B35)

2. **Call-to-Action Buttons**
   - Background: Vibrant Orange (#FF6B35)
   - Text: White (#FFFFFF)
   - Hover: Darker Orange (#E85A24)

3. **Cards & Components**
   - Background: White (#FFFFFF)
   - Border: Light Gray (#E9ECEF)
   - Accent: Cyan (#00D9FF)

4. **Dark Mode**
   - Background: Dark Gray (#343A40)
   - Surface: Medium Dark (#495057)
   - Text: Off-White (#F8F9FA)
   - Accent: Cyan (#00D9FF)

### Gradient Usage

#### Primary Gradient
```css
background: linear-gradient(135deg, #FF6B35 0%, #004E89 100%);
```
- **Usage**: Hero sections, feature highlights, premium elements
- **Direction**: 135° (diagonal, top-left to bottom-right)

#### Accent Gradient
```css
background: linear-gradient(90deg, #00D9FF 0%, #004E89 100%);
```
- **Usage**: Hover states, progress bars, data visualization
- **Direction**: 90° (left to right)

#### Subtle Gradient
```css
background: linear-gradient(180deg, rgba(0,217,255,0.1) 0%, rgba(0,78,137,0.05) 100%);
```
- **Usage**: Backgrounds, cards, subtle emphasis
- **Direction**: 180° (top to bottom)

## Accessibility

### Contrast Ratios (WCAG 2.1)

**Text on Backgrounds**
- White on Deep Blue: 8.59:1 (AAA) ✅
- Deep Blue on White: 8.59:1 (AAA) ✅
- Vibrant Orange on White: 3.14:1 (AA for large text) ⚠️
- White on Vibrant Orange: 3.14:1 (AA for large text) ⚠️
- Cyan on Deep Blue: 4.23:1 (AA) ✅

**Recommendations**:
- Use Vibrant Orange for large text (18pt+) or bold text (14pt+)
- For small body text, use Deep Blue or Dark Gray
- Always test color combinations with accessibility tools

### Color Blindness

**Deuteranopia (Red-Green)**:
- Orange may appear yellow-brown
- Blue remains distinct
- Always use additional indicators (icons, patterns) with color

**Protanopia (Red-Green)**:
- Similar to Deuteranopia
- Orange appears more muted
- Blue and Cyan remain clear

**Tritanopia (Blue-Yellow)**:
- Blue may appear greenish
- Orange remains distinct
- Cyan may be difficult to distinguish

**Solution**: Never rely on color alone—use icons, labels, or patterns as secondary indicators.

## Usage Guidelines

### Do's ✅

1. **Use Primary Colors for Brand Elements**
   - Logos should use exact brand colors
   - CTAs should use Vibrant Orange
   - Headers and navigation use Deep Blue

2. **Maintain Color Hierarchy**
   - Primary: Vibrant Orange
   - Secondary: Deep Blue
   - Tertiary: Cyan
   - Supporting: Grays

3. **Use Sufficient Contrast**
   - Test all text/background combinations
   - Aim for WCAG AAA (7:1) when possible
   - Minimum WCAG AA (4.5:1) for body text

4. **Apply Gradients Thoughtfully**
   - Use for hero sections and key highlights
   - Keep gradients subtle for backgrounds
   - Ensure text remains readable on gradients

### Don'ts ❌

1. **Don't Modify Brand Colors**
   - Never change hue, saturation, or brightness
   - Don't create unauthorized color variations
   - Don't substitute similar colors

2. **Don't Overuse Vibrant Colors**
   - Too much orange creates visual fatigue
   - Use cyan sparingly as accent only
   - Balance with neutral grays

3. **Don't Ignore Accessibility**
   - Never place orange text on white backgrounds
   - Don't use color as the only information indicator
   - Don't ignore contrast requirements

4. **Don't Mix with Competing Colors**
   - Avoid introducing new primary colors
   - Don't use colors from other brand palettes
   - Keep the palette consistent

## Dark Mode Adaptations

### Color Adjustments

When implementing dark mode:

1. **Backgrounds**
   - Light (#FFFFFF) → Dark Gray (#1A1A1A)
   - Off-White (#F8F9FA) → Medium Dark (#2D2D2D)

2. **Text**
   - Dark Gray (#343A40) → Off-White (#F8F9FA)
   - Medium Gray (#6C757D) → Light Gray (#CCCCCC)

3. **Brand Colors**
   - Keep Vibrant Orange (#FF6B35) - sufficient contrast
   - Deep Blue (#004E89) → Lighter Blue (#1A73E8) for visibility
   - Cyan (#00D9FF) - maintain as-is (good contrast)

4. **Borders & Dividers**
   - Light Gray (#E9ECEF) → Dark Border (#404040)

## Technical Implementation

### CSS Variables

```css
:root {
  /* Primary Colors */
  --hanzo-orange: #FF6B35;
  --hanzo-blue: #004E89;
  --hanzo-cyan: #00D9FF;
  
  /* Neutral Colors */
  --hanzo-white: #FFFFFF;
  --hanzo-off-white: #F8F9FA;
  --hanzo-light-gray: #E9ECEF;
  --hanzo-medium-gray: #6C757D;
  --hanzo-dark-gray: #343A40;
  --hanzo-black: #000000;
  
  /* State Colors */
  --hanzo-success: #28A745;
  --hanzo-warning: #FFC107;
  --hanzo-error: #DC3545;
  --hanzo-info: #17A2B8;
}

[data-theme="dark"] {
  --hanzo-blue: #1A73E8;
  --hanzo-white: #1A1A1A;
  --hanzo-off-white: #2D2D2D;
  --hanzo-light-gray: #404040;
  --hanzo-medium-gray: #CCCCCC;
  --hanzo-dark-gray: #F8F9FA;
  --hanzo-black: #FFFFFF;
}
```

### Tailwind Configuration

```typescript
module.exports = {
  theme: {
    extend: {
      colors: {
        hanzo: {
          orange: '#FF6B35',
          blue: '#004E89',
          cyan: '#00D9FF',
          gray: {
            50: '#F8F9FA',
            100: '#E9ECEF',
            500: '#6C757D',
            900: '#343A40',
          }
        }
      }
    }
  }
}
```

## Examples

### Marketing Website Hero
```html
<div style="background: linear-gradient(135deg, #FF6B35 0%, #004E89 100%); color: #FFFFFF;">
  <h1>Decentralized AI Compute</h1>
  <p>Building the future of AI infrastructure</p>
  <button style="background: #00D9FF; color: #FFFFFF;">Get Started</button>
</div>
```

### Dashboard Card
```html
<div style="background: #FFFFFF; border: 1px solid #E9ECEF;">
  <h3 style="color: #343A40;">Active Compute Jobs</h3>
  <p style="color: #6C757D;">24 running</p>
  <div style="background: linear-gradient(90deg, #00D9FF 0%, transparent 100%); height: 4px;"></div>
</div>
```

---

**Last Updated**: 2025-10-29  
**Version**: 1.0.0
