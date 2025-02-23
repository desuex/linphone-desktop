############################################################################
# BelleSIPConfig.cmake
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
# Config file for the belle-sip package.
# It defines the following variables:
#
#  BELLESIP_FOUND - system has belle-sip
#  BELLESIP_INCLUDE_DIRS - the belle-sip include directory
#  BELLESIP_LIBRARIES - The libraries needed to use belle-sip
#  BELLESIP_CPPFLAGS - The compilation flags needed to use belle-sip
#  BELLESIP_LDFLAGS - The linking flags needed to use belle-sip

if(NOT LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	include("${CMAKE_CURRENT_LIST_DIR}/BelleSIPTargets.cmake")
endif()

if(YES)
	set(BELLESIP_TARGETNAME bellesip)
	set(BELLESIP_LIBRARIES ${BELLESIP_TARGETNAME})
else()
	set(BELLESIP_TARGETNAME bellesip-static)
	if(TARGET ${BELLESIP_TARGETNAME})
		if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
			set(BELLESIP_LIBRARIES ${BELLESIP_TARGETNAME})
		else()
			get_target_property(BELLESIP_LIBRARIES ${BELLESIP_TARGETNAME} LOCATION)
		endif()
		get_target_property(BELLESIP_LINK_LIBRARIES ${BELLESIP_TARGETNAME} INTERFACE_LINK_LIBRARIES)
		if(BELLESIP_LINK_LIBRARIES)
			list(APPEND BELLESIP_LIBRARIES ${BELLESIP_LINK_LIBRARIES})
		endif()
	endif()
endif()
get_target_property(BELLESIP_INCLUDE_DIRS ${BELLESIP_TARGETNAME} INTERFACE_INCLUDE_DIRECTORIES)
if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	list(INSERT BELLESIP_INCLUDE_DIRS 0 "${EP_bellesip_INCLUDE_DIR}")
else()
	list(INSERT BELLESIP_INCLUDE_DIRS 0 "/Users/S0U1SB4N3/test006/linphone-desktop/OUTPUT/desktop/include")
endif()
list(REMOVE_DUPLICATES BELLESIP_INCLUDE_DIRS)

set(BELLESIP_CPPFLAGS )
set(BELLESIP_LDFLAGS "-framework Foundation")
set(BELLESIP_FOUND 1)
