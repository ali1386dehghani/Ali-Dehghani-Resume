# Ali Dehghani — Resume (Auto-Built PDF)

رزومه‌ی LaTeX با قالب Arpa-Resume. با هر تغییر در همین مخزن، PDF **به‌صورت خودکار** ساخته و روی GitHub Pages منتشر می‌شود.

LaTeX resume built on the Arpa-Resume template. Every push rebuilds the PDF automatically (GitHub Actions) and publishes it on GitHub Pages.

## راه‌اندازی (Setup)

1. روی GitHub یک مخزن جدید بساز (مثلاً `resume`).
2. همه‌ی فایل‌های این پوشه را داخلش بگذار:
   - **سریع‌ترین راه:** در صفحه‌ی ساخت مخزن، گزینه‌ی «uploading an existing folder» — کل این پوشه را بکش و رها کن (پوشه‌ی `.github` هم باید همراهش بیاید).
   - یا با خط فرمان:
     ```bash
     git init
     git add .
     git commit -m "Resume: Ali Dehghani"
     git branch -M main
     git remote add origin https://github.com/ali1386dehghani/resume.git
     git push -u origin main
     ```
3. مهم: `Settings → Pages → Build and deployment → Source` را روی **GitHub Actions** بگذار.
4. تمام. تب **Actions** وضعیت ساخت را نشان می‌دهد و PDF این‌جا در دسترس است:
   - Artifact: تب Actions → آخرین اجرا → `resume`
   - لینک عمومی: `https://ali1386dehghani.github.io/resume/resume.pdf`

## ویرایش (Editing)

فایل‌های `.tex` را (مستقیم در گیت‌هاب یا محلی) ویرایش کن و commit بزن؛ PDF بلافاصله دوباره ساخته می‌شود:

| فایل | محتوا |
|---|---|
| `resume.tex` | فایل اصلی: نام، عنوان، راه‌های تماس، ترتیب بخش‌ها |
| `summary.tex` | خلاصه‌ی پروفایل |
| `skills.tex` | مهارت‌ها |
| `work.tex` | تجربه‌ی کاری |
| `projects.tex` | پروژه‌ها |
| `education.tex` | تحصیلات |
| `honors.tex` | افتخارات |

Build pipeline: `xu-cheng/latex-action@v4` (xelatex) → artifact → GitHub Pages. Copy of the workflow lives in `.github/workflows/build.yml` (same setup as [ar-pa/Arpa-Resume](https://github.com/ar-pa/Arpa-Resume)).
