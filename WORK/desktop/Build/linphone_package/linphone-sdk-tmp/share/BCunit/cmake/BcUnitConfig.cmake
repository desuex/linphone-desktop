############################################################################
# BcUnitConfig.cmake.in
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
# Config file for the bcunit package.
#
# It defines the following variables:
#
#  BCUNIT_FOUND - system has bcunit
#  BCUNIT_INCLUDE_DIRS - the bcunit include directory
#  BCUNIT_LIBRARIES - The libraries needed to use bcunit

include("${CMAKE_CURRENT_LIST_DIR}/BcUnitTargets.cmake")

if(YES)
	set(BCUNIT_TARGETNAME bcunit)
	set(BCUNIT_LIBRARIES ${BCUNIT_TARGETNAME})
else()
	set(BCUNIT_TARGETNAME bcunit-static)
	get_target_property(BCUNIT_LIBRARIES ${BCUNIT_TARGETNAME} LOCATION)
	get_target_property(BCUNIT_LINK_LIBRARIES ${BCUNIT_TARGETNAME} INTERFACE_LINK_LIBRARIES)
	if(BCUNIT_LINK_LIBRARIES)
		list(APPEND BCUNIT_LIBRARIES ${BCUNIT_LINK_LIBRARIES})
	endif()
endif()
get_target_property(BCUNIT_INCLUDE_DIRS ${BCUNIT_TARGETNAME} INTERFACE_INCLUDE_DIRECTORIES)
if(NOT BCUNIT_INCLUDE_DIRS)
	set(BCUNIT_INCLUDE_DIRS )
endif()
list(INSERT BCUNIT_INCLUDE_DIRS 0 "/Users/S0U1SB4N3/test006/linphone-desktop/OUTPUT/desktop/include")
list(REMOVE_DUPLICATES BCUNIT_INCLUDE_DIRS)

set(BCUNIT_FOUND 1)

