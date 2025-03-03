// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Letter {
    struct Message {
        address sender;
        string text;
        string color;
        uint256 timestamp;
    }

    Message[] public messages;
    mapping(uint256 => string) public messageColors; // Mapping to store colors by message index
    uint public totalLetters;
    uint256 public basePrice = 0.01 ether;
    uint256 public colorPrice = 0.005 ether;

    constructor(uint nums) {
        totalLetters = nums;
    }

    event NewMessage(address indexed sender, string text, string color, uint256 timestamp);

    function writeMessage(string memory _text, string memory _color) public payable {
        totalLetters++;
        uint256 requiredPayment = bytes(_color).length > 0 ? basePrice + colorPrice : basePrice;
        require(msg.value >= requiredPayment, "Not enough ETH sent");

        messages.push(Message(msg.sender, _text, _color, block.timestamp));
        messageColors[messages.length - 1] = _color; // Store the color in the mapping

        emit NewMessage(msg.sender, _text, _color, block.timestamp);
    }

    function getMessages() public view returns (Message[] memory) {
        return messages;
    }

    function withdraw() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}
