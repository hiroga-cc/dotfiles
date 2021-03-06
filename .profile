export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gawk/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnutls/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
export PATH="$PATH:$HOME/.fastlane/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

export GRAALVM_BIN="/Library/Java/JavaVirtualMachines/graalvm-ce-java8-latest/Contents/Home/bin"
if [ -d $GRAALVM_BIN ]; then
    export PATH="$GRAALVM_BIN:$PATH"
fi

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

QT_BIN="/usr/local/opt/qt/bin"
[ -d $QT_BIN ] && export PATH="$QT_BIN:$PATH"
TEXINFO_BIN="/usr/local/opt/texinfo/bin"
[ -d $TEXINFO_BIN ] && export PATH="$TEXINFO_BIN:$PATH"

export LDFLAGS="-L/usr/local/opt/openblas/lib -L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include -I/usr/local/opt/qt/include"
export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig:/usr/local/opt/qt/lib/pkgconfig"

CARGO_BIN="$HOME/.cargo/bin"
if [ -d "$CARGO_BIN" ]; then
    export PATH="$CARGO_BIN:$PATH"
    export CARGO_NET_GIT_FETCH_WITH_CLI=true
    # build-in の gitだと ssh-agent authentication に失敗するため。
    # https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli
fi

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gawk/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnutls/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-indent/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-getopt/share/man:$MANPATH"
export MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK_HOME="$HOME/Library/Android/sdk/android-ndk-r13b"
export JAVA_HOME="$HOME/.sdkman/candidates/java/current"

export GOPATH="$HOME/.ghq"
export PATH="$GOPATH/bin:$PATH"

# create .venv in project root, alternative to $HOME/.local/share/virtualenvs/
export PIPENV_VENV_IN_PROJECT=1
