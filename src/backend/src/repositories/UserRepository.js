const connection = require('../db/index');

module.exports = {
    async getAllUserInformation(request, response) {
        try {
            const users = await connection()
            .select(
                ['u.name',
                'u.email',
                'm.name AS med_name',
                'm.description AS med_description',
                'a.name AS app_name',
                'a.description AS app_description',
                'a.date']
                )
            .from('user_medication AS um',)
            .innerJoin('user AS u', 'um.user_id', '=', 'u.id')
            .join('medication AS m', 'm.id', '=', 'um.medication_id')
            .innerJoin('user_appointment AS ua', 'ua.user_id', '=', 'u.id')
            .join('appointment AS a', 'a.id', '=', 'ua.appointment_id');

            return response.json(users);
        } catch (error) {
            return response.json(`The following error occurred: ${error.message}`);
        }
    },
}