import { Router } from "express";
import AppointController from '../app/controllers/appointmentController.js';

const route = new Router()

route.get("/", (req, res) => {
    return res.json({ message: "deu" })
})

route.post("/appoint", AppointController.store)




route.get("/appoint", AppointController.index)

route.post("/services", AppointController.storeServices)

route.get("/services", AppointController.indexServices)


export default route