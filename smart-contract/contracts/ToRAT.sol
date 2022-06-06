//SPDX-License-Identifier: UNLICENSED
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

pragma solidity ^0.8.10;

contract ToRAToken is ERC721 {
    enum State { Created, Completed, Locked, Release, Inactive, Pending, Skip }
    State public state;

    uint public tokenCounter;
    address public owner;
    address[] setAddressFunders;
    IERC20 public token; 

    /// The contract is invalid State
    error InvalidState();

    modifier inState(State[2] memory _states) {
        bool isInState = false;
        for (uint i = 0; i < _states.length; i++) {
            if (State.Skip == _states[i]) continue;
            if (state == _states[i]) {
                isInState = true;
                break;
            }
        }

        if (!isInState) revert InvalidState();
        _;
    } 

    /// The contract is invalid State
    error IsOwner();

    modifier isOwner(address _owner) {
        if (owner == _owner) revert  IsOwner();
        _;
    } 

    struct ContentOfContract {
        string  contractb64;
        string description;
        uint256 goal;
        uint256 deadLine;
    }

    ContentOfContract public contentOfContract;

    struct FounderMetaData{
        uint256[] amount;
        uint256[] createdAt;
    }

    struct Founders {
        FounderMetaData foundingHistory;
    }

    mapping(address => Founders) public founders;


    constructor(uint256 _goal) payable {
        state = State.Created;
        tokenCounter = 0;
        owner = payable(msg.sender);
        contentOfContract.goal = _goal;
    }

    receive() external payable {
        // prevent the native coin of a chain (ZENIQ coin) to be sent to this contract
        revert("Native deposit not supported");
    }

    function confirmFunding() external inState([State.Created, State.Pending]) payable {
        require(msg.value > 0, "Amount needs to be greater than 0");
        require((msg.value + tokenCounter) > contentOfContract.goal, "The invest plus the current invest is greater than goal");

        state = State.Locked;    

        FounderMetaData memory fh  = founders[msg.sender].foundingHistory;
        uint lastIndex = fh.amount.length;
        
        if (lastIndex == 0) setAddressFunders.push(msg.sender);

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
            
            uint total = 0;
            for (uint i = 0; i < setAddressFunders.length; i++) {
                address currentAddress = setAddressFunders[i];
                FounderMetaData memory fh  = founders[currentAddress].foundingHistory;

                for (uint j = 0; j < fh.amount.length; j++) 
                    total += fh.amount[j];

                // This will be put on ownercontract account
                
            }
        }        
    }
    
    // Get founder foundings by address
    function getFounders () external view returns (FounderMetaData memory) {
        return founders[msg.sender].foundingHistory;
     }

}