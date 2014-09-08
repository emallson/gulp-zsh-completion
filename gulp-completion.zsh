#!/bin/zsh

function _gulp_completion_upfind() {
    while [[ ! -e "./Gulpfile.js" && $(pwd) != / ]]; do
        builtin cd ..;
    done
}

function _gulp_completion() {
    local orig_pwd=$(pwd);
    _gulp_completion_upfind;
    if [[ -e "./Gulpfile.js" ]]; then
        compls=$(pcregrep -o1 "gulp.task\([\"\'](.+?)[\"\']" "Gulpfile.js")
        completions=(${=compls})
        compadd -- $completions
    fi
    builtin cd "$orig_pwd";
}

compdef _gulp_completion gulp
