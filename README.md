# dnet-dotfiles-dotsh
A repo for versioning and sharing my custom environment type stuff. Mostly .config files and scripts that interact with them in some way.

For example alias.config.sh which exports config_toggle() and a list of Boolean variables.
Calling "c_t USE_LS USE_COLOR X X etc etc" toggles the true to false/false to true and changing the behavior of any alias/function that uses those variables.
There is probably an easier way to do this but I am noob.
I wrote this because I like my alias c=" clear " to also exec l for alias l=" ls -A " and I like my alias ls=" ls --color-auto ". Sometimes however I don't want c to clear and list all.
Instead of having two aliases I just wrote this and switched c from an alias to a function so now "c" enter has the same effect but I can disable the ls by typing "config_toggle USE_LS" and hitting enter.
running the same command reenables the ls "feature". Stuff like that will live here as well, I will make a separate repo for scripts that don't pertain to configs or my environment in some way.
