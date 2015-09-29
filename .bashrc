source ~/.bash_prompt

function cd() {
    builtin cd $@ && ls
}
