import { defineConfig } from "drizzle-kit";
import env from '~/env';


export default defineConfig({
  dialect: "postgresql",
  migrations: {
    prefix: "timestamp",
    table: "__drizzle_migrations__",
    schema: "public",
  },
  out: "./app/db/migrations",
  schema:"./app/db/schema/index.ts",
  dbCredentials: {
    url: env.DATABASE_URL
  },
  verbose: true,
  strict: true
})
