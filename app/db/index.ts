import 'dotenv/config';
import { drizzle } from 'drizzle-orm/node-postgres';
import env from "~/env"
import * as schema from "~/db/schema"

export const db = drizzle({
  connection:{
   connectionString: env.DATABASE_URL!,
   ssl: env.SSL,
  },
  casing:'snake_case',
  schema

});




export type db = typeof db;

