set PATH $HOME/bin:$PATH
set PATH /use/local/bin:$PATH

switch (uname)
case Darwin
  set PATH /opt/homebrew/opt/llvm@21/bin:$PATH
  set PATH /opt/homebrew/bin:$PATH
  source "$HOME/.cargo/env.fish"
end
