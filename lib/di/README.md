// Example : If a dependency needs async initialization
// serviceLocator.registerSingletonAsync<DatabaseService>(
// () async {
// final db = DatabaseService();
// await db.init();
// return db;
// },
// );

// Wait for all async dependencies to be ready
await serviceLocator.allReady();
