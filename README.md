# HDI_4DWritePro_Link

![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue&logo=4d)
![version](https://img.shields.io/static/v1?label=4D&message=21%2B&color=blue)

**How Do I** insert links into a 4D Write Pro document, and then read them back?

A 4D "How Do I" (HDI) example. It shows how to set and get hyperlinks on text and images in a 4D Write Pro area using the `wk link url` attribute.

## Requirements

- 4D 21 or later (project mode)
- A valid 4D Write Pro license (the splash dialog tells you if it is missing)

## Features

| Demo | What it shows |
|------|---------------|
| Set a link on text | Select "Sony" in the Write Pro area, enter a URL and click **Set Link** |
| Set a link on an image | Select the 4D logo and set a link on it the same way |
| Get a link | Select linked text ("Apple") and click **Get Link** to read the URL back |
| Style precedence | Country names show that text styles override the default link style |
| Save / open / export | Round-trip the document as `.4wp` (`Resources/doc.4wp`) or export it as HTML |
| Dynamic expression | **Insert Date** inserts a `Current date` formula with `ST INSERT EXPRESSION` |

## Key commands

```4d
// Set a link on the current selection
$range:=WP Selection range(*; "WriteProArea")
WP SET ATTRIBUTES($range; wk link url; $url)

// Read it back
WP Get attributes($range; wk link url; $url)
```

The Set Link buttons are enabled only when the selection is not empty (`On Selection Change` in `ObjectMethods/WriteProArea.4dm`).

## Points of interest

- **Startup pattern** – `00_Start` reuses an existing splash window if there is one, otherwise it opens the splash through `CALL WORKER` and a non-blocking `DIALOG(...; *)`. State is carried in `Form`, not in interprocess variables.
- **Graceful failure** – without a 4D Write Pro license the **Close** button returns to design mode (`INVOKE ACTION(ak return to design mode)`) instead of quitting 4D.
- **Sample data** – `Resources/*.4ie` / `*.4si` are import files; `00_Start` imports them into any empty table at first launch.
- **Menus** – standard actions (`quit`, `undo`, `cut`, `copy`, `paste`, ...) are used instead of wrapper methods.
- **Localisation** – XLIFF for English and Japanese in `Resources/{en,ja}.lproj` (`menu`, `messages`, one file per form or table). Static text uses `:xliff:` and code uses `Localized string`. Code samples shown in the form (`WP SET ATTRIBUTES(...)`) are deliberately not translated.
- **Appearance** – dark mode through `automatic` colours and `prefers-color-scheme` rules in `styleSheets.css`. Push buttons get 27 px (macOS Tahoe Liquid Glass) or 23 px (classic) heights from `styleSheets_mac.css`.

## Project layout

```
Project/Sources/
  Forms/HDI            splash dialog (license check)
  Forms/HDI2           demo form (Write Pro area, link buttons)
  TableForms/          input/output forms for [Person] and [SAMPLES]
  Methods/00_Start     startup / menu entry point
  styleSheets*.css     dark mode and platform styles
Resources/
  doc.4wp              the sample Write Pro document
  {en,ja}.lproj/       XLIFF files
```

## Origin

This project started as a binary `.4DB` example database distributed with 4D v16 R4. It was converted to a project with 4D 21 and then modernised with the help of GitHub Copilot.

## References

- Blog post: <https://blog.4d.com/add-an-hyperlink-to-your-company-logo-in-4d-write-pro/>
- Original download: <https://download.4d.com/Demos/4D_v16_R4/HDI_4DWritePro_Link.zip>
- [`WP SET ATTRIBUTES`](https://developer.4d.com/docs/WritePro/commands/wp-set-attributes) / [`WP Get attributes`](https://developer.4d.com/docs/WritePro/commands/wp-get-attributes)
- [4D Write Pro attributes](https://developer.4d.com/docs/WritePro/user-legacy/attributes)
- [Stylesheets in 4D forms](https://developer.4d.com/docs/FormEditor/stylesheets)
