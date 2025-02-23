/*
Copyright (C) 2017 Belledonne Communications SARL

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

#ifndef _LINPHONE_INFO_MESSAGE_HH
#define _LINPHONE_INFO_MESSAGE_HH

#include <memory>
#include <string>
#include "content.hh"
#include "object.hh"





struct _LinphoneInfoMessage;


namespace linphone {


	/**
	 * @brief The LinphoneInfoMessage is an object representing an informational
	 * message sent or received by the core. 
	 */
	class InfoMessage: public Object {
	
		public:
			InfoMessage(void *ptr, bool takeRef=true);
			LINPHONECXX_PUBLIC _LinphoneInfoMessage *cPtr() {return (_LinphoneInfoMessage *)mPrivPtr;}
			

	
		public:
			
		
			/**
			 * @brief Returns the info message's content as a #LinphoneContent structure. 
			 */
			LINPHONECXX_PUBLIC std::shared_ptr<const Content> getContent() const;
			
			/**
			 * @brief Assign a content to the info message. 
			 */
			LINPHONECXX_PUBLIC void setContent(const std::shared_ptr<const Content> & content);
			
			/**
			 * @brief Obtain a header value from a received info message. 
			 */
			LINPHONECXX_PUBLIC std::string getHeader(const std::string & name) const;
			
			/**
			 * @brief Add a header to an info message to be sent. 
			 */
			LINPHONECXX_PUBLIC void addHeader(const std::string & name, const std::string & value);
			

		
		
		
	};

};

#endif // _LINPHONE_INFO_MESSAGE_HH
