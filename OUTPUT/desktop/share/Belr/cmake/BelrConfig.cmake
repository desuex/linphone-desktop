############################################################################
# BelrConfig.cmake
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
# Config file for the belr package.
# It defines the following variables:
#
#  BELR_FOUND - system has belr
#  BELR_INCLUDE_DIRS - the belr include directory
#  BELR_LIBRARIES - The libraries needed to use belr
#  BELR_CPPFLAGS - The compilation flags needed to use belr

if(NOT LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	include("${CMAKE_CURRENT_LIST_DIR}/BelrTargets.cmake")
endif()

if(YES)
	set(BELR_TARGETNAME belr)
	set(BELR_LIBRARIES ${BELR_TARGETNAME})
else()
	set(BELR_TARGETNAME belr-static)
	if(TARGET ${BELR_TARGETNAME})
		if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
			set(BELR_LIBRARIES ${BELR_TARGETNAME})
		else()
			get_target_property(BELR_LIBRARIES ${BELR_TARGETNAME} LOCATION)
		endif()
		get_target_property(BELR_LINK_LIBRARIES ${BELR_TARGETNAME} INTERFACE_LINK_LIBRARIES)
		if(BELR_LINK_LIBRARIES)
			list(APPEND BELR_LIBRARIES ${BELR_LINK_LIBRARIES})
		endif()
	endif()
endif()
get_target_property(BELR_INCLUDE_DIRS ${BELR_TARGETNAME} INTERFACE_INCLUDE_DIRECTORIES)
if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	list(INSERT BELR_INCLUDE_DIRS 0 "${EP_belr_INCLUDE_DIR}")
else()
	list(INSERT BELR_INCLUDE_DIRS 0 "/Users/S0U1SB4N3/test006/linphone-desktop/OUTPUT/desktop/include")
endif()
list(REMOVE_DUPLICATES BELR_INCLUDE_DIRS)

set(BELR_CPPFLAGS )
set(BELR_FOUND 1)
