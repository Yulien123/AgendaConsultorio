const express = require('express');
const EspecialidadesRouter = express.Router();
const especialidadesControllers = require('../controllers/EspecialidadesControllers');

EspecialidadesRouter.get('/', especialidadesControllers.getAll);

//Crear especialidad
EspecialidadesRouter.get('/create', especialidadesControllers.create);

//Guardar especialidad
EspecialidadesRouter.post('/', especialidadesControllers.store);

// Editar especialidad
EspecialidadesRouter.get('/edit/:id', especialidadesControllers.edit);

//Actualizar especialidad
EspecialidadesRouter.put('/update/:id', especialidadesControllers.update);

//Activar especialidad
EspecialidadesRouter.post('/activar/:id', especialidadesControllers.activate);

//Inactivar especialidad
EspecialidadesRouter.post('/inactivar/:id', especialidadesControllers.inactivate);




module.exports = EspecialidadesRouter;
