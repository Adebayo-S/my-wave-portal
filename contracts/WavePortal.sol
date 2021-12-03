// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    event NewWave(address indexed from, uint256 timestamp, string message);
    /*address[] persons;
    struct Count{
        uint timesWaved;
    }

    mapping (address => Count) counts;*/

    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    Wave[] waves;

    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        /*persons.push(msg.sender);
        for (uint i=0; i < persons.length; i++) {
            if (counts[persons[i]].timesWaved > 0) { 
                counts[persons[i]].timesWaved += 1;
            } else counts[persons[i]].timesWaved = 1;  
        }
        console.log("%s has waved %s times", msg.sender, counts[msg.sender].timesWaved);
        for (uint i=0; i < persons.length; i++) {
            counts[persons[i]].timesWaved = 0; 
        } */        

        console.log("%s waved 2/ message %s", msg.sender, _message);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, block.timestamp, _message);

        uint256 prizeAmount = 0.0001 ether;
        require(
        prizeAmount <= address(this).balance,
        "Trying to withdraw more money than the contract has."
        );
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        require(success, "Failed to withdraw money from contract.");     
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

}
