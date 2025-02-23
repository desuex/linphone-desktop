/*
	belle-msrp_parser.hpp
	Copyright (C) 2015-2016  Belledonne Communications SARL

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef BELLE_MSRP_PARSER_HPP
#define BELLE_MSRP_PARSER_HPP

#include "belle-msrp.hpp"

#include <belr/grammarbuilder.hh>
#include <belr/abnf.hh>

namespace bellemsrp {
	class Parser {
	private:
		belr::ABNFGrammarBuilder _grammar_builder;
		shared_ptr<belr::Grammar> _grammar;

		bellemsrp::Element* _parse(const std::string &input, const std::string &rule);

	public:
		BELLEMSRP_PUBLIC Parser();
		BELLEMSRP_PUBLIC ~Parser();

		BELLEMSRP_PUBLIC bellemsrp::Element* parse(const std::string &input);
		BELLEMSRP_PUBLIC bellemsrp::Element* parse(const std::string &input, const std::string& rule);
	};
}

#endif /* BELLE_MSRP_PARSER_HPP */
