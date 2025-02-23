############################################################################
# BZRTPConfig.cmake
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
# Config file for the bzrtp package.
# It defines the following variables:
#
#  BZRTP_FOUND - system has bzrtp
#  BZRTP_INCLUDE_DIRS - the bzrtp include directory
#  BZRTP_LIBRARIES - The libraries needed to use bzrtp
#  BZRTP_CPPFLAGS - The compilation flags needed to use bzrtp

if(NOT LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	include("${CMAKE_CURRENT_LIST_DIR}/BZRTPTargets.cmake")
endif()

if(YES)
	set(BZRTP_TARGETNAME bzrtp)
	set(BZRTP_LIBRARIES ${BZRTP_TARGETNAME})
else()
	set(BZRTP_TARGETNAME bzrtp-static)
	if(TARGET ${BZRTP_TARGETNAME})
		if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
			set(BZRTP_LIBRARIES ${BZRTP_TARGETNAME})
		else()
			get_target_property(BZRTP_LIBRARIES ${BZRTP_TARGETNAME} LOCATION)
		endif()
		get_target_property(BZRTP_LINK_LIBRARIES ${BZRTP_TARGETNAME} INTERFACE_LINK_LIBRARIES)
		if(BZRTP_LINK_LIBRARIES)
			list(APPEND BZRTP_LIBRARIES ${BZRTP_LINK_LIBRARIES})
		endif()
	endif()
endif()
get_target_property(BZRTP_INCLUDE_DIRS ${BZRTP_TARGETNAME} INTERFACE_INCLUDE_DIRECTORIES)
if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	list(INSERT BZRTP_INCLUDE_DIRS 0 "${EP_bzrtp_INCLUDE_DIR}")
else()
	list(INSERT BZRTP_INCLUDE_DIRS 0 "/Users/S0U1SB4N3/test006/linphone-desktop/OUTPUT/desktop/include")
endif()
list(REMOVE_DUPLICATES BZRTP_INCLUDE_DIRS)

set(BZRTP_CPPFLAGS )
set(BZRTP_FOUND 1)
