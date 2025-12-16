# Service Category Icons Mapping

This document provides SVG icon recommendations for each service category in the Help4Kids application.

## Icon Sources (Free & Open Source)

1. **Heroicons** (https://heroicons.com/) - Recommended
   - Clean, modern SVG icons
   - MIT License
   - Available in outline and solid styles

2. **Material Icons** (https://fonts.google.com/icons)
   - Comprehensive medical icon set
   - Apache 2.0 License
   - Can be downloaded as SVG

3. **Font Awesome Free** (https://fontawesome.com/icons)
   - Extensive icon library
   - Free tier available
   - CC BY 4.0 License

## Service Category to Icon Mapping

### 1. Консультативні прийоми лікарів-педіатрів в медичному центрі
**Suggested Icons:**
- Heroicons: `user-group` or `academic-cap`
- Material Icons: `medical_services` or `child_care`
- Font Awesome: `user-doctor` or `stethoscope`
- **Recommended:** `stethoscope` (medical consultation icon)

### 2. Гінекологія (Gynecology)
**Suggested Icons:**
- Heroicons: `heart` or `user`
- Material Icons: `pregnant_woman` or `medical_services`
- Font Awesome: `venus` or `user-doctor`
- **Recommended:** `venus` (gynecology symbol)

### 3. Кардіолог (Cardiologist)
**Suggested Icons:**
- Heroicons: `heart` (solid)
- Material Icons: `favorite` or `monitor_heart`
- Font Awesome: `heart-pulse` or `heartbeat`
- **Recommended:** `heart-pulse` or `monitor_heart`

### 4. Невролог (Neurologist)
**Suggested Icons:**
- Heroicons: `cpu-chip` or `brain`
- Material Icons: `psychology` or `memory`
- Font Awesome: `brain` or `head-side-brain`
- **Recommended:** `brain` or `psychology`

### 5. Ортопед-травматолог (Orthopedist-Traumatologist)
**Suggested Icons:**
- Heroicons: `wrench-screwdriver` or `cog-6-tooth`
- Material Icons: `healing` or `medical_services`
- Font Awesome: `bone` or `crutch`
- **Recommended:** `bone` or `crutch`

### 6. Хірург (Surgeon)
**Suggested Icons:**
- Heroicons: `scissors` or `wrench`
- Material Icons: `medical_services` or `healing`
- Font Awesome: `scalpel` or `user-doctor`
- **Recommended:** `scalpel` or `medical_services`

### 7. Дерматолог (Dermatologist)
**Suggested Icons:**
- Heroicons: `sparkles` or `face-smile`
- Material Icons: `face` or `spa`
- Font Awesome: `hand-sparkles` or `spa`
- **Recommended:** `spa` or `face`

### 8. Фототерапія (Phototherapy)
**Suggested Icons:**
- Heroicons: `sun` or `light-bulb`
- Material Icons: `light_mode` or `wb_sunny`
- Font Awesome: `sun` or `lightbulb`
- **Recommended:** `sun` or `light_mode`

### 9. УЗД діагностика (Ultrasound Diagnostics)
**Suggested Icons:**
- Heroicons: `signal` or `chart-bar`
- Material Icons: `monitor` or `healing`
- Font Awesome: `wave-square` or `monitor-waveform`
- **Recommended:** `monitor` or `wave-square`

### 10. Оформлення довідок (Documentation/Certificates)
**Suggested Icons:**
- Heroicons: `document-text` or `clipboard-document-check`
- Material Icons: `description` or `assignment`
- Font Awesome: `file-medical` or `certificate`
- **Recommended:** `document-text` or `file-medical`

### 11. Експрес-тести (Express Tests)
**Suggested Icons:**
- Heroicons: `beaker` or `flask`
- Material Icons: `science` or `biotech`
- Font Awesome: `flask` or `vial`
- **Recommended:** `flask` or `science`

### 12. Тест глюкоза (Glucose Test)
**Suggested Icons:**
- Heroicons: `beaker` or `chart-bar`
- Material Icons: `monitor_heart` or `biotech`
- Font Awesome: `vial` or `tint`
- **Recommended:** `vial` or `monitor_heart`

### 13. Клініка крові (Blood Clinic)
**Suggested Icons:**
- Heroicons: `heart` or `droplet`
- Material Icons: `water_drop` or `favorite`
- Font Awesome: `tint` or `droplet`
- **Recommended:** `tint` or `water_drop`

### 14. Клініка сечі (Urine Clinic)
**Suggested Icons:**
- Heroicons: `beaker` or `flask`
- Material Icons: `science` or `water_drop`
- Font Awesome: `flask` or `vial`
- **Recommended:** `flask` or `science`

### 15. ЕКГ з розшифровкою (ECG with Interpretation)
**Suggested Icons:**
- Heroicons: `chart-bar` or `signal`
- Material Icons: `monitor_heart` or `show_chart`
- Font Awesome: `heartbeat` or `wave-square`
- **Recommended:** `monitor_heart` or `heartbeat`

### 16. Маніпуляції (Manipulations/Procedures)
**Suggested Icons:**
- Heroicons: `wrench-screwdriver` or `cog-6-tooth`
- Material Icons: `build` or `medical_services`
- Font Awesome: `syringe` or `tools`
- **Recommended:** `syringe` or `build`

### 17. Прокол вух (система Studex75) (Ear Piercing)
**Suggested Icons:**
- Heroicons: `sparkles` or `star`
- Material Icons: `diamond` or `star`
- Font Awesome: `gem` or `star`
- **Recommended:** `diamond` or `gem`

### 18. Вакцинація (Vaccination)
**Suggested Icons:**
- Heroicons: `shield-check` or `beaker`
- Material Icons: `vaccines` or `shield`
- Font Awesome: `syringe` or `shield-virus`
- **Recommended:** `vaccines` or `syringe`

### 19. Послуга вакцинації вакциєю, придбаною особисто (Personal Vaccine Service)
**Suggested Icons:**
- Heroicons: `shopping-bag` or `beaker`
- Material Icons: `vaccines` or `shopping_bag`
- Font Awesome: `syringe` or `bag-shopping`
- **Recommended:** `vaccines` or `syringe`

## Implementation Steps

1. **Download Icons:**
   - Visit the recommended icon library websites
   - Search for the suggested icon names
   - Download as SVG format
   - Ensure icons are optimized (remove unnecessary metadata)

2. **Save Icons:**
   - Place SVG files in `/assets/icons/` directory
   - Use descriptive names: `ic_pediatric.svg`, `ic_gynecology.svg`, etc.
   - Follow existing naming convention (e.g., `ic_arrow_left.svg`)

3. **Update Code:**
   - Run `flutter pub run build_runner build` to regenerate assets
   - Update `ServiceItemWidget` to display icons if needed
   - Icons can be accessed via `Assets.icons.ic_pediatric.svg()`

4. **Update Database:**
   - Update `iconUrl` field in `service_categories` table with icon paths
   - Or use the icon name directly in the frontend code

## Quick Reference: Icon Names by Category

| Category | Icon Name | Library |
|----------|-----------|---------|
| Pediatric Consultations | `stethoscope` | Font Awesome |
| Gynecology | `venus` | Font Awesome |
| Cardiology | `heart-pulse` | Font Awesome |
| Neurology | `brain` | Font Awesome |
| Orthopedics | `bone` | Font Awesome |
| Surgery | `scalpel` | Font Awesome |
| Dermatology | `spa` | Material Icons |
| Phototherapy | `sun` | Heroicons |
| Ultrasound | `monitor` | Material Icons |
| Documentation | `file-medical` | Font Awesome |
| Express Tests | `flask` | Font Awesome |
| Glucose Test | `vial` | Font Awesome |
| Blood Clinic | `tint` | Font Awesome |
| Urine Clinic | `flask` | Font Awesome |
| ECG | `monitor_heart` | Material Icons |
| Manipulations | `syringe` | Font Awesome |
| Ear Piercing | `gem` | Font Awesome |
| Vaccination | `vaccines` | Material Icons |
| Personal Vaccine | `vaccines` | Material Icons |

## Notes

- All recommended icons are from free/open-source libraries
- Icons should be styled consistently (same stroke width, size, etc.)
- Consider using a single icon library for consistency
- Icons should be optimized for web/mobile display
- Test icons at different sizes (mobile, tablet, desktop)

