#!/bin/zsh

ROOT=$(git rev-parse --show-toplevel)
echo "${ROOT}"

# Copy Git-hooks
cp -fr "$ROOT"/scripts/git-hooks/ "$(git rev-parse --git-dir)"/hooks

# Fetch Secrets
git clone git@github.com:MrSmart00/peekaboo-hide.git "$ROOT"/hide
cp "$ROOT"/hide/.secret.sourcery.yml "$ROOT"
rm -Rf "$ROOT"/hide

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

echo "🏁 \e[32mSetup Completed!\e[m 🏁"