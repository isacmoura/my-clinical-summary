
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('user').del()
    .then(function () {
      // Inserts seed entries
      return knex('user').insert([
        {id: 1, name: 'Isac Moura', email: 'teste@teste.com'},
        {id: 2, name: 'Ramon Sousa', email: 'ramon@teste.com'},
        {id: 3, name: 'Iago Martins', email: 'iago@teste.com'}
      ]);
    });
};
