
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('medication').del()
    .then(function () {
      // Inserts seed entries
      return knex('medication').insert([
        {id: 1, name: 'Busonid Caps', description: 'Corticoide sistêmico'},
        {id: 2, name: 'Amoxilina', description: 'Sem informação'},
        {id: 3, name: 'Busonid Caps', description: 'Corticoide sistêmico'}
      ]);
    });
};
