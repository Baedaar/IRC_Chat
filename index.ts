import { Socket } from "socket.io";

const http = require('http').createServer();
const io = require('socket.io')(http);
const port = 9000;
// io.on('connection', (socket:string) => {
//     console.log('connected')
// })
// io.on('disconnect', (evt:string) => {
//     console.log('disconnected')
// })
// io.on('connection', (socket:string) => {
//     console.log('connected')
// }),
io.on('connection', (socket:Socket) => {
    socket.on('msg', (msg:string) => {
        console.log(msg)
        io.emit('bvn', 'BIENVENU DANS LE BEKS ');
    })
    socket.on('message', (evt:string) => {
       
        console.log(evt)
        socket.broadcast.emit('message', evt)
        
    })
}),



http.listen(port, () => console.log('server BEKS start'));