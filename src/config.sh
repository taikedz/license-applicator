#%include searchpaths.sh readkv.sh

al:load-config() {
	local configfile
	configfile="$(searchpaths:file_from "$CONFIG_PATHS" license.conf)"
	
	AL_conf_author="$(readkv:require author "$configfile")"
	AL_conf_company="$(readkv author "$configfile" '')"
	AL_conf_years="$(readkv years "$configfile" $(date +%Y))"
}
