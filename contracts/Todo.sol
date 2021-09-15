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
    Todo[] todos;
    uint256 todoLength;

    constructor() {
        todoLength = 0;
    }

    function createTodo(string memory _content, string memory _author) public {
        todos.push(
            Todo({
                id: todoLength + 1,
                date: block.timestamp,
                content: _content,
                author: _author,
                isCompleted: false
            })
        );
        todoLength += 1;
    }

    function getTodo(uint256 id)
        public
        view
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

    function getTodos() public view returns (Todo[] memory) {
        return todos;
    }
}
