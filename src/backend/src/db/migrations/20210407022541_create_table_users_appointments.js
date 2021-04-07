
exports.up = function(knex) {
    return knex.schema.createTable('user_appointment', function(table) {
        table.increments('id').primary();
        table.integer('user_id').notNullable();
        table.integer('appointment_id').notNullable();
        table.foreign('user_id').references('id').inTable('user');
        table.foreign('appointment_id').references('id').inTable('appointment');
    });
};

exports.down = function(knex) {
    return knex.schema.dropTable('user_appointment');
};
