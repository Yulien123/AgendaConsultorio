const createConnection = require('../config/configDb');
//const Usuario = require('./usuariosModels'); // clase padre

class Agenda {
    constructor(id, fecha_creacion,fecha_fin, hora_inicio, hora_fin, duracion_turnos, limite_sobreturnos, matricula, id_sucursal, id_clasificacion) {
        this.id,
        this.fecha_creacion,
        this.fecha_fin,
        this.hora_inicio,
        this.hora_fin,
        this.duracion_turnos,
        this.limite_sobreturnos,
        this.matricula,
        this.id_sucursal,
        this.id_clasificacion
    }
    //Mostrar todos
    static async getAll() {
        console.log('Model: Get All agendas');
        let conn;
        try {
            conn = await createConnection();
            const [agendas] = await conn.query(`
               SELECT a.id, a.fecha_creacion, a.fecha_fin, a.hora_inicio, a.hora_fin, a.fecha_fin, a.duracion_turnos, a.limite_sobreturnos,
                p.nombre nombre, p.apellido apellido, e.nombre especialidad, s.nombre sucursal , c.nombre clasificacion 
                FROM agendas a 
                -- nombre especialidad 
                JOIN medico_especialidad me ON a.matricula = me.matricula 
                JOIN especialidades e on me.id_especialidad = e.id 
                -- nombre y apellido del medico 
                JOIN usuarios u ON me.id_medico = u.id JOIN personas p ON u.dni = p.dni 
                -- nombre sucursal 
                JOIN sucursales s ON a.id_sucursal = s.id 
                -- nombre clasificaicon 
                JOIN clasificaciones c ON a.id_clasificacion = c.id;
            `);
            return agendas
        } catch (error) {
            console.error('Error fetching agendas:', error);
            throw new Error('Error al traer agendas desde el modelo');
        } finally {
            if (conn) conn.end();
        }
    }
}
module.exports = Agenda;









