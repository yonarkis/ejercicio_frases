import { Router } from 'express'
const router = Router()

const ctrlFrases = require('../controllers/frases.controller')

 // api/entidades/

router.post('/encontrarFrases', ctrlFrases.encontrarFrases)

export default router