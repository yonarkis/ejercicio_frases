import express, { json } from 'express'
import morgan from 'morgan'
const cors = require('cors');


// Importing routes
import frasesRoutes from './routes/frases.routes'

//initialization
const app = express()
app.use(cors());

// middelwares
app.use(morgan('dev'));
app.use(json());

// routes
app.use('/api/frases', frasesRoutes)

export default app;