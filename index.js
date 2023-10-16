import app from './src/server.js'
const time = new Date()
const door = 6666

app.listen(door, () => console.log(`Running on ${door} at ${time}`))