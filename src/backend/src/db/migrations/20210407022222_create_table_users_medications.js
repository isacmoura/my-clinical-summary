
exports.up = function(knex) {
    return knex.schema.createTable('user_medication', function(table) {
        table.increments('id').primary();
        table.integer('user_id').notNullable();
        table.integer('medication_id').notNullable();
        table.foreign('user_id').references('id').inTable('user');
        table.foreign('medication_id').references('id').inTable('medication');
    });
};

exports.down = function(knex) {
    return knex.schema.dropTable('user_medication');
};
