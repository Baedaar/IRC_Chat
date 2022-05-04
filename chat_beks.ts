var socket = require('socket.io-client')('http://localhost:9000');
const repl = require('repl');
const chalk = require('chalk');
import * as readline from "readline";
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: true
});

rl.question('Login: ', (username)=>{

    socket.emit('msg', username + ' is connected');
    socket.on('bvn', (msg:string) => {
        console.log(chalk.blue(msg + username +' !'))
        // username = process.argv[2]
        socket.on('bvn', function(msg:string) { 
        console.log(msg + username+' !')
        });
    })

    socket.on('message', (data:string) => {
        const cmd:String = data, username:String = data;
        console.log(chalk.green(username + ': '+ cmd.split('\n')[0]));
    })
    

    repl.start({
        prompt: '',
        eval: (cmd:string) => {
            socket.send(cmd,username)
        }
    })
    
    socket.on('disconnect', function() {
        socket.emit('disconnect')
    });
})