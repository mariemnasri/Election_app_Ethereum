// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

contract Election{

    //Read/write candidate 
    string public candidate; 

    //Constructor 
    constructor() public {
        //candidate = "Candidate 1";
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
    //Model a Candidate 

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //Read/write Candidates 
    mapping(uint => Candidate)public candidates;

    //Store Candiates Count
    uint public candidatesCount;

    //Add Candidates to the mapping
    function addCandidate(string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }

    //Store accounts that have voted 
    mapping(address => bool) public voters; 

    //Vote function 
    function vote (uint _candidateId) public{
        //require that they haven't voted before 
        require(!voters[msg.sender]);

        //require a valid candidate 
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        //record that voter has voted 
        voters[msg.sender] = true;

        //update candidate vote Count
        candidates[_candidateId].voteCount ++ ;
    }
}