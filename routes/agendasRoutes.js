const express = require('express');
const AgendasRouter = express.Router()
const AgendasControllers = require('../controllers/AgendasControllers');

// Index
AgendasRouter.get('/', AgendasControllers.get);
/*
// Vista crear (GET para mostrar el formulario)
AgendasRouter.get('/create', AgendasControllers.getCreateForm);

// redirigir a la vista crear
AgendasRouter.get('/create', AgendasControllers.create);

// Guardar nuevo agendas (POST para la ruta raíz, si es necesario)
AgendasRouter.post('/', AgendasControllers.store);

// Vista editar
AgendasRouter.get('/edit/:dni', AgendasControllers.edit);

// Actualizar agendas
AgendasRouter.post('/update/:dni', AgendasControllers.update);

// Eliminar agendas
AgendasRouter.post('/activar/:dni', AgendasControllers.activar)
//inactivar
AgendasRouter.post('/inactivar/:dni', AgendasControllers.inactivar);
*/

module.exports = AgendasRouter