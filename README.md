# dytsou/proximeeting

A [Homebrew tap](https://docs.brew.sh/Taps) for [ProxiMeeting](https://github.com/dytsou/ProxiMeeting): a macOS menu bar app that shows your next calendar meeting.

## Install

```bash
brew tap dytsou/proximeeting
brew install --cask proximeeting
```

Requires **macOS 13 Ventura** or later.

## Upgrade

```bash
brew upgrade --cask proximeeting
```

## Maintainer: version bumps

**Automated (default):** When [ProxiMeeting's `build.yml`](https://github.com/dytsou/ProxiMeeting/blob/main/.github/workflows/build.yml) creates a new GitHub Release, it also updates this repo's [`Casks/proximeeting.rb`](Casks/proximeeting.rb) (`version` + `sha256`) and pushes to `main`. GitHub only allows **one deploy key per repository**, so the workflow uses a **second** key pair: store the private key in the ProxiMeeting repo secret **`TAP_DEPLOY_KEY`**, and add the matching **public** key here under **Settings → Deploy keys** with **Allow write access** (read-only keys cannot `git push`). CI uses `GIT_SSH_COMMAND` with that key so it is not confused with **`DEPLOY_KEY`** (ProxiMeeting). If push fails with "denied to deploy key", confirm this key is added **here** (not only on ProxiMeeting) and that **write access** is enabled.

**Manual (fallback):** If you need to fix the cask without a release:

1. Open [`Casks/proximeeting.rb`](Casks/proximeeting.rb).
2. Set `version` to the new semver (no `v` prefix), matching the release tag without `v` (e.g. tag `v1.2.4` → `version "1.2.4"`).
3. Set `sha256` to the checksum of **`ProxiMeeting.zip`** for that release:

   ```bash
   curl -sL "https://github.com/dytsou/ProxiMeeting/releases/download/v1.2.4/ProxiMeeting.zip" | shasum -a 256
   ```

   Or read the `digest` field from the [GitHub API](https://api.github.com/repos/dytsou/ProxiMeeting/releases/latest) for the `ProxiMeeting.zip` asset.

4. Commit and push this repository.

## License

The cask metadata in this tap is MIT-licensed; [ProxiMeeting](https://github.com/dytsou/ProxiMeeting) itself is MIT-licensed.
