CREATE TABLE "address" (
	"id" serial PRIMARY KEY NOT NULL,
	"street_address_1" varchar(255) NOT NULL,
	"street_address_2" varchar(255),
	"zipCode" varchar(16) NOT NULL,
	"deliveryInstructions" varchar(255),
	"userId" integer NOT NULL,
	"cityId" integer NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "category" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT "category_name_unique" UNIQUE("name")
);
--> statement-breakpoint
CREATE TABLE "city" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	"stateId" integer NOT NULL,
	CONSTRAINT "city_ak_1" UNIQUE("name","stateId")
);
--> statement-breakpoint
CREATE TABLE "comment" (
	"id" serial PRIMARY KEY NOT NULL,
	"orderId" integer NOT NULL,
	"userId" integer NOT NULL,
	"commentText" text NOT NULL,
	"isComplaint" boolean NOT NULL,
	"isPraise" boolean NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "driver" (
	"id" serial PRIMARY KEY NOT NULL,
	"carMake" varchar(255) NOT NULL,
	"carModel" varchar(255) NOT NULL,
	"carYear" integer NOT NULL,
	"userId" integer NOT NULL,
	"online" boolean NOT NULL,
	"delivering" boolean NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "menu_item" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	"restaurantId" integer NOT NULL,
	"categoryId" integer NOT NULL,
	"description" text NOT NULL,
	"ingredients" text NOT NULL,
	"price" numeric(12, 2) NOT NULL,
	"active" boolean NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "orders" (
	"id" serial PRIMARY KEY NOT NULL,
	"restaurantId" integer NOT NULL,
	"estimatedDeliveryTime" timestamp NOT NULL,
	"actualDeliveryTime" timestamp,
	"deliveryAddressId" integer NOT NULL,
	"userId" integer NOT NULL,
	"driverId" integer,
	"price" numeric(12, 2) NOT NULL,
	"discount" numeric(12, 2) NOT NULL,
	"finalPrice" numeric(12, 2) NOT NULL,
	"comment" text,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "order_menu_item" (
	"id" serial PRIMARY KEY NOT NULL,
	"orderId" integer NOT NULL,
	"menuItemId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"itemPrice" numeric(12, 2) NOT NULL,
	"price" numeric(12, 2) NOT NULL,
	"comment" text
);
--> statement-breakpoint
CREATE TABLE "order_status" (
	"id" serial PRIMARY KEY NOT NULL,
	"orderId" integer NOT NULL,
	"statusCatalogId" integer NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "restaurant" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	"streetAddress" varchar(255) NOT NULL,
	"zipCode" varchar(16) NOT NULL,
	"cityId" integer NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "restaurant_owner" (
	"id" serial PRIMARY KEY NOT NULL,
	"restaurantId" integer NOT NULL,
	"ownerId" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE "state" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	"code" varchar(2) NOT NULL,
	CONSTRAINT "state_name_unique" UNIQUE("name"),
	CONSTRAINT "state_code_unique" UNIQUE("code")
);
--> statement-breakpoint
CREATE TABLE "status_catalog" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT "status_catalog_name_unique" UNIQUE("name")
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	"contact_phone" varchar(255) NOT NULL,
	"phoneVerified" boolean NOT NULL,
	"email" varchar(255) NOT NULL,
	"emailVerified" boolean NOT NULL,
	"confirmationCode" varchar(255),
	"password" varchar(255) NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "users_contact_phone_unique" UNIQUE("contact_phone"),
	CONSTRAINT "users_email_unique" UNIQUE("email")
);
--> statement-breakpoint
ALTER TABLE "address" ADD CONSTRAINT "address_userId_users_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "address" ADD CONSTRAINT "address_cityId_city_id_fk" FOREIGN KEY ("cityId") REFERENCES "public"."city"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "city" ADD CONSTRAINT "city_stateId_state_id_fk" FOREIGN KEY ("stateId") REFERENCES "public"."state"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "comment" ADD CONSTRAINT "comment_orderId_orders_id_fk" FOREIGN KEY ("orderId") REFERENCES "public"."orders"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "comment" ADD CONSTRAINT "comment_userId_users_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "driver" ADD CONSTRAINT "driver_userId_users_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "menu_item" ADD CONSTRAINT "menu_item_restaurantId_restaurant_id_fk" FOREIGN KEY ("restaurantId") REFERENCES "public"."restaurant"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "menu_item" ADD CONSTRAINT "menu_item_categoryId_category_id_fk" FOREIGN KEY ("categoryId") REFERENCES "public"."category"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_restaurantId_restaurant_id_fk" FOREIGN KEY ("restaurantId") REFERENCES "public"."restaurant"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_deliveryAddressId_address_id_fk" FOREIGN KEY ("deliveryAddressId") REFERENCES "public"."address"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_userId_users_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_driverId_driver_id_fk" FOREIGN KEY ("driverId") REFERENCES "public"."driver"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "order_menu_item" ADD CONSTRAINT "order_menu_item_orderId_orders_id_fk" FOREIGN KEY ("orderId") REFERENCES "public"."orders"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "order_menu_item" ADD CONSTRAINT "order_menu_item_menuItemId_menu_item_id_fk" FOREIGN KEY ("menuItemId") REFERENCES "public"."menu_item"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "order_status" ADD CONSTRAINT "order_status_orderId_orders_id_fk" FOREIGN KEY ("orderId") REFERENCES "public"."orders"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "order_status" ADD CONSTRAINT "order_status_statusCatalogId_status_catalog_id_fk" FOREIGN KEY ("statusCatalogId") REFERENCES "public"."status_catalog"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "restaurant" ADD CONSTRAINT "restaurant_cityId_city_id_fk" FOREIGN KEY ("cityId") REFERENCES "public"."city"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "restaurant_owner" ADD CONSTRAINT "restaurant_owner_restaurantId_restaurant_id_fk" FOREIGN KEY ("restaurantId") REFERENCES "public"."restaurant"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "restaurant_owner" ADD CONSTRAINT "restaurant_owner_ownerId_users_id_fk" FOREIGN KEY ("ownerId") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "restaurant_name_index" ON "restaurant" USING btree ("name");