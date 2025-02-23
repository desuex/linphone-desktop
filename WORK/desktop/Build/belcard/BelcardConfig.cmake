############################################################################
# BelcardConfig.cmake
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
# Config file for the belcard package.
# It defines the following variables:
#
#  BELCARD_FOUND - system has belcard
#  BELCARD_INCLUDE_DIRS - the belcard include directory
#  BELCARD_LIBRARIES - The libraries needed to use belcard
#  BELCARD_CPPFLAGS - The compilation flags needed to use belcard

if(NOT LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	include("${CMAKE_CURRENT_LIST_DIR}/BelcardTargets.cmake")
endif()

if(YES)
	set(BELCARD_TARGETNAME belcard)
	set(BELCARD_LIBRARIES ${BELCARD_TARGETNAME})
else()
	set(BELCARD_TARGETNAME belcard-static)
	if(TARGET ${BELCARD_TARGETNAME})
		if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
			set(BELCARD_LIBRARIES ${BELCARD_TARGETNAME})
		else()
			get_target_property(BELCARD_LIBRARIES ${BELCARD_TARGETNAME} LOCATION)
		endif()
		get_target_property(BELCARD_LINK_LIBRARIES ${BELCARD_TARGETNAME} INTERFACE_LINK_LIBRARIES)
		if(BELCARD_LINK_LIBRARIES)
			list(APPEND BELCARD_LIBRARIES ${BELCARD_LINK_LIBRARIES})
		endif()
	endif()
endif()
get_target_property(BELCARD_INCLUDE_DIRS ${BELCARD_TARGETNAME} INTERFACE_INCLUDE_DIRECTORIES)
if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	list(INSERT BELCARD_INCLUDE_DIRS 0 "${EP_belcard_INCLUDE_DIR}")
else()
	list(INSERT BELCARD_INCLUDE_DIRS 0 "/Users/S0U1SB4N3/test006/linphone-desktop/OUTPUT/desktop/include")
endif()
list(REMOVE_DUPLICATES BELCARD_INCLUDE_DIRS)

set(BELCARD_CPPFLAGS )
set(BELCARD_FOUND 1)
