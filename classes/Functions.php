<?php
namespace classes;
class Functions
{
	public static function dateToMySQL($date)
	{
		return implode('-', array_reverse(explode('/', $date)));
	}

	public static function dateFromMySQL($date)
	{
		return implode('/', array_reverse(explode('-', $date)));
	}

	public static function decimalToMysql($value)
	{
		$searchReplace = ['.' => '', ',' => '.'];
		return strtr($value, $searchReplace);
	}
}