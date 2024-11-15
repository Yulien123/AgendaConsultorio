const { z } = require('zod');

// Esquema de validación para la agenda completa
const AgendaSchema = z.object({
    fecha_creacion: z.date({
        invalid_type_error: 'La fecha de creación debe ser un tipo date',
        required_error: 'La fecha de creación es obligatoria'
    }).refine((date) => !isNaN(Date.parse(date)), {
        message: "Fecha de creación inválida"
    }),
    fecha_fin: z.date({
        invalid_type_error: 'La fecha de fin debe ser un tipo date',
        required_error: 'La fecha de fin es obligatoria'
    }).refine((date) => !isNaN(Date.parse(date)), {
        message: "Fecha de fin inválida"
    }),
    limite_sobreturnos: z.string({
        invalid_type_error: 'El límite de sobreturnos debe ser un número',
        required_error: 'El límite de sobreturnos es obligatorio'
    }).regex(/^\d+$/, { message: "El límite de sobreturnos debe ser un número" }),
    duracion_turnos: z.string({
        invalid_type_error: 'La duración debe ser un número',
        required_error: 'La duración es obligatoria'
    }).regex(/^\d+$/, { message: "La duración debe ser un número" }),
    nromatricula: z.string({
        invalid_type_error: 'La matrícula debe ser un número',
        required_error: 'La matrícula es obligatoria'
    }).regex(/^\d+$/, { message: "La matrícula debe ser un número" }),
    id_sucursal: z.string({
        invalid_type_error: 'La sucursal debe ser un número',
        required_error: 'La sucursal es obligatoria'
    }).regex(/^\d+$/, { message: "Seleccionar sucursal correcta" }),
    id_clasificacion: z.string({
        invalid_type_error: 'La clasificación debe ser un número',
        required_error: 'La clasificación es obligatoria'
    }).regex(/^\d+$/, { message: "Seleccionar clasificación correcta" }),
});

const validateAgendas = (input) => {
    const result = AgendaSchema.safeParse(input);
    if (!result.success) {
        return result;
    }

    // Transformar los datos validados a los tipos correctos
    const data = result.data;
    return {
        success: true,
        data: {
            fecha_creacion: new Date(data.fecha_creacion),
            fecha_fin: new Date(data.fecha_fin),
            limite_sobreturnos: parseInt(data.limite_sobreturnos, 10),
            duracion_turnos: parseInt(data.duracion_turnos, 10),
            nromatricula: parseInt(data.nromatricula, 10),
            id_sucursal: parseInt(data.id_sucursal, 10),
            id_clasificacion: parseInt(data.id_clasificacion, 10),
        }
    };
};

// Esquema de validación para la agenda parcial
const AgendasValidationSchema = z.object({
    fecha_creacion: z.date().optional(),
    fecha_fin: z.date().optional(),
    limite_sobreturnos: z.string().optional(),
    duracion_turnos: z.string().optional(),
    nromatricula: z.string().optional(),
    id_sucursal: z.string().optional(),
    id_clasificacion: z.string().optional()
});

const validatePartialAgendas = (input) => {
    const result = AgendasValidationSchema.safeParse(input);
    if (!result.success) {
        return result;
    }

    // Transformar los datos validados a los tipos correctos 
    const data = result.data;
    return {
        success: true, data: {
            fecha_creacion: data.fecha_creacion ? new Date(data.fecha_creacion) : undefined,
            fecha_fin: data.fecha_fin ? new Date(data.fecha_fin) : undefined,
            limite_sobreturnos: data.limite_sobreturnos ? parseInt(data.limite_sobreturnos, 10) : undefined,
            duracion_turnos: data.duracion_turnos ? parseInt(data.duracion_turnos, 10) : undefined,
            nromatricula: data.nromatricula ? parseInt(data.nromatricula, 10) : undefined,
            id_sucursal: data.id_sucursal ? parseInt(data.id_sucursal, 10) : undefined,
            id_clasificacion: data.id_clasificacion ? parseInt(data.id_clasificacion, 10) : undefined,
        }
    };
};

module.exports = { validateAgendas, validatePartialAgendas };
