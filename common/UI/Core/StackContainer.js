var stack = [];
var cacheStack = {};

function push(item) {
    if (!item) return console.error('StackContainer push err, invalid item.');
    stack.push(item);
    return item;
}

function pop() {
    if (stack.length <= 0) return console.error('StackContainer pop err, empty stack.');
    return stackView.pop();
}

function current() {
    if (stack.length <= 0) return console.error('StackContainer pop err, empty stack.');
    return stack[stack.length - 1];
}

function removeAfterIndex(index) {
    return stack.splice(index, stack.length - index);
}

function removeStack(deletePos,deleteCount) {
    return stack.splice(deletePos,deleteCount);
}
