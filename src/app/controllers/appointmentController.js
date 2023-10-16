import { PrismaClient } from "@prisma/client";
import { v4 } from "uuid";
import yup from 'yup';

const prisma = new PrismaClient()
class AppointController {

    async store(req, res) {
        const { name, contact, hour, service } = req.body

        const schema = yup.object({
            name: yup.string().required(),
            contact: yup.string().required(),
            hour: yup.string().required(),
            service: yup.string().required(),
        })

        try {
            schema.validateSync(req.body, { abortEarly: false })
        } catch (error) {
            if (error) {
                return res.status(401).json('Validation fails')
            }
        }

        try {
            await prisma.apointment.create({
                data: {
                    name: name,
                    contact: contact,
                    hour: hour,
                    service: {
                        connect: {
                            id: service
                        }
                    }
                }
            })

            return res.status(200).json({ message: "Horário marcado com sucesso" })
        } catch (error) {
            if (error) {
                return res.status(401).json({ message: "Horário indisponível" });
            }
        }





        // create:
        // {
        //     service: {
        //         connect: {
        //             where: {
        //                 id: service
        //             }
        //         }
        //     },
        //     serviceName: "Corte e barba",
        //         howLong: "35m",
        //             price: 69.90,
        //                 status: true,
        //                     id: v4()
        // }

        // .findMany({ where: { date: date } })
        //     .then(async res => {
        //         if (res.length === 0) {
        //             await prisma.availableTimes.create({
        //                 data: {
        //                     name: name,
        //                     contact: contact,
        //                     date: date
        //                 }

        //             })
        //             return res.status(200).json({ message: "Horário marcado com sucesso" });
        //         } else {
        //             return res.status(401).json({ message: "Este horário não está disponível, tente outro" });

        //         }

        //     })


        // .then(async data => {
        //     let exist = data.map(info => info.date.day  === date.day && info.date.hour === date.hour)
        //     if (exist.map(res => res.includes)) {
        //         return res.status(401).json({ message: "Este horário não está disponível, tente outro" });
        //     } else {
        //         await prisma.availableTimes.create({
        //             data: {
        //                 name: name,
        //                 contact: contact,
        //                 date: date
        //             }
        //         })
        //         return res.status(200).json({ message: "Horário marcado com sucesso" });
        //     }

        // }
        // )

    }

    async index(req, res) {
        const data = await prisma.availableTimes.findMany()
        console.log(data.map(res => res.date))
        return res.status(200).json(data);
    }



    async storeServices(req, res) {
        const { serviceName, howLong, price } = req.body

        const schema = yup.object({
            serviceName: yup.string().required(),
            howLong: yup.string().required(),
            price: yup.number().required(),
        })

        try {
            schema.validateSync(req.body, { abortEarly: false })
        } catch (error) {
            if (error) {
                return res.status(401).json('Validation fails')
            }
        }

        try {
            await prisma.services.create({
                data: {
                    id: v4(),
                    serviceName: serviceName,
                    howLong: howLong,
                    price: price
                }
            })

            return res.status(200).json({ message: "Serviço criado com sucesso" });
        } catch (error) {
            console.log(error)
            return res.status(200).json({ message: "Algo deu errado confira as informações" });

        }

    }

    async indexServices(req, res) {

        const data = await prisma.services.findMany()
        return res.status(200).json(data);

    }
}

export default new AppointController()


// {
//     "id": "63d2631c-5ee0-41c4-81b4-39ddb58f3911",
//         "serviceName": "Corte comum",
//             "howLong": "35m",
//                 "price": 18,
//                     "apointmentId": null
// },
// {
//     "id": "7e8db165-8fae-417a-af4b-ec8957be504f",
//         "serviceName": "Corte e barba",
//             "howLong": "45m",
//                 "price": 30,
//                     "apointmentId": null
// }
