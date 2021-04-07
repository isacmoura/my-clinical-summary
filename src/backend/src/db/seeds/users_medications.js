
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('user_medication').del()
    .then(function () {
      // Inserts seed entries
      return knex('user_medication').insert([
        {id: 1, user_id: 1, medication_id: 1},
        {id: 2, user_id: 2, medication_id: 2},
        {id: 3, user_id: 3, medication_id: 3}
      ]);
    });
};
