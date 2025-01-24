set fish_greeting ''
set fish_user_paths /home/gkxk/repo/bin  /home/gkxk/repo/github/clone/mirai/ /home/gkxk/.local/bin /home/gkxk/go/bin /home/gkxk/.cargo/bin /usr/local/go/bin

# /home/gkxk/repo/github/clone/s

alias t tmux
alias c clear
alias vi nvim
alias vim nvim
alias tree2 "tree -L 2"
alias tree3 "tree -L 3"
alias ... "cd ../.."
alias pc "proxychains -q"
alias diff icdiff
alias fd fdfind
alias adb "/mnt/c/storage/software/scrcpy-win64-v1.24/adb.exe"
alias adb.exe "/mnt/c/storage/software/scrcpy-win64-v1.24/adb.exe"
alias timeit '/usr/bin/time -f "time: %E"'
alias curip "ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p'"
# alias n nnn
# alias noden /usr/local/bin/n
alias redis-cli iredis
alias kubectl "kubectl.exe"
alias minikube "minikube.exe"
# alias minikube_start "minikube start --vm-driver=docker --base-image='kicbase/stable:v0.0.32' --image-mirror-country='cn' --image-repository='registry.cn-hangzhou.aliyuncs.com/google_containers' --kubernetes-version=v1.23.8"
alias cw codewars-cli
alias codewars codewars-cli

alias output "vi /mnt/c/storage/repo/sxlgkxk/public/sxlgkxk.github.io/source/about/output/index.md"

alias cnpm "npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/mirrors/node \
--userconfig=$HOME/.cnpmrc"

set -x EDITOR nvim
set -x VISUAL nvim

set -x S_BIN_PATH /home/gkxk/repo/bin
set -x S_TEMPLATES_PATH /home/gkxk/repo/bin/t
set -x SLS_GEO_LOCATION no-cn

set -x SCREENDIR "$HOME/.screen_sessions"

# thefuck --alias | source

# if status is-interactive
# and not set -q TMUX
#     exec tmux
# end

function showsleep 
    cd /home/gkxk/repo/article/funcs
    cat adbSleep.sh |powershell.exe >/dev/null 2>&1
end

set -x TERM "xterm-256color"
set -x _Z_DATA "/home/gkxk/.z"
set -x Z_DATA "/home/gkxk/.z"
set -x _Z_MAX_SCORE 12000
set -x Z_MAX_SCORE 12000

alias rnstart 'powershell.exe "npx react-native run-android"'


# function fish_prompt -d "Write out the prompt"
#     # printf '%s@wsl %s %s%s%s > ' $USER $hostname \
#     printf '%s@wsl %s %s%s%s > ' $USER (date +%H:%M)\
#         (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
# end


set -x LS_COLORS 'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;34:ow=30;34:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

alias skag "sk --ansi -i -c 'ag --color \"{}\"'" 
alias skagp "sk --ansi -i -c 'ag --color \"{}\"' --preview \"preview.sh {}\""
alias preview "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

#set -x HTTP_PROXY "http://127.0.0.1:1083"
#set -x HTTPS_PROXY "http://127.0.0.1:1083"
#set -x ALL_PROXY "http://127.0.0.1:1083"
set -x KUBECONFIG "~/.kube/config"

alias scrtab "scrcpy.exe -s ANF"
alias scrmi "scrcpy.exe -s 901"

set -x MY_GITHUB_TOKEN "ghp_MyP"
set -x IS_LOCAL 1

#alias draw "/mnt/c/storage/software/Honeyview/Honeyview.exe 'C:\\storage\\image\\'"
#alias ims "explorer.exe 'C:\\hexo3d'"


function fish_right_prompt -d "Write out the right prompt"
    date '+%H:%M '
	#printf '%s%s' (date '+%H:%M:%S' | set_color green) (set_color normal)
end

set -x JAVA_HOME "/usr/lib/jvm/jdk-21-oracle-x64"
set -x ANDROID_HOME "/mnt/c/storage/software/android_sdk"

alias newtab 'vi /mnt/c/storage/repo/sxlgkxk/public/page/m/src/20240113_newtab/build/newtab.md'

function about
	if test -z $argv
		exit 0
	end
	vi /mnt/c/storage/repo/sxlgkxk/public/about/"$argv".md
end

alias tablet 'ssh -p 8022 -t u0_a117@10.1.2.247 "screen -R"'


function blog
    cd /mnt/c/storage/repo/gkxk/public/docs/blog
    npm run edit
end

