pragma solidity ^0.4.0;

import "./GawooniSale.sol";

contract PreSale is GawooniSale {
	function PreSale(
		address _mintableToken,
		address _btcToken,
		uint256 _start,
		uint256 _end,
		uint256 _cap)
	GawooniSale(_mintableToken, _btcToken, _start, _end, _cap) {

	}

	function getBonus(uint256 sold) constant public returns (uint256) {
		return getTimeBonus(sold) + getAmountBonus(sold);
	}

	function getTimeBonus(uint256 sold) internal returns (uint256) {
		return sold.div(2);
	}

	function getAmountBonus(uint256 sold) internal returns (uint256) {
		if (sold >= 100000 * 10**18) {
			return sold;
		} else if (sold >= 50000 * 10 ** 18) {
			return sold.mul(75).div(100);
		} else {
			return 0;
		}
	}
}
