
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('user_appointment').del()
    .then(function () {
      // Inserts seed entries
      return knex('user_appointment').insert([
        {id: 1, user_id: 1, appointment_id: 1},
        {id: 2, user_id: 2, appointment_id: 2},
        {id: 3, user_id: 3, appointment_id: 3}
      ]);
    });
};
