#%include searchpaths.sh

# Licenses can be taken from any store
# So we list all that exist
al:license-stores() {
	local storedir

	for storedir in ${LICENSE_STORES//:/ } ; do
		if [[ -d "$storedir" ]]; then
			echo "$storedir"
		fi
	done
}

al:license-store:files() {
	local license_files lfile
	
	license_files="$( for substore in $(al:license-store); do echo "$substore/"*.lic; done )"

	for lfile in $license_files ; do
		echo "${lfile/.lic/}"
	done
}

al:license-store:get() {
	local license

	license="$1"; shift

	searchpathsLfile_from "$LICENSE_STORES" "$license.lic"
}
