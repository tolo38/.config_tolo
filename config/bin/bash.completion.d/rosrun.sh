_script()
{
    _script_commands="test_linux0 solder_station fake_station"

    local cur
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "${_script_commands}" -- ${cur})  )

    return 0

}
complete -o nospace -F _script rosrun_drf_launch_cds_laucher_py
