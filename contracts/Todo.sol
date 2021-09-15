//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract TodoContract {
    struct Todo {
        uint256 id;
        uint256 date;
        string content;
        string author;
        bool isCompleted;
    }
    // Array wont scale ofcourse as you will need to loop through this.
    mapping(uint256 => Todo) todos;
    uint256 todoLength;

    constructor() {
        todoLength = 0;
    }

    // Events
    event TaskCreated(uint256, string, string);

    function createTodo(string memory _content, string memory _author) public {
        todos[todoLength] = Todo({
            id: todoLength + 1,
            date: block.timestamp,
            content: _content,
            author: _author,
            isCompleted: false
        });
        emit TaskCreated(todoLength, _content, _author);
        todoLength += 1;
    }

    modifier isTodoExist(uint256 x) {
        require(todos[x].id != 0, "Todo with that does not exist");
        _;
    }

    function getTodo(uint256 id)
        public
        view
        isTodoExist(id)
        returns (
            uint256,
            uint256,
            string memory,
            string memory,
            bool
        )
    {
        return (
            id,
            todos[id].date,
            todos[id].content,
            todos[id].author,
            todos[id].isCompleted
        );
    }
}
