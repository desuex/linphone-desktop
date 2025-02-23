############################################################################
# ORTPConfig.cmake
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
# Config file for the oRTP package.
# It defines the following variables:
#
#  ORTP_FOUND - system has oRTP
#  ORTP_INCLUDE_DIRS - the oRTP include directory
#  ORTP_LIBRARIES - The libraries needed to use oRTP
#  ORTP_CPPFLAGS - The cflags needed to use oRTP

if(NOT LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	include("${CMAKE_CURRENT_LIST_DIR}/ORTPTargets.cmake")
endif()

if(YES)
	set(ORTP_TARGETNAME ortp)
	set(ORTP_LIBRARIES ${ORTP_TARGETNAME})
else()
	set(ORTP_TARGETNAME ortp-static)
	if(TARGET ${ORTP_TARGETNAME})
		if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
			set(ORTP_LIBRARIES ${ORTP_TARGETNAME})
		else()
			get_target_property(ORTP_LIBRARIES ${ORTP_TARGETNAME} LOCATION)
		endif()
		get_target_property(ORTP_LINK_LIBRARIES ${ORTP_TARGETNAME} INTERFACE_LINK_LIBRARIES)
		if(ORTP_LINK_LIBRARIES)
			list(APPEND ORTP_LIBRARIES ${ORTP_LINK_LIBRARIES})
		endif()
	endif()
endif()
get_target_property(ORTP_INCLUDE_DIRS ${ORTP_TARGETNAME} INTERFACE_INCLUDE_DIRECTORIES)
if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	list(INSERT ORTP_INCLUDE_DIRS 0 "${EP_ortp_INCLUDE_DIR}")
else()
	list(INSERT ORTP_INCLUDE_DIRS 0 "/Users/S0U1SB4N3/test006/linphone-desktop/OUTPUT/desktop/include")
endif()
list(REMOVE_DUPLICATES ORTP_INCLUDE_DIRS)

set(ORTP_CPPFLAGS )
set(ORTP_FOUND 1)
