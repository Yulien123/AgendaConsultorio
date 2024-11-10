const Especialidad = require('../models/especialidadesModels');

class EspecialidadesController {
    async getAll(req, res) {
        try {
            const especialidades = await Especialidad.getAll();

            const successMessage = req.query.success;
            res.render('especialidades/index', { especialidades, successMessage });
            //res.render('especialidades/index', { especialidades });

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
    // async store(req, res) {
    //     const { nombre } = req.body;
    //     try {
    //         const especialidad = await Especialidad.createNewEspecialidad(nombre);
    //         res.redirect('/especialidades');
    //     } catch (error) {
    //         console.error('Error creating especialidad:', error);
    //         res.status(500).json({ message: 'Error al crear especialidad' });
    //     }
    // }
    async store(req, res) {
        const { nombre } = req.body;
        try {
            const especialidad = await Especialidad.createNewEspecialidad(nombre);
            // res.render('especialidades/index', {
            //     especialidad,
            //     successMessage: 'Especialidad agregada correctamente'
            // });
            res.redirect('/especialidades');
        } catch (error) {
            res.render('especialidades/crear', { errorMessage: error.message });
            // console.error('Error creating especialidad:', error);
            // res.status(500).json({ message: 'Error al crear especialidad' });
        }
    }

    async edit(req, res) {

        
        //res.render('especialidades/editar:id');
        //res.render('especialidades/editar', { id });
        res.render('especialidades/editar');

    }
    async update(req, res) { 
        const { id } = req.params;
        const { nombre } = req.body;
        try {
            const especialidad = await Especialidad.updateEspecialidad(id, nombre);
            res.redirect('/especialidades');
        } catch (error) {    
            console.error('Error updating especialidad:', error);
            res.status(500).json({ message: 'Error al actualizar especialidad' });
        }
    }

    async inactivate(req, res) {
        const { id } = req.params;
        try {
            const especialidad = await Especialidad.inactivate(id);
            res.redirect('/especialidades');
        } catch (error) {
            console.error('Error inactivating especialidad:', error);
            res.status(500).json({ message: 'Error al inactivar especialidad' });
        }
    }
    async activate(req, res) {
        const { id } = req.params;
        try {
            const especialidad = await Especialidad.activate(id);
            res.redirect('/especialidades');
        } catch (error) {
            console.error('Error activating especialidad:', error);
            res.status(500).json({ message: 'Error al activar especialidad' });
        }
    }



}
module.exports = new EspecialidadesController()

