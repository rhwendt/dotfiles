# for some reason this isnt configured on ubuntu 19.10
if [[ -z "$XDG_CONFIG_HOME" ]]
then
        export XDG_CONFIG_HOME="$HOME/.config"
fi
