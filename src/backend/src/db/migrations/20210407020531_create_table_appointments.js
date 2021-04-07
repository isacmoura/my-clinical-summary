
exports.up = function(knex) {
    return knex.schema.createTable('appointment', function(table) {
        table.increments('id').primary();
        table.string('name').notNullable();
        table.string('description').notNullable();
        table.datetime('date');
    });
};

exports.down = function(knex) {
    return knex.schema.dropTable('appointment');
};
