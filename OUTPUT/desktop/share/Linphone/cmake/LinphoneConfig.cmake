############################################################################
# LinphoneConfig.cmake
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
#  LINPHONE_FOUND - system has linphone
#  LINPHONE_INCLUDE_DIRS - the linphone include directory
#  LINPHONE_LIBRARIES - The libraries needed to use linphone
#  LINPHONE_CPPFLAGS - The compilation flags needed to use linphone
#  LINPHONE_LDFLAGS - The linking flags needed to use linphone

if(NOT LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	include("${CMAKE_CURRENT_LIST_DIR}/LinphoneTargets.cmake")
endif()
if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
        include("${EP_ms2_CONFIG_DIR}/Mediastreamer2Config.cmake")
        include("${EP_bellesip_CONFIG_DIR}/BelleSIPConfig.cmake")
else()
	find_package(Mediastreamer2 REQUIRED)
	find_package(BelleSIP REQUIRED)
endif()

if(YES)
	set(LINPHONE_TARGETNAME linphone)
	set(LINPHONE_LIBRARIES ${LINPHONE_TARGETNAME})
else()
	set(LINPHONE_TARGETNAME linphone-static)
	if(TARGET ${LINPHONE_TARGETNAME})
		if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
			set(LINPHONE_LIBRARIES ${LINPHONE_TARGETNAME})
		else()
			get_target_property(LINPHONE_LIBRARIES ${LINPHONE_TARGETNAME} LOCATION)
		endif()
		get_target_property(LINPHONE_LINK_LIBRARIES ${LINPHONE_TARGETNAME} INTERFACE_LINK_LIBRARIES)
		if(LINPHONE_LINK_LIBRARIES)
			list(APPEND LINPHONE_LIBRARIES ${LINPHONE_LINK_LIBRARIES})
		endif()
	endif()
endif()
get_target_property(LINPHONE_INCLUDE_DIRS ${LINPHONE_TARGETNAME} INTERFACE_INCLUDE_DIRECTORIES)
if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	list(INSERT LINPHONE_INCLUDE_DIRS 0 "${EP_linphone_INCLUDE_DIR}")
else()
	list(INSERT LINPHONE_INCLUDE_DIRS 0 "/Users/S0U1SB4N3/test006/linphone-desktop/OUTPUT/desktop/include")
endif()
list(REMOVE_DUPLICATES LINPHONE_INCLUDE_DIRS)

set(LINPHONE_CPPFLAGS )
set(LINPHONE_LDFLAGS "-framework Foundation -framework CoreFoundation -framework AudioToolbox -framework CoreAudio -framework AppKit -framework Carbon -framework AudioUnit -framework Cocoa -framework OpenGL -framework QuartzCore -framework AVFoundation -framework VideoToolbox -framework CoreMedia -stdlib=libc++")
set(LINPHONE_FOUND 1)
