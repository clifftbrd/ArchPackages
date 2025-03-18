
  alias la='ls -Alh'                    # show hidden files
#  alias ls='ls -Fh --color=always'     # add colors and file type extensions
  alias ls='ls --color'                 # add colors 
  alias lx='ls -lXBh'                   # sort by extension
  alias lk='ls -lSrh'                  # sort by size
  alias lzrh='du -hd1 ./ 2>/dev/null |sort -h'     # ls and sort by recursive size
  alias lc='ls -ltcrh'                  # sort by change time
  alias lu='ls -lturh'                  # sort by access time
  alias lr='ls -lRh'                    # recursive ls
  alias lt='ls -ltrh'                   # sort by date
  alias lm='ls -Alh |more'              # pipe through 'more'
  alias lw='ls -xAh'                    # wide listing format
  alias ll='ls -Fls'                    # long listing format
  alias labc='ls -lAp'                  # alphabetical sort
  alias lf="ls -lA | grep -E -v '^d'"   # files only
  alias ldir="ls -lA |grep -E '^d'"     # directories only
  alias lla='ls -Al'                    # List and Hidden Files

