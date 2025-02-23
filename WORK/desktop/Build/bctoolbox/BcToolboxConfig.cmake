############################################################################
# BcToolboxConfig.cmake
# Copyright (C) 2015  Belledonne Communications, Grenoble France
#
############################################################################
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
############################################################################
#
# Config file for the bctoolbox package.
# Some components can be asked for: core, tester.
#
# It defines the following variables:
#
#  BCTOOLBOX_FOUND - system has bctoolbox
#  BCTOOLBOX_INCLUDE_DIRS - the bctoolbox include directory
#  BCTOOLBOX_LIBRARIES - The libraries needed to use bctoolbox
#  BCTOOLBOX_CPPFLAGS - The compilation flags needed to use bctoolbox
#  BCTOOLBOX_LDFLAGS - The linking flags needed to use bctoolbox
#  BCTOOLBOX_${comp}_FOUND - system has bctoolbox "comp" component
#  BCTOOLBOX_${comp}_INCLUDE_DIRS - the bctoolbox "comp" component include directory
#  BCTOOLBOX_${comp}_LIBRARIES - The libraries needed to use bctoolbox "comp" component

if(NOT LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	include("${CMAKE_CURRENT_LIST_DIR}/BcToolboxTargets.cmake")
endif()

list(APPEND BcToolbox_FIND_COMPONENTS core)
list(REMOVE_DUPLICATES BcToolbox_FIND_COMPONENTS)
set(BcToolbox_FIND_REQUIRED_core TRUE)

set(BCTOOLBOX_CPPFLAGS )
set(BCTOOLBOX_LDFLAGS "-framework Foundation")
set(BCTOOLBOX_LIBRARIES )
foreach(comp ${BcToolbox_FIND_COMPONENTS})
	string(TOUPPER ${comp} uppercomp)
	if(comp STREQUAL "core")
		set(targetname bctoolbox)
	else()
		set(targetname bctoolbox-${comp})
	endif()
	if(YES)
		set(BCTOOLBOX_${uppercomp}_LIBRARIES ${targetname})
	else()
		set(targetname ${targetname}-static)
		if(TARGET ${targetname})
			if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
				set(BCTOOLBOX_${uppercomp}_LIBRARIES ${targetname})
			else()
				get_target_property(BCTOOLBOX_${uppercomp}_LIBRARIES ${targetname} LOCATION)
			endif()
			get_target_property(BCTOOLBOX_${uppercomp}_LINK_LIBRARIES ${targetname} INTERFACE_LINK_LIBRARIES)
			if(BCTOOLBOX_${uppercomp}_LINK_LIBRARIES)
				list(APPEND BCTOOLBOX_${uppercomp}_LIBRARIES ${BCTOOLBOX_${uppercomp}_LINK_LIBRARIES})
			endif()
		endif()
	endif()
	if(TARGET ${targetname})
		get_target_property(BCTOOLBOX_${uppercomp}_INCLUDE_DIRS ${targetname} INTERFACE_INCLUDE_DIRECTORIES)
		if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
			list(INSERT BCTOOLBOX_${uppercomp}_INCLUDE_DIRS 0 "${EP_bctoolbox_INCLUDE_DIR}")
		else()
			list(INSERT BCTOOLBOX_${uppercomp}_INCLUDE_DIRS 0 "/Users/S0U1SB4N3/test006/linphone-desktop/OUTPUT/desktop/include")
		endif()
		list(REMOVE_DUPLICATES BCTOOLBOX_${uppercomp}_INCLUDE_DIRS)
		list(APPEND BCTOOLBOX_LIBRARIES ${BCTOOLBOX_${uppercomp}_LIBRARIES})
		list(APPEND BCTOOLBOX_INCLUDE_DIRS ${BCTOOLBOX_${uppercomp}_INCLUDE_DIRS})
		set(BCTOOLBOX_${uppercomp}_FOUND 1)
		if(comp STREQUAL "core")
			set(BCTOOLBOX_FOUND 1)
		endif()
	elseif(BcToolbox_FIND_REQUIRED_${comp})
		message(FATAL_ERROR "Required bctoolbox component \"${comp}\" cannot be found")
	endif()
endforeach()
if(BCTOOLBOX_INCLUDE_DIRS)
	list(REMOVE_DUPLICATES BCTOOLBOX_INCLUDE_DIRS)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/BcToolboxCMakeUtils.cmake")

