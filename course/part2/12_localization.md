# Part 2 — 12: Localization (i18n)

> **Prev:** [11 — Responsive Design](11_responsive.md) | **Next:** [13 — Deployment](13_deployment.md)

**Flutter:** `intl` package + `.arb` files + generated `AppLocalizations`
**Angular:** Built-in `@angular/localize` (compile-time) or **Transloco** (runtime, recommended)

Transloco is simpler and supports runtime language switching — like Flutter's `intl` but without code generation.

---

## Setup: Transloco

```bash
ng add @jsverse/transloco
# Prompts:
# Default language: uk
# Available languages: uk, en
```

This creates:
```
src/assets/i18n/
  uk.json   ← Ukrainian (main locale — matches your intl main_locale: uk_UA)
  en.json   ← English
```

And adds to `app.config.ts`:
```typescript
provideTransloco({
  config: {
    availableLangs: ['uk', 'en'],
    defaultLang: 'uk',
    reRenderOnLangChange: true,
    prodMode: environment.production,
  },
  loader: TranslocoHttpLoader,
})
```

---

## Translation Files

```json
// src/assets/i18n/uk.json
{
  "nav": {
    "home": "Головна",
    "services": "Послуги",
    "courses": "Курси",
    "consultations": "Консультації",
    "articles": "Статті",
    "profile": "Профіль",
    "admin": "Адмін"
  },
  "auth": {
    "signIn": "Увійти",
    "signOut": "Вийти",
    "register": "Реєстрація",
    "email": "Email",
    "password": "Пароль",
    "firstName": "Ім'я",
    "lastName": "Прізвище"
  },
  "courses": {
    "title": "Курси",
    "buy": "Придбати",
    "purchased": "Придбано",
    "empty": "Курсів поки немає",
    "featured": "Рекомендовані курси"
  },
  "consultations": {
    "title": "Консультації",
    "book": "Записатися",
    "duration": "Тривалість: {{ duration }} хв"
  },
  "orders": {
    "title": "Мої замовлення",
    "status": {
      "pending": "В обробці",
      "paid": "Оплачено",
      "failed": "Помилка"
    },
    "empty": "Замовлень поки немає"
  },
  "profile": {
    "title": "Мій профіль",
    "orders": "Замовлення",
    "myCourses": "Мої курси"
  },
  "errors": {
    "invalidCredentials": "Невірний email або пароль",
    "serverError": "Помилка сервера. Спробуйте пізніше",
    "required": "Обов'язкове поле",
    "invalidEmail": "Невірний формат email"
  },
  "common": {
    "loading": "Завантаження...",
    "error": "Сталася помилка",
    "save": "Зберегти",
    "cancel": "Скасувати",
    "delete": "Видалити",
    "edit": "Редагувати",
    "create": "Створити",
    "back": "Назад"
  }
}
```

```json
// src/assets/i18n/en.json
{
  "nav": {
    "home": "Home",
    "services": "Services",
    "courses": "Courses",
    "consultations": "Consultations",
    "articles": "Articles",
    "profile": "Profile",
    "admin": "Admin"
  },
  "auth": {
    "signIn": "Sign In",
    "signOut": "Sign Out",
    "register": "Register",
    "email": "Email",
    "password": "Password",
    "firstName": "First Name",
    "lastName": "Last Name"
  },
  "courses": {
    "title": "Courses",
    "buy": "Buy",
    "purchased": "Purchased",
    "empty": "No courses available yet",
    "featured": "Featured Courses"
  },
  "consultations": {
    "title": "Consultations",
    "book": "Book Now",
    "duration": "Duration: {{ duration }} min"
  },
  "orders": {
    "title": "My Orders",
    "status": {
      "pending": "Processing",
      "paid": "Paid",
      "failed": "Failed"
    },
    "empty": "No orders yet"
  },
  "profile": {
    "title": "My Profile",
    "orders": "Orders",
    "myCourses": "My Courses"
  },
  "errors": {
    "invalidCredentials": "Invalid email or password",
    "serverError": "Server error. Please try again later",
    "required": "Required field",
    "invalidEmail": "Invalid email format"
  },
  "common": {
    "loading": "Loading...",
    "error": "An error occurred",
    "save": "Save",
    "cancel": "Cancel",
    "delete": "Delete",
    "edit": "Edit",
    "create": "Create",
    "back": "Back"
  }
}
```

---

## Using Translations in Templates

```html
<!-- Pipe syntax — like Flutter's AppLocalizations.of(context).coursesTitle -->
<h1>{{ 'courses.title' | transloco }}</h1>
<button>{{ 'courses.buy' | transloco }}</button>

<!-- With parameters (like ARB placeholders {duration}) -->
<p>{{ 'consultations.duration' | transloco:{ duration: consultation.duration } }}</p>

<!-- Structural directive — translate a block -->
<ng-container *transloco="let t">
  <h1>{{ t('courses.title') }}</h1>
  <button [disabled]="isLoading">{{ t('common.save') }}</button>
</ng-container>
```

---

## Using Translations in TypeScript

```typescript
import { TranslocoService } from '@jsverse/transloco';

@Component({ ... })
export class LoginComponent {
  constructor(private transloco: TranslocoService) {}

  onLoginError(): void {
    const msg = this.transloco.translate('errors.invalidCredentials');
    this.toast.error(msg);
  }

  // Switch language programmatically
  switchToEnglish(): void {
    this.transloco.setActiveLang('en');
  }
}
```

---

## Language Switcher Component

```typescript
@Component({
  standalone: true,
  selector: 'app-lang-switcher',
  template: `
    <button mat-icon-button [matMenuTriggerFor]="langMenu">
      <mat-icon>language</mat-icon>
    </button>
    <mat-menu #langMenu>
      <button mat-menu-item (click)="setLang('uk')">
        <span class="flag">🇺🇦</span> Українська
      </button>
      <button mat-menu-item (click)="setLang('en')">
        <span class="flag">🇬🇧</span> English
      </button>
    </mat-menu>
  `,
  imports: [MatButtonModule, MatIconModule, MatMenuModule],
})
export class LangSwitcherComponent {
  constructor(private transloco: TranslocoService) {}

  setLang(lang: string): void {
    this.transloco.setActiveLang(lang);
    localStorage.setItem('lang', lang);
  }
}
```

---

## Localized Date/Number Formatting

Use Angular's built-in pipes with locale:

```typescript
// app.config.ts
import { LOCALE_ID } from '@angular/core';
import { registerLocaleData } from '@angular/common';
import localeUk from '@angular/common/locales/uk';

registerLocaleData(localeUk);

providers: [
  { provide: LOCALE_ID, useValue: 'uk-UA' },
]
```

```html
<!-- Automatically uses uk-UA locale -->
{{ course.price | currency:'UAH':'symbol':'1.0-0' }}    <!-- ₴1,500 -->
{{ article.createdAt | date:'longDate' }}                 <!-- 30 квітня 2026 р. -->
{{ 0.25 | percent }}                                      <!-- 25% -->
```

---

## Further Reading

- [Transloco Documentation](https://jsverse.github.io/transloco/) — setup, API, lazy loading
- [Angular i18n (built-in)](https://angular.dev/guide/i18n) — alternative compile-time approach
- [Angular LOCALE_ID](https://angular.dev/api/core/LOCALE_ID) — locale-aware pipes
- [Angular Common Locales](https://github.com/angular/angular/tree/main/packages/common/locales) — all available locales

---

> **Prev:** [11 — Responsive Design](11_responsive.md) | **Next:** [13 — Deployment](13_deployment.md)
