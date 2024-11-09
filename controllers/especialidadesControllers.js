const Especialidad = require('../models/especialidadesModels');

class EspecialidadesController {
    async getAll(req, res) {
        try {
            const especialidades = await Especialidad.getAll();
            res.render('especialidades/index', { especialidades });

            //res.status(200).json(especialidades);
        } catch (error) {
            console.error('Error fetching especialidades:', error);
            res.status(500).json({ message: 'Error al traer especialidades' });
        }
    }

    // async create(req, res) {
    //     const { nombre } = req.body;
    //     try {
    //         const especialidad = await Especialidad.createNewEspecialidad(nombre);
    //         res.redirect('/especialidades');
    //     } catch (error) {
    //         console.error('Error creating especialidad:', error);
    //         res.status(500).json({ message: 'Error al crear especialidad' });
    //     }
    // }
    create(req, res) {
        res.render('especialidades/crear')
    }
}
module.exports = new EspecialidadesController()

