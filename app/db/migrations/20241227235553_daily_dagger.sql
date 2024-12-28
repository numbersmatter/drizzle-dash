ALTER TABLE "address" RENAME COLUMN "zipCode" TO "zip_code";--> statement-breakpoint
ALTER TABLE "address" RENAME COLUMN "deliveryInstructions" TO "delivery_instructions";--> statement-breakpoint
ALTER TABLE "address" RENAME COLUMN "userId" TO "user_id";--> statement-breakpoint
ALTER TABLE "address" RENAME COLUMN "cityId" TO "city_id";--> statement-breakpoint
ALTER TABLE "address" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "address" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "city" RENAME COLUMN "stateId" TO "state_id";--> statement-breakpoint
ALTER TABLE "comment" RENAME COLUMN "orderId" TO "order_id";--> statement-breakpoint
ALTER TABLE "comment" RENAME COLUMN "userId" TO "user_id";--> statement-breakpoint
ALTER TABLE "comment" RENAME COLUMN "commentText" TO "comment_text";--> statement-breakpoint
ALTER TABLE "comment" RENAME COLUMN "isComplaint" TO "is_complaint";--> statement-breakpoint
ALTER TABLE "comment" RENAME COLUMN "isPraise" TO "is_praise";--> statement-breakpoint
ALTER TABLE "comment" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "comment" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "driver" RENAME COLUMN "carMake" TO "car_make";--> statement-breakpoint
ALTER TABLE "driver" RENAME COLUMN "carModel" TO "car_model";--> statement-breakpoint
ALTER TABLE "driver" RENAME COLUMN "carYear" TO "car_year";--> statement-breakpoint
ALTER TABLE "driver" RENAME COLUMN "userId" TO "user_id";--> statement-breakpoint
ALTER TABLE "driver" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "driver" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "menu_item" RENAME COLUMN "restaurantId" TO "restaurant_id";--> statement-breakpoint
ALTER TABLE "menu_item" RENAME COLUMN "categoryId" TO "category_id";--> statement-breakpoint
ALTER TABLE "menu_item" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "menu_item" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "orders" RENAME COLUMN "restaurantId" TO "restaurant_id";--> statement-breakpoint
ALTER TABLE "orders" RENAME COLUMN "estimatedDeliveryTime" TO "estimated_delivery_time";--> statement-breakpoint
ALTER TABLE "orders" RENAME COLUMN "actualDeliveryTime" TO "actual_delivery_time";--> statement-breakpoint
ALTER TABLE "orders" RENAME COLUMN "deliveryAddressId" TO "delivery_address_id";--> statement-breakpoint
ALTER TABLE "orders" RENAME COLUMN "userId" TO "user_id";--> statement-breakpoint
ALTER TABLE "orders" RENAME COLUMN "driverId" TO "driver_id";--> statement-breakpoint
ALTER TABLE "orders" RENAME COLUMN "finalPrice" TO "final_price";--> statement-breakpoint
ALTER TABLE "orders" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "orders" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "order_menu_item" RENAME COLUMN "orderId" TO "order_id";--> statement-breakpoint
ALTER TABLE "order_menu_item" RENAME COLUMN "menuItemId" TO "menu_item_id";--> statement-breakpoint
ALTER TABLE "order_menu_item" RENAME COLUMN "itemPrice" TO "item_price";--> statement-breakpoint
ALTER TABLE "order_status" RENAME COLUMN "orderId" TO "order_id";--> statement-breakpoint
ALTER TABLE "order_status" RENAME COLUMN "statusCatalogId" TO "status_catalog_id";--> statement-breakpoint
ALTER TABLE "order_status" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "restaurant" RENAME COLUMN "streetAddress" TO "street_address";--> statement-breakpoint
ALTER TABLE "restaurant" RENAME COLUMN "zipCode" TO "zip_code";--> statement-breakpoint
ALTER TABLE "restaurant" RENAME COLUMN "cityId" TO "city_id";--> statement-breakpoint
ALTER TABLE "restaurant" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "restaurant" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "restaurant_owner" RENAME COLUMN "restaurantId" TO "restaurant_id";--> statement-breakpoint
ALTER TABLE "restaurant_owner" RENAME COLUMN "ownerId" TO "owner_id";--> statement-breakpoint
ALTER TABLE "users" RENAME COLUMN "phoneVerified" TO "phone_verified";--> statement-breakpoint
ALTER TABLE "users" RENAME COLUMN "emailVerified" TO "email_verified";--> statement-breakpoint
ALTER TABLE "users" RENAME COLUMN "confirmationCode" TO "confirmation_code";--> statement-breakpoint
ALTER TABLE "users" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "users" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "city" DROP CONSTRAINT "city_ak_1";--> statement-breakpoint
ALTER TABLE "address" DROP CONSTRAINT "address_userId_users_id_fk";
--> statement-breakpoint
ALTER TABLE "address" DROP CONSTRAINT "address_cityId_city_id_fk";
--> statement-breakpoint
ALTER TABLE "city" DROP CONSTRAINT "city_stateId_state_id_fk";
--> statement-breakpoint
ALTER TABLE "comment" DROP CONSTRAINT "comment_orderId_orders_id_fk";
--> statement-breakpoint
ALTER TABLE "comment" DROP CONSTRAINT "comment_userId_users_id_fk";
--> statement-breakpoint
ALTER TABLE "driver" DROP CONSTRAINT "driver_userId_users_id_fk";
--> statement-breakpoint
ALTER TABLE "menu_item" DROP CONSTRAINT "menu_item_restaurantId_restaurant_id_fk";
--> statement-breakpoint
ALTER TABLE "menu_item" DROP CONSTRAINT "menu_item_categoryId_category_id_fk";
--> statement-breakpoint
ALTER TABLE "orders" DROP CONSTRAINT "orders_restaurantId_restaurant_id_fk";
--> statement-breakpoint
ALTER TABLE "orders" DROP CONSTRAINT "orders_deliveryAddressId_address_id_fk";
--> statement-breakpoint
ALTER TABLE "orders" DROP CONSTRAINT "orders_userId_users_id_fk";
--> statement-breakpoint
ALTER TABLE "orders" DROP CONSTRAINT "orders_driverId_driver_id_fk";
--> statement-breakpoint
ALTER TABLE "order_menu_item" DROP CONSTRAINT "order_menu_item_orderId_orders_id_fk";
--> statement-breakpoint
ALTER TABLE "order_menu_item" DROP CONSTRAINT "order_menu_item_menuItemId_menu_item_id_fk";
--> statement-breakpoint
ALTER TABLE "order_status" DROP CONSTRAINT "order_status_orderId_orders_id_fk";
--> statement-breakpoint
ALTER TABLE "order_status" DROP CONSTRAINT "order_status_statusCatalogId_status_catalog_id_fk";
--> statement-breakpoint
ALTER TABLE "restaurant" DROP CONSTRAINT "restaurant_cityId_city_id_fk";
--> statement-breakpoint
ALTER TABLE "restaurant_owner" DROP CONSTRAINT "restaurant_owner_restaurantId_restaurant_id_fk";
--> statement-breakpoint
ALTER TABLE "restaurant_owner" DROP CONSTRAINT "restaurant_owner_ownerId_users_id_fk";
--> statement-breakpoint
ALTER TABLE "address" ADD CONSTRAINT "address_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "address" ADD CONSTRAINT "address_city_id_city_id_fk" FOREIGN KEY ("city_id") REFERENCES "public"."city"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "city" ADD CONSTRAINT "city_state_id_state_id_fk" FOREIGN KEY ("state_id") REFERENCES "public"."state"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "comment" ADD CONSTRAINT "comment_order_id_orders_id_fk" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "comment" ADD CONSTRAINT "comment_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "driver" ADD CONSTRAINT "driver_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "menu_item" ADD CONSTRAINT "menu_item_restaurant_id_restaurant_id_fk" FOREIGN KEY ("restaurant_id") REFERENCES "public"."restaurant"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "menu_item" ADD CONSTRAINT "menu_item_category_id_category_id_fk" FOREIGN KEY ("category_id") REFERENCES "public"."category"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_restaurant_id_restaurant_id_fk" FOREIGN KEY ("restaurant_id") REFERENCES "public"."restaurant"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_delivery_address_id_address_id_fk" FOREIGN KEY ("delivery_address_id") REFERENCES "public"."address"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_driver_id_driver_id_fk" FOREIGN KEY ("driver_id") REFERENCES "public"."driver"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "order_menu_item" ADD CONSTRAINT "order_menu_item_order_id_orders_id_fk" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "order_menu_item" ADD CONSTRAINT "order_menu_item_menu_item_id_menu_item_id_fk" FOREIGN KEY ("menu_item_id") REFERENCES "public"."menu_item"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "order_status" ADD CONSTRAINT "order_status_order_id_orders_id_fk" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "order_status" ADD CONSTRAINT "order_status_status_catalog_id_status_catalog_id_fk" FOREIGN KEY ("status_catalog_id") REFERENCES "public"."status_catalog"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "restaurant" ADD CONSTRAINT "restaurant_city_id_city_id_fk" FOREIGN KEY ("city_id") REFERENCES "public"."city"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "restaurant_owner" ADD CONSTRAINT "restaurant_owner_restaurant_id_restaurant_id_fk" FOREIGN KEY ("restaurant_id") REFERENCES "public"."restaurant"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "restaurant_owner" ADD CONSTRAINT "restaurant_owner_owner_id_users_id_fk" FOREIGN KEY ("owner_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "city" ADD CONSTRAINT "city_ak_1" UNIQUE("name","state_id");