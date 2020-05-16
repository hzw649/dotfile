source ~/.aliases

PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/Cellar/opencv/2.4.12/lib/pkgconfig
export PKG_CONFIG_PATH

export LD_LIBRARY_PATH=/usr/local/Cellar/opencv/2.4.12/bin:SLD_LIBRARY_PATH
export PATH=${PATH}:/usr/local/Cellar/opencv/2.4.12/lib
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
#export PATH

export JAVA_HOME=`/usr/libexec/java_home -v 13`
export PATH=$JAVA_HOME/bin:$PATH
# <<< conda init <<<
# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/hzw/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/hzw/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/hzw/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/hzw/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

eval "$(rbenv init -)"
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH

export PATH=$HOME/package/javacc/scripts:$PATH

M2_HOME=$HOME/package/apache-maven-3.6.3
PATH=$PATH:$M2_HOME/bin


JUNIT_HOME=$HOME/package
CLASSPATH=$CLASSPATH:$JUNIT_HOME/junit5.jar


TERM=xterm-color;
export TERM

export PATH=${PATH}:/usr/local/mysql/bin
export PATH=${PATH}:/usr/local/mysql/support-files/
