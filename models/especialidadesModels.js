const createConnection = require('../config/configDb');

class Especialidad {
    //Mostrar todos
    static async getAll() {
        let conn;
        try {
            conn = await createConnection();
            const [especialidades] = await conn.query('SELECT id, nombre FROM especialidades');
            return especialidades;
        } catch (error) {
            console.error('Error fetching especialidades:', error);
            throw new Error('Error al traer especialidades desde el modelo');
        } finally {
            if (conn) conn.end();
        }
    }

    static async create({ id_usuario, estado, especialidades, telefonos, matricula }) {
        console.log('Model: Create medico');
        let conn;
        try {
            conn = await createConnection();
            await conn.beginTransaction();

            // Insertar en la tabla medicos
            const [resultMedicos] = await conn.query(`
                INSERT INTO medicos (id_usuario, estado)
                VALUES (?, ?)
            `, [id_usuario, estado]);

            if (resultMedicos.affectedRows === 0) {
                throw new Error('Error al insertar en la tabla medicos');
            }

            // Verificar si la matrícula ya existe en la tabla medico_especialidad
            const [resultMatriculas] = await conn.query(`
                SELECT matricula FROM medico_especialidad WHERE matricula = ?;
            `, [matricula]);

            if (resultMatriculas.length > 0) {
                console.error('Model: Matricula duplicada para medico', matricula);
                throw new Error('Matrícula duplicada');
            }

            // Insertar en la tabla medico_especialidades
            const [resultEspecialidades] = await conn.query(`
                INSERT INTO medico_especialidad (id_medico, id_especialidad, matricula)
                VALUES (?, ?, ?)
            `, [id_usuario, especialidades, matricula]);

            if (resultEspecialidades.affectedRows === 0) {
                throw new Error('Error al insertar en la tabla medico_especialidad');
            }

            // Insertar en la tabla telefonos
            const [resultTelefonos] = await conn.query(`
                INSERT INTO telefonos (id_usuario, numero)
                VALUES (?, ?)
            `, [id_usuario, telefonos]);

            if (resultTelefonos.affectedRows === 0) {
                throw new Error('Error al insertar en la tabla telefonos');
            }

            await conn.commit();
            return id_usuario;
        } catch (error) {
            if (conn) await conn.rollback();
            console.error('Error creating medico:', error);
            throw new Error('Error al crear medico');
        } finally {
            if (conn) conn.end();
        }
    }



}

module.exports = Especialidad;
