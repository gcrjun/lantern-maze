# Lantern Maze (Android app)

A memory maze game: the whole maze shows for a moment, then only a faint lamp lights the way.

## How the app is built

- `www/` holds the game (one HTML page, fonts bundled for offline play).
- `android/` is the Capacitor Android project (landscape lock, full screen, vibration, back button).
- Every push to `main` runs GitHub Actions (`.github/workflows/android.yml`), which builds a debug APK
  and attaches it to the **test-build** release as `lantern-maze-test.apk`.

## Installing the test build on a phone

1. Open this repository's **Releases** page on the Android phone and tap **Lantern Maze test build**.
2. Download `lantern-maze-test.apk` and open it.
3. If asked, allow installing apps from this source (browser or Files app), then tap **Install**.

## Changing the game

Replace `www/index.html` and push to `main`. A new APK appears on the release a few minutes later.

## Before a Play Store release

- Confirm the app ID `kr.lanternmaze.game` in `capacitor.config.json` and `android/app/build.gradle`. It cannot change after the first upload.
- Build a signed release bundle (AAB) with your own upload key. Keep the key and its passwords safe.
