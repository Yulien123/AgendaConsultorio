const express = require('express');
const EspecialidadRouter = express.Router();
const EspecialidadController = require('../controllers/Especialidad');

EspecialidadRouter.get('/', EspecialidadController.getAll);
//Crear especialidad
EspecialidadRouter.get('/create', EspecialidadController.create);
//Actualizar especialidad
// EspecialidadRouter.post('/update/:id', EspecialidadController.update);
// //Eliminar especialidad
// EspecialidadRouter.post('/activar/:id', EspecialidadController.activar);
// //Inactivar especialidad
// EspecialidadRouter.post('/inactivar/:id', EspecialidadController.inactivar);


//module.exports = EspecialidadController;
module.exports = EspecialidadRouter;
