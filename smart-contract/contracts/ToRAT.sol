//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.10;

contract ToRAT  {

    enum State { Created, Locked, Release, Inactive, Pending, Skip}
    
    State public state;
    uint public tokenCounter;
    address public owner;
    uint public countContracts;

    /// The contract is invalid State
    error InvalidState();

    modifier inState(State[2] memory _states) {
        bool isInState = false;
        for (uint i = 0; i < _states.length; i++) {
            if (State.Skip == _states[i])
                continue;
            if (!isInState && state == _states[i]) 
                isInState= true;
        }

        if (!isInState) 
            revert InvalidState();
        _;
    } 

    /// The contract is invalid State
    error IsOwner();

    modifier isOwner(address _owner) {
        if (owner == _owner)
            revert  IsOwner();
        _;
    } 

    struct ContentOfContract {
        string  contractb64;
        string description;
        uint256 goal;
    }

    struct FounderMetaData{
        uint256[] amount;
        uint256[] createdAt;
    }

    struct Founders {
        FounderMetaData foundingHistory;
    }

    mapping(address => Founders) public founders;

    ContentOfContract public contentOfContract;



    constructor(uint256 _goal) payable {
        state = State.Created;
        tokenCounter = 0;
        owner =  payable(msg.sender);
        contentOfContract.goal = _goal;
    }

    function confirmFunding() external inState([State.Created, State.Pending]) payable {
        require(msg.value > 0, "Amount needs to be greater than 0");

        state = State.Locked;    
        FounderMetaData memory fh  = founders[msg.sender].foundingHistory;
        uint lastIndex = fh.amount.length;

        fh.amount[lastIndex] = msg.value;
        fh.createdAt[lastIndex] = block.timestamp;
        
        tokenCounter += msg.value;

        reachGoal();
    }

    function lockContract () public inState([State.Created, State.Skip]) {
        state = State.Locked;
    }

    function reachGoal () public {
        if (tokenCounter >= contentOfContract.goal) {
            state = State.Release;
        }        
    }
}