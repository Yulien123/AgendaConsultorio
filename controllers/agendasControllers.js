const Medico = require('../models/medicosModels')// Modelo de médicos
const Persona = require('../models/personasModels')// Modelo de Personas
const Usuario = require('../models/usuariosModels')// Modelo de Usuarios
const Especialidad = require('../models/especialidadesModels') // Modelo de especialidades
const Agenda = require('../models/agendasModels') // Modelo de especialidades

//const { validateMedicos, validatePartialMedicos } = require('../schemas/validation')
const { obtenerFechaFormateada } = require('../utils/dateFormatter');
const { obtenerHoraFormateada } = require('../utils/timeFormatter');

class AgendasController {
    //Mostrar todas los medicos
    async get(req, res, next) {
        console.log('Controller: Get All agendas');
        try {
            const agendas = await Agenda.getAll();

            //formatear hora
            const agendaFormateada = agendas.map(agenda => {
                const { hora_inicio } = agenda
                const { hora_fin } = agenda
                const { fecha_creacion } = agenda
                const { fecha_fin } = agenda
                const horarInicioFormateado = obtenerHoraFormateada(hora_inicio)
                const horarfinFormateado = obtenerHoraFormateada(hora_fin)
                const fechaCreacionFormateada = obtenerFechaFormateada(new Date(fecha_creacion))
                const fechaFinFormateada = obtenerFechaFormateada(new Date(fecha_fin))
                return {
                    ...agenda,
                    hora_inicio: horarInicioFormateado,
                    hora_fin: horarfinFormateado,
                    fecha_creacion: fechaCreacionFormateada,
                    fecha_fin: fechaFinFormateada
                }
            })

            //Flags para verificar cambios con mensajes en pantalla
            const { nombreUpdate, nombreStore, nombreInactivo, nombreActivo } = req.query;

            let mensaje = null;
            if (nombreInactivo) {
                mensaje = 'Se ha dado de Baja a un agenda';
            } else if (nombreActivo) {
                mensaje = 'Medico ha dado de Alta a un agenda';
            } else if (nombreUpdate) {
                mensaje = 'agenda Actualizado correctamente';
            } else if (nombreStore) {
                mensaje = 'agenda Creado correctamente';
            }
            //renderizo al index de agendas
            res.render('agendas/index', { agendas: agendaFormateada, mensaje });
        } catch (error) {
            console.error('Error al obtener agendas desde el controlador:', error);
            next(error);
        }
    }
}

module.exports = new AgendasController()