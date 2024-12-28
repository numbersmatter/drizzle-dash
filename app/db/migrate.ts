import { migrate } from 'drizzle-orm/postgres-js/migrator';
import config from '$/drizzle.config';
import { db } from '~/db';
import env from '~/env';

if(!env.DB_MIGRATING){
  throw new Error ("You must set  DB_Migrating to 'true' when running migration")
}

await migrate(db, { migrationsFolder: config.out! });