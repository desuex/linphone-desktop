############################################################################
# ortp.cmake
# Copyright (C) 2014  Belledonne Communications, Grenoble France
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

lcb_git_repository("git://git.linphone.org/ortp.git")
lcb_git_tag_latest("master")
lcb_git_tag("0.27.0")
lcb_external_source_paths("oRTP" "ortp")
lcb_groupable(YES)
lcb_package_source(YES)

lcb_dependencies("bctoolbox")
lcb_spec_file("ortp.spec")

lcb_cmake_options("-DENABLE_DOC=${ENABLE_DOC}")

if(EP_ortp_BUILD_METHOD STREQUAL "rpm")
        message("using rpm")
	set(EP_ortp_CONFIGURE_COMMAND_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/builders/ortp/configure.sh.rpm.cmake)
        set(EP_ortp_BUILD_COMMAND_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/builders/ortp/build.sh.rpm.cmake)
endif()

