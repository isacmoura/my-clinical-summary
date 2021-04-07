
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('appointment').del()
    .then(function () {
      // Inserts seed entries
      return knex('appointment').insert([
        {id: 1, name: 'Exame de sangue', description: 'Realização de exame de sangue', date: '2021-04-10T17:15:49-03:00'},
        {id: 2, name: 'Exame de urina', description: 'Realização de exame de urina', date: '2021-04-10T17:15:49-03:00'},
        {id: 3, name: 'Checkup', description: 'Realização de checkup', date: '2021-04-10T17:15:49-03:00'}
      ]);
    });
};
