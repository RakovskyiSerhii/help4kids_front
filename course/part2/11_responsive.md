# Part 2 — 11: Responsive Design

> **Prev:** [10 — Shared Components](10_shared.md) | **Next:** [12 — Localization](12_localization.md)

**Flutter:** Three separate widget classes (`mobile_home_widget.dart`, `tablet_home_widget.dart`, `pc_home_widget.dart`)
**Angular:** Single template with CSS Grid/Flexbox + breakpoints. Much less code.

---

## CSS-First Approach (preferred)

Instead of three separate widget classes, use a single template and let CSS handle layout changes. This is simpler and more maintainable:

```scss
// src/styles.scss — define breakpoints once globally
$bp-mobile: 600px;
$bp-tablet: 960px;
$bp-desktop: 1280px;

// Usage in any component:
// @media (max-width: #{$bp-mobile}) { ... }
// @media (min-width: #{$bp-tablet}) { ... }
```

### Responsive Grid Pattern

```scss
// courses.component.scss
.courses-grid {
  display: grid;
  gap: 1.5rem;
  padding: 1.5rem;

  // Mobile: 1 column (default — mobile first)
  grid-template-columns: 1fr;

  // Tablet: 2 columns
  @media (min-width: 600px) {
    grid-template-columns: repeat(2, 1fr);
  }

  // Desktop: 3 columns
  @media (min-width: 960px) {
    grid-template-columns: repeat(3, 1fr);
    padding: 2rem 4rem;
  }

  // Large desktop: 4 columns
  @media (min-width: 1280px) {
    grid-template-columns: repeat(4, 1fr);
  }
}
```

### Responsive Container Width

```scss
// shared — max-width container
.page-container {
  width: 100%;
  margin: 0 auto;
  padding: 0 1rem;

  @media (min-width: 600px) { padding: 0 2rem; }
  @media (min-width: 960px) { max-width: 1200px; padding: 0 3rem; }
}
```

---

## Replacing Flutter's Responsive Widget Pattern

**Flutter (3 classes per section):**
```dart
class AboutWidget extends StatelessWidget {
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return MobileAboutWidget();
    if (width < 960) return TabletAboutWidget();
    return PCAboutWidget();
  }
}
```

**Angular (single template, CSS handles it):**
```html
<!-- about-section.component.html — one template, CSS does the rest -->
<section class="about-section">
  <div class="about-content">
    <div class="about-text">
      <h2>About Help4Kids</h2>
      <p>Trusted pediatric care since 2010.</p>
      <ul class="stats-list">
        @for (unit of units$ | async; track unit.label) {
          <li><strong>{{ unit.value }}</strong> {{ unit.label }}</li>
        }
      </ul>
    </div>
    <div class="about-image">
      <img src="/assets/about.jpg" alt="Our clinic" />
    </div>
  </div>
</section>
```

```scss
// about-section.component.scss
.about-content {
  display: flex;
  flex-direction: column;       // mobile: stacked
  gap: 2rem;

  @media (min-width: 960px) {
    flex-direction: row;        // desktop: side by side
    align-items: center;
  }
}

.about-text { flex: 1; }
.about-image {
  flex: 1;
  img { width: 100%; border-radius: 12px; }

  @media (max-width: 959px) { display: none; }  // hide image on mobile
}
```

---

## Angular CDK BreakpointObserver

Use when you need responsive behaviour in TypeScript (not just CSS). Replaces `MediaQuery.of(context)`:

```typescript
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { map } from 'rxjs';

@Component({ ... })
export class HeaderComponent {
  // Observable that emits true when viewport is mobile-sized
  isMobile$ = this.breakpoint.observe([Breakpoints.Handset, Breakpoints.TabletPortrait]).pipe(
    map(result => result.matches)
  );

  // Custom breakpoint
  isDesktop$ = this.breakpoint.observe('(min-width: 960px)').pipe(
    map(result => result.matches)
  );

  constructor(private breakpoint: BreakpointObserver) {}
}
```

```html
<!-- Use isMobile$ to swap entire components -->
@if (isMobile$ | async) {
  <app-mobile-nav (openMenu)="sidenav.toggle()" />
} @else {
  <app-desktop-nav [links]="navLinks" />
}
```

**Built-in Breakpoints:**

| Constant | Min/Max width |
|---|---|
| `Breakpoints.Handset` | up to 599px (portrait) |
| `Breakpoints.Tablet` | 600px–1279px |
| `Breakpoints.Web` | 1280px+ |
| `Breakpoints.HandsetPortrait` | small phone portrait |
| `Breakpoints.HandsetLandscape` | small phone landscape |

---

## CSS Variables for Theme + Responsive Spacing

```scss
// src/styles.scss
:root {
  // Spacing scale
  --space-xs: 0.25rem;
  --space-sm: 0.5rem;
  --space-md: 1rem;
  --space-lg: 1.5rem;
  --space-xl: 2rem;
  --space-2xl: 3rem;

  // Page layout
  --page-padding: 1rem;
  --max-content-width: 1200px;

  // Colors (override Material palette)
  --color-primary: #1565c0;
  --color-accent: #ff6d00;
  --color-background: #fafafa;
  --color-surface: #ffffff;
  --color-text: #212121;
  --color-text-secondary: #757575;

  @media (min-width: 600px) {
    --page-padding: 2rem;
  }

  @media (min-width: 960px) {
    --page-padding: 3rem;
  }
}
```

---

## Hero Section — Responsive

```html
<!-- hero.component.html -->
<section class="hero">
  <div class="hero-content">
    <h1 class="hero-title">Trusted Care for Your Children</h1>
    <p class="hero-subtitle">{{ data?.units?.[0]?.value }} patients served</p>
    <div class="hero-actions">
      <button mat-raised-button color="primary" size="large" routerLink="/consultations">
        Book Consultation
      </button>
      <button mat-stroked-button routerLink="/services">
        Our Services
      </button>
    </div>
  </div>
  <div class="hero-image">
    <img src="/assets/bg/hero.jpg" alt="Help4Kids Clinic" />
  </div>
</section>
```

```scss
.hero {
  display: grid;
  min-height: 60vh;
  padding: var(--page-padding);
  gap: 2rem;
  align-items: center;

  @media (min-width: 960px) {
    grid-template-columns: 1fr 1fr;
    min-height: 80vh;
    padding: 4rem var(--page-padding);
  }
}

.hero-title {
  font-size: clamp(2rem, 5vw, 3.5rem);  // fluid typography — scales with viewport
  font-weight: 700;
  line-height: 1.2;
}

.hero-image {
  display: none;

  @media (min-width: 960px) {
    display: block;
    img { width: 100%; border-radius: 16px; }
  }
}

.hero-actions {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
}
```

---

## Staff Grid — Responsive

```html
<section class="staff-section">
  <h2>Our Team</h2>
  <div class="staff-grid">
    @for (member of staff; track member.id) {
      <app-staff-card [member]="member" />
    }
  </div>
</section>
```

```scss
.staff-grid {
  display: grid;
  gap: 1.5rem;
  grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
  // auto-fill + minmax = responsive without media queries
  // cards are at least 220px, fill as many as fit per row
}
```

---

## Further Reading

- [CSS Grid Guide](https://css-tricks.com/snippets/css/complete-guide-grid/) — the definitive reference
- [Flexbox Guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Angular CDK BreakpointObserver](https://material.angular.io/cdk/layout/overview)
- [Fluid Typography with clamp()](https://css-tricks.com/min-max-and-clamp-are-css-math-functions-that-are-changing-how-we-think-about-responsive-design/)
- [CSS Custom Properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties) — CSS variables

---

> **Prev:** [10 — Shared Components](10_shared.md) | **Next:** [12 — Localization](12_localization.md)
