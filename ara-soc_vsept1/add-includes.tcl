
# This script adds includes to the path.
# Replace $PWD with the path of root of the project and run 

set_property include_dirs { \
	"$PWD/ara-soc_vsept1/ara-soc_vsept1.srcs/includes/apb/include"\
	"$PWD/ara-soc_vsept1/ara-soc_vsept1.srcs/includes/ara/include"\
	"$PWD/ara-soc_vsept1/ara-soc_vsept1.srcs/includes/axi/include"\
	"$PWD/ara-soc_vsept1/ara-soc_vsept1.srcs/includes/common_cells/include"\
} [current_fileset]
