const express = require('express');
const EspecialidadesRouter = express.Router();
const especialidadesControllers = require('../controllers/EspecialidadesControllers');

EspecialidadesRouter.get('/', especialidadesControllers.getAll);
//Crear especialidad
EspecialidadesRouter.get('/create', especialidadesControllers.create);
//Actualizar especialidad
// EspecialidadRouter.post('/update/:id', EspecialidadController.update);
// //Eliminar especialidad
// EspecialidadRouter.post('/activar/:id', EspecialidadController.activar);
// //Inactivar especialidad
// EspecialidadRouter.post('/inactivar/:id', EspecialidadController.inactivar);



module.exports = EspecialidadesRouter;
