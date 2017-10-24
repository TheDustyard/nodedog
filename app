#!/usr/bin/env node

let ascii = [
    {
        raw: `
        ╲╲╲┏╮┏╮╲╲╲╲╲╲╲╲╲
        ╲╲╭┛┻┛┻╮╲╲╲╲╲╭━╮
        ▅━╯▋┈▋┈┃╲╲╲╲╲╰╮┃
        ┣━━━━━╯╰━━━━━╮┃┃
        ╰━━━━┓┈┈┈┈┈┈┈┗╯┃
        ╲╲╲╲╲┃┏┓┏━┳┳┓┏━╯
        ╲╲╲╲╲┗┛┗┛╲┗┛┗┛╲╲ 
        `,
        time: 800
    },
    {
        raw: `
        ╲╲╲╲╲╲╲╲╲╲╲╲╲╲╲╲
        ╲╲╲┏╮┏╮╲╲╲╲╲╲╭━╮
        ╲╲╭┛┻┛┻╮╲╲╲╲╲╰╮┃
        ▅━╯▋┈▋┈╰━━━━━╮┃┃
        ┣━━━━━╯┈┈┈┈┈┈┗╯┃
        ╰━━━━┓┏┓┏━┳┳┓┏━╯
        ╲╲╲╲╲┗┛┗┛╲┗┛┗┛╲╲ 
        `,
        time: 400
    }
];

let i = -1
let current;
let previous;

clear();
loop();
function loop() {
    previous = current;

    i++;
    if (i == ascii.length)
        i = 0;

    current = ascii[i];

    if (previous) {
        up(previous.raw.split('\n').length + 1);
    }
    console.log(current.raw);

    setTimeout(() => {
        loop();
    }, current.time);
}

function up(lines) {
    console.log("\x1b[" + lines + "A");
}

function down(lines) {
    console.log("\x1b[" + lines + "B");
}

function clear() {
    console.log("\033[2J");
}

process.on('SIGINT', function() {
    console.log("Caught interrupt signal");

    clear();

    process.exit();
});