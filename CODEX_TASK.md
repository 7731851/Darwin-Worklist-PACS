# Codex task - Darwin Worklist PACS 1.4.2

Baseline: Darwin-Worklist-PACS 1.4.2.

Required changes and validation:

- Keep application version at 1.4.2 for this baseline unless a new version is explicitly requested.
- The `PACS 報告設定／紀錄` button belongs in the fixed bottom action area, immediately to the right of `Received List`.
- Do not place that PACS button in the upper license/status row.
- Main desktop GUI action buttons must remain permanently visible; the bottom action bar must never be pushed off-screen by content.
- Middle/content area must be scrollable.
- Validate Windows display scaling at 100%, 125%, and 150% and ensure no primary button is clipped or hidden.
- Builder must be `Build-EXE-Select-Icon.bat`.
- Every `.bat` file must contain English ASCII only and Windows CRLF line endings. CMD must never parse Chinese text.
- Builder must display its version.
- Builder must allow the user to select an `.ico` file, with fallback to the project default icon.
- Final build target is `Darwin2WorklistBridge.exe`.
- Preserve existing DICOM MWL / PACS / Darwin integration behavior unless required by the UI/build changes above.

Before final delivery, run the available tests and verify the release EXE starts successfully on Windows.
