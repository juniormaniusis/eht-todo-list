pragma solidity ^0.5.0;

contract TodoList {
    uint256 public taskCount = 0;

    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    event TaskCreated(uint256 id, string content, bool completed);
    event TaskCompleted(uint id, bool completed);

    mapping(uint256 => Task) public tasks;

    constructor() public {
        createTask("auto generated task");
    }

    function createTask(string memory _content) public {
        // inscrease the value by 1
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint256 _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed; 
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }

}
