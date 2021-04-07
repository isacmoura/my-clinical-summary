// Update with your config settings.

module.exports = {
  development: {
    client: 'pg',
    connection: {
      host:     "localhost",
      database: "clinical",
      user:     "postgres",
      password: ""
    },
    migrations: {
      directory: `${__dirname}/src/db/migrations`
    }
  },
};