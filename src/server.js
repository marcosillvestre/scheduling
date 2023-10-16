import cors from 'cors'
import express from 'express'
import route from './routes/route.js'

class App {
    constructor() {
        this.app = express()
        this.app.use(cors())

        this.middlewares()
        this.routes()
    }
    middlewares() {
        this.app.use(express.json())
    }
    routes() {
        this.app.use(route)
    }
}

export default new App().app