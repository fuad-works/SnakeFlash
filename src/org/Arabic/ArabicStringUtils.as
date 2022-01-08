package org.Arabic  
{
	/**
	 * copyright (c) 2010 IxD Consultant (http://www.ixd-consultant.com)
	 * license
	 * 
	 * This program is free software: you can redistribute it and/or modify
     * it under the terms of the GNU General Public License as published by
	 * the Free Software Foundation, either version 3 of the License, or
	 * (at your option) any later version.
	 * 
	 * This program is distributed in the hope that it will be useful,
	 * but WITHOUT ANY WARRANTY; without even the implied warranty of
	 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	 * GNU General Public License <http://www.gnu.org/copyleft/gpl.html> for more details.
	 * 
	 * @author Ahmed Abbas, ahmed.abbas@ixd-consultant.com
	 * @contributors
	 * 	Jan Jonas
	 *		Leiter Softwareentwicklung
	 *		learnbit Internet und Multimedia GmbH
	 *		Buchwiese, Germany
	 *	Yasmin
	 *		aka geekgirl
	 * 	Ahmed Abdel Samea Hassan
	 * 		aka Amidos
	 */
	
	public class ArabicStringUtils 
	{
		private var chars:String = "";
		private var specialChars:String = "اأإآدذرزوؤء";
		
		/**
		 * Constructor
		 */
		public function ArabicStringUtils() 
		{
			specialChars += String.fromCharCode(0xFEFC,0xFEFB,0xFEF8,0xFEF7,0xFEFA,0xFEF9,0xFEF6,0xFEF5);
		}
		
		/**
		 * Get correct and concatenated arabic string
		 * @param	string	Input string
		 * @return	output correct order arabic string
		 */
		public function GetCorrectArabic(string:String):String
		{
			var returnString:String = "";
			var numbers:Boolean = checkNumbers(chars);
			var startingIndex:int = 0;
			var endingIndex:int = chars.length;
			var increment:int = 1;
			
			var array:Array = string.split(/(\d+)/);
			
			for (var j:int = array.length - 1; j >= 0; j -= 1)
			{
				chars = array[j];
				numbers = checkNumbers(chars);
				
				startingIndex = 0;
				endingIndex = chars.length;
				if (!numbers)
				{
					startingIndex = -(chars.length - 1);
					endingIndex = 1;
				}
				
				for (var i:int = startingIndex; i < endingIndex; i += 1)
				{
					returnString += getCharState(Math.abs(i));
				}
			}
			
			return returnString;
		}
		
		/**
		 * @private
		 * uses unicode character codes to get proper arabic characters with various cases.
		 * 
		 * @param chars String containing original text.
		 * @param i Number index of target character.
		 * @return String value with correct arabic character.
		 */
		private function getCharState(i:Number):String {
			var string:String;
			switch (chars.charAt(i)) {
				case "ا":
				string = setChar(i, String.fromCharCode(0x0627), String.fromCharCode(0x0627), String.fromCharCode(0xFE8E), String.fromCharCode(0xFE8E));
				break;
				case "أ":
				string = setChar(i, String.fromCharCode(0x0623), String.fromCharCode(0x0623), String.fromCharCode(0xFE84), String.fromCharCode(0xFE84));
				break;
				case "إ":
				string = setChar(i, String.fromCharCode(0x0625), String.fromCharCode(0x0625), String.fromCharCode(0xFE88), String.fromCharCode(0xFE88));
				break;
				case "آ":
				string = setChar(i, String.fromCharCode(0x0622), String.fromCharCode(0x0622), String.fromCharCode(0xFE82), String.fromCharCode(0xFE82));
				break;
				case "ب":
				string = setChar(i, String.fromCharCode(0x0628), String.fromCharCode(0xFE91), String.fromCharCode(0xFE92), String.fromCharCode(0xFE90));
				break;
				case "ت":
				string = setChar(i, String.fromCharCode(0x062A), String.fromCharCode(0xFE97), String.fromCharCode(0xFE98), String.fromCharCode(0xFE96));
				break;
				case "ث":
				string = setChar(i, String.fromCharCode(0x062B), String.fromCharCode(0xFE9B), String.fromCharCode(0xFE9C), String.fromCharCode(0xFE9A));
				break;
				case "ج":
				string = setChar(i, String.fromCharCode(0x062C), String.fromCharCode(0xFE9F), String.fromCharCode(0xFEA0), String.fromCharCode(0xFE9E));
				break;
				case "ح":
				string = setChar(i, String.fromCharCode(0x062D), String.fromCharCode(0xFEA3), String.fromCharCode(0xFEA4), String.fromCharCode(0xFEA2));
				break;
				case "خ":
				string = setChar(i, String.fromCharCode(0x062E), String.fromCharCode(0xFEA7), String.fromCharCode(0xFEA8), String.fromCharCode(0xFEA6));
				break;
				case "د":
				string = setChar(i, String.fromCharCode(0x062F), String.fromCharCode(0x062F), String.fromCharCode(0xFEAA), String.fromCharCode(0xFEAA));
				break;
				case "ذ":
				string = setChar(i, String.fromCharCode(0x0630), String.fromCharCode(0x0630), String.fromCharCode(0xFEAC), String.fromCharCode(0xFEAC));
				break;
				case "ر":
				string = setChar(i, String.fromCharCode(0x0631), String.fromCharCode(0x0631), String.fromCharCode(0xFEAE), String.fromCharCode(0xFEAE));
				break;
				case "ز":
				string = setChar(i, String.fromCharCode(0x0632), String.fromCharCode(0x0632), String.fromCharCode(0xFEB0), String.fromCharCode(0xFEB0));
				break;
				case "س":
				string = setChar(i, String.fromCharCode(0x0633), String.fromCharCode(0xFEB3), String.fromCharCode(0xFEB4), String.fromCharCode(0xFEB2));
				break;
				case "ش":
				string = setChar(i, String.fromCharCode(0x0634), String.fromCharCode(0xFEB7), String.fromCharCode(0xFEB8), String.fromCharCode(0xFEB6));
				break;
				case "ص":
				string = setChar(i, String.fromCharCode(0x0635), String.fromCharCode(0xFEBB), String.fromCharCode(0xFEBC), String.fromCharCode(0xFEBA));
				break;
				case "ض":
				string = setChar(i, String.fromCharCode(0x0636), String.fromCharCode(0xFEBF), String.fromCharCode(0xFEC0), String.fromCharCode(0xFEBE));
				break;
				case "ط":
				string = setChar(i, String.fromCharCode(0x0637), String.fromCharCode(0xFEC3), String.fromCharCode(0xFEC4), String.fromCharCode(0xFEC2));
				break;
				case "ظ":
				string = setChar(i, String.fromCharCode(0x0638), String.fromCharCode(0xFEC7), String.fromCharCode(0xFEC8), String.fromCharCode(0xFEC6));
				break;
				case "ع":
				string = setChar(i, String.fromCharCode(0x0639), String.fromCharCode(0xFECB), String.fromCharCode(0xFECC), String.fromCharCode(0xFECA));
				break;
				case "غ":
				string = setChar(i, String.fromCharCode(0x063A), String.fromCharCode(0xFECF), String.fromCharCode(0xFED0), String.fromCharCode(0xFECE));
				break;
				case "ف":
				string = setChar(i, String.fromCharCode(0x0641), String.fromCharCode(0xFED3), String.fromCharCode(0xFED4), String.fromCharCode(0xFED2));
				break;
				case "ق":
				string = setChar(i, String.fromCharCode(0x0642), String.fromCharCode(0xFED7), String.fromCharCode(0xFED8), String.fromCharCode(0xFED6));
				break;
				case "ك":
				string = setChar(i, String.fromCharCode(0x0643), String.fromCharCode(0xFEDB), String.fromCharCode(0xFEDC), String.fromCharCode(0xFEDA));
				break;
				case "ل":
				string = setChar(i, String.fromCharCode(0x0644), String.fromCharCode(0xFEDF), String.fromCharCode(0xFEE0), String.fromCharCode(0xFEDE));
				break;
				case "م":
				string = setChar(i, String.fromCharCode(0x0645), String.fromCharCode(0xFEE3), String.fromCharCode(0xFEE4), String.fromCharCode(0xFEE2));
				break;
				case "ن":
				string = setChar(i, String.fromCharCode(0x0646), String.fromCharCode(0xFEE7), String.fromCharCode(0xFEE8), String.fromCharCode(0xFEE6));
				break;
				case "ه":
				string = setChar(i, String.fromCharCode(0x0647), String.fromCharCode(0xFEEB), String.fromCharCode(0xFEEC), String.fromCharCode(0xFEEA));
				break;
				case "ة":
				string = setChar(i, String.fromCharCode(0x0629), "", "", String.fromCharCode(0xFE94));
				break;
				case "و":
				string = setChar(i, String.fromCharCode(0x0648), String.fromCharCode(0x0648), String.fromCharCode(0xFEEE), String.fromCharCode(0xFEEE));
				break;
				case "ؤ":
				string = setChar(i, String.fromCharCode(0x0624), String.fromCharCode(0x0624), String.fromCharCode(0xFE86), String.fromCharCode(0xFE86));
				break;
				case "ى":
				string = setChar(i, String.fromCharCode(0x0649), String.fromCharCode(0x0649), String.fromCharCode(0xFEF0), String.fromCharCode(0xFEF0));
				break;
				case "ي":
				string = setChar(i, String.fromCharCode(0x064A), String.fromCharCode(0xFEF3), String.fromCharCode(0xFEF4), String.fromCharCode(0xFEF2));
				break;
				case "ئ":
				string = setChar(i, String.fromCharCode(0x0626), String.fromCharCode(0xFE8B), String.fromCharCode(0xFE8C), String.fromCharCode(0xFE8A));
				break;
				case "ء":
				string = String.fromCharCode(0x0621);
				break;
				case "ـ":
				string = String.fromCharCode(0x0640);
				break;
				case "?":
				string = String.fromCharCode(0x061F);
				break;
				case ",":
				string = String.fromCharCode(0x060C);
				break;
				case ";":
				string = String.fromCharCode(0x061B);
				break;
				case "%":
				string = String.fromCharCode(0x066A);
				break;
				case "(":
				string = ")";
				break;
				case ")":
				string = "(";
				break;
				default:
				string = chars.charAt(i);
				break;
			}
			return string;
		}
		/**
		 * @private
		 * detects special cases for arabic ligatures.
		 * 
		 * @param chars String containing original text.
		 * @param i Number index of target character.
		 * @param solo String arabic character without joints.
		 * @param begin String arabic character with a trailing joint.
		 * @param middle String arabic character with both joint.
		 * @param end String arabic character with an initial joint.
		 * @return String value with correct arabic character.
		 */
		private function setChar(i:Number, solo:String, begin:String, middle:String, end:String):String {
			var string:String = "";
			//remove the alf after lam alef
			if (i != 0)
			{
				if (chars.charAt(i - 1) == "ل" && chars.charAt(i) == "ا") {
					return "";
				}
				if (chars.charAt(i - 1) == "ل" && chars.charAt(i) == "أ") {
					return "";
				}
				if (chars.charAt(i - 1) == "ل" && chars.charAt(i) == "إ") {
					return "";
				}
				if (chars.charAt(i - 1) == "ل" && chars.charAt(i) == "آ") {
					return "";
				}
			}
			// detect lam-alef (ﻻ) cases
			if (chars.charAt(i) == "ل" && chars.charAt(i+1) == "ا") {
				if (validateArabicChar(i-1) && specialChars.indexOf(chars.charAt(i-1)) == -1) {
					string = String.fromCharCode(0xFEFC);
				} else {
					string = String.fromCharCode(0xFEFB);
				}
				chars = chars.substring(0, i)+string+chars.substring(i+2, chars.length);
			} else if (chars.charAt(i) == "ل" && chars.charAt(i+1) == "أ") {
				if (validateArabicChar(i-1) && specialChars.indexOf(chars.charAt(i-1)) == -1) {
					string = String.fromCharCode(0xFEF8);
				} else {
					string = String.fromCharCode(0xFEF7);
				}
				chars = chars.substring(0, i)+string+chars.substring(i+2, chars.length);
			} else if (chars.charAt(i) == "ل" && chars.charAt(i+1) == "إ") {
				if (validateArabicChar(i-1) && specialChars.indexOf(chars.charAt(i-1)) == -1) {
					string = String.fromCharCode(0xFEFA);
				} else {
					string = String.fromCharCode(0xFEF9);
				}
				chars = chars.substring(0, i)+string+chars.substring(i+2, chars.length);
			} else if (chars.charAt(i) == "ل" && chars.charAt(i+1) == "آ") {
				if (validateArabicChar(i-1) && specialChars.indexOf(chars.charAt(i-1)) == -1) {
					string = String.fromCharCode(0xFEF6);
				} else {
					string = String.fromCharCode(0xFEF5);
				}
				chars = chars.substring(0, i)+string+chars.substring(i+2, chars.length);
			} else {
				// check for arabic character position in word (solo, begin, middle, end)
				if (i == 0) {
					if (specialChars.indexOf(chars.charAt(i)) != -1 || !validateArabicChar(i+1)) {
						string = solo;
					} else {
						string = begin;
					}
				} else if (i == chars.length-1) {
					if (specialChars.indexOf(chars.charAt(i-1)) != -1 || !validateArabicChar(i-1)) {
						string = solo;
					} else {
						string = end;
					}
				} else if (validateArabicChar(i-1) && validateArabicChar(i+1)) {
					if (specialChars.indexOf(chars.charAt(i-1)) != -1) {
						if (specialChars.indexOf(chars.charAt(i)) != -1) {
							string = solo;
						} else {
							string = begin;
						}
					} else {
						if (specialChars.indexOf(chars.charAt(i)) != -1 || chars.charAt(i+1) == "ء" || chars.charAt(i) == "ة") {
							if (chars.charAt(i-1) != "ة") {
								string = end;
							} else {
								string = begin;
							}
						} else {
							if (chars.charAt(i-1) != "ة") {
								string = middle;
							} else {
								string = begin;
							}
						}
					}
				} else {
					if (validateArabicChar(i-1) && !validateArabicChar(i+1)) {
						if (specialChars.indexOf(chars.charAt(i-1)) != -1) {
							string = solo;
						} else {
							string = end;
						}
					} else if (!validateArabicChar(i-1) && validateArabicChar(i+1)) {
						if (specialChars.indexOf(chars.charAt(i)) != -1) {
							string = solo;
						} else {
							string = begin;
						}
					} else if (!validateArabicChar(i-1) && !validateArabicChar(i+1)) {
						string = solo;
					}
				}
			}
			return string;
		}
		
		/**
		 * @private
		 * helper method detects valid Arabic only characters.
		 * 
		 * @param i Number index of target character.
		 * @return Boolean value of valid Arabic only character.
		 */
		private function validateArabicChar(i:Number):Boolean {
			var valid:Boolean = false;
			if (i>=0 && i<chars.length) {
				var code:Number = chars.charCodeAt(i);
				if (code >= 1570 && code <= 1594 || code >= 1600 && code <= 1610 || code >= 65154 && code <= 65276) {
					valid = true;
				}
			}
			return valid;
		}
		
		private function checkNumbers(string:String):Boolean
		{
			return string.search(/(\d+)/) != -1;
		}
		
	}

}