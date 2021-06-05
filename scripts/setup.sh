#!/bin/sh

ROOT=$(git rev-parse --show-toplevel)
echo "${ROOT}"

# Copy Git-hooks
cp -fr "$ROOT"/scripts/git-hooks/ "$(git rev-parse --git-dir)"/hooks

# Fetch Secrets
git clone git@github.com:MrSmart00/peekaboo-hide.git "$ROOT"/secret
cp "$ROOT"/secret/.secret.sourcery.yml "$ROOT"
rm -Rf "$ROOT"/secret

# Bitrise CLI
if test ! $(which bitrise); then
  echo "  + Installing Bitrise CLI..."
  brew install bitrise
else 
  echo "  + Bitrise found."
fi

# Mint
if test ! $(which mint); then
  echo "  + Installing Mint..."
  brew install mint
else
  echo "  + Mint found."
fi

echo "  + bootstrap Mint."
mint bootstrap

echo "  + Create Secret via Sourcery."
sourcery --config .secret.sourcery.yml
rm -rf "$ROOT"/.secret.sourcery.yml

# Bundler
if test ! $(which bundle); then
  echo "  + Installing bundler..."
  gem install bundler
else
  echo "  + Bundler found."
fi

# Gem
echo "  + Installing gems."
bundle config set --local path 'vendor/bundle'
bundle install --quiet

echo "🏁 \033[32mSetup Completed!\033[m 🏁"