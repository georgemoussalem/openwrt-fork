PART_NAME=firmware
REQUIRE_IMAGE_METADATA=1

RAMFS_COPY_BIN='fw_printenv fw_setenv head'
RAMFS_COPY_DATA='/etc/fw_env.config /var/lock/fw_printenv.lock'

platform_check_image() {
	return 0;
}

platform_do_upgrade() {
	case "$(board_name)" in
	linksys,mx2000|\
	linksys,mx5500)
		platform_do_upgrade_linksys "$1"
		;;
	*)
		default_do_upgrade "$1"
		;;
	esac
}
