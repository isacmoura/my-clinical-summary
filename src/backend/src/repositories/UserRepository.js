const connection = require('../db/index');

module.exports = {
    async getAllUserInformation(request, response) {
        try {
            const users = await connection('user_medication AS um')
            .select(
                ['u.name',
                'u.email',
                connection.raw("JSON_AGG(JSON_BUILD_OBJECT('name', m.name, 'description', m.description)) AS medications"),
                connection.raw("JSON_AGG(JSON_BUILD_OBJECT('name', a.name, 'description', a.description, 'date', a.date)) AS appointments"),
            ]
                )
            .join('user AS u', 'um.user_id', '=', 'u.id')
            .join('medication AS m', 'm.id', '=', 'um.medication_id')
            .join('user_appointment AS ua', 'ua.user_id', '=', 'u.id')
            .join('appointment AS a', 'a.id', '=', 'ua.appointment_id')
            .groupBy('u.id','u.name');

            return response.json(users);
        } catch (error) {
            return response.json(`The following error occurred: ${error.message}`);
        }
    },

    async getUserInformation(request, response) {
        try {
            const user_id = request.params.user_id;

            const user = await connection('user_medication AS um')
            .select(
                ['u.name',
                'u.email',
                'm.name AS med_name',
                'm.description AS med_description',
                'a.name AS app_name',
                'a.description AS app_description',
                'a.date']
                )
            .join('user AS u', 'um.user_id', '=', 'u.id')
            .join('medication AS m', 'm.id', '=', 'um.medication_id')
            .join('user_appointment AS ua', 'ua.user_id', '=', 'u.id')
            .join('appointment AS a', 'a.id', '=', 'ua.appointment_id')
            .where('u.id', user_id);

            return response.json(user);
        } catch (error) {
            return response.json(`The following error occurred: ${error.message}`);
        }
    }
}