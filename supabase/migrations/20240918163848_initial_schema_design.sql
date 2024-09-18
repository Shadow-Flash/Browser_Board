create table "public"."boards" (
    "id" text not null default ('board-'::text || gen_random_uuid()),
    "created_at" timestamp with time zone not null default now(),
    "website" text not null,
    "comment_id" text not null,
    "user_id" uuid not null
);


alter table "public"."boards" enable row level security;

create table "public"."comments" (
    "id" text not null default ('comment-'::text || gen_random_uuid()),
    "created_at" timestamp with time zone not null default now(),
    "comment_body" text[] not null,
    "x_path" text not null,
    "updated_at" timestamp with time zone not null default now()
);


alter table "public"."comments" enable row level security;

create table "public"."teams" (
    "id" text not null default ('team-'::text || gen_random_uuid()),
    "created_at" timestamp with time zone not null default now(),
    "name" text not null
);


alter table "public"."teams" enable row level security;

create table "public"."users" (
    "id" uuid not null default auth.uid(),
    "created_at" timestamp with time zone not null default now(),
    "full_name" text,
    "email" text
);


alter table "public"."users" enable row level security;

CREATE UNIQUE INDEX boards_pkey ON public.boards USING btree (id);

CREATE UNIQUE INDEX comments_pkey ON public.comments USING btree (id);

CREATE UNIQUE INDEX teams_pkey ON public.teams USING btree (id);

CREATE UNIQUE INDEX users_pkey ON public.users USING btree (id);

alter table "public"."boards" add constraint "boards_pkey" PRIMARY KEY using index "boards_pkey";

alter table "public"."comments" add constraint "comments_pkey" PRIMARY KEY using index "comments_pkey";

alter table "public"."teams" add constraint "teams_pkey" PRIMARY KEY using index "teams_pkey";

alter table "public"."users" add constraint "users_pkey" PRIMARY KEY using index "users_pkey";

alter table "public"."boards" add constraint "boards_comment_id_fkey" FOREIGN KEY (comment_id) REFERENCES comments(id) not valid;

alter table "public"."boards" validate constraint "boards_comment_id_fkey";

alter table "public"."boards" add constraint "boards_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."boards" validate constraint "boards_user_id_fkey";

alter table "public"."users" add constraint "users_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) not valid;

alter table "public"."users" validate constraint "users_id_fkey";

grant delete on table "public"."boards" to "anon";

grant insert on table "public"."boards" to "anon";

grant references on table "public"."boards" to "anon";

grant select on table "public"."boards" to "anon";

grant trigger on table "public"."boards" to "anon";

grant truncate on table "public"."boards" to "anon";

grant update on table "public"."boards" to "anon";

grant delete on table "public"."boards" to "authenticated";

grant insert on table "public"."boards" to "authenticated";

grant references on table "public"."boards" to "authenticated";

grant select on table "public"."boards" to "authenticated";

grant trigger on table "public"."boards" to "authenticated";

grant truncate on table "public"."boards" to "authenticated";

grant update on table "public"."boards" to "authenticated";

grant delete on table "public"."boards" to "service_role";

grant insert on table "public"."boards" to "service_role";

grant references on table "public"."boards" to "service_role";

grant select on table "public"."boards" to "service_role";

grant trigger on table "public"."boards" to "service_role";

grant truncate on table "public"."boards" to "service_role";

grant update on table "public"."boards" to "service_role";

grant delete on table "public"."comments" to "anon";

grant insert on table "public"."comments" to "anon";

grant references on table "public"."comments" to "anon";

grant select on table "public"."comments" to "anon";

grant trigger on table "public"."comments" to "anon";

grant truncate on table "public"."comments" to "anon";

grant update on table "public"."comments" to "anon";

grant delete on table "public"."comments" to "authenticated";

grant insert on table "public"."comments" to "authenticated";

grant references on table "public"."comments" to "authenticated";

grant select on table "public"."comments" to "authenticated";

grant trigger on table "public"."comments" to "authenticated";

grant truncate on table "public"."comments" to "authenticated";

grant update on table "public"."comments" to "authenticated";

grant delete on table "public"."comments" to "service_role";

grant insert on table "public"."comments" to "service_role";

grant references on table "public"."comments" to "service_role";

grant select on table "public"."comments" to "service_role";

grant trigger on table "public"."comments" to "service_role";

grant truncate on table "public"."comments" to "service_role";

grant update on table "public"."comments" to "service_role";

grant delete on table "public"."teams" to "anon";

grant insert on table "public"."teams" to "anon";

grant references on table "public"."teams" to "anon";

grant select on table "public"."teams" to "anon";

grant trigger on table "public"."teams" to "anon";

grant truncate on table "public"."teams" to "anon";

grant update on table "public"."teams" to "anon";

grant delete on table "public"."teams" to "authenticated";

grant insert on table "public"."teams" to "authenticated";

grant references on table "public"."teams" to "authenticated";

grant select on table "public"."teams" to "authenticated";

grant trigger on table "public"."teams" to "authenticated";

grant truncate on table "public"."teams" to "authenticated";

grant update on table "public"."teams" to "authenticated";

grant delete on table "public"."teams" to "service_role";

grant insert on table "public"."teams" to "service_role";

grant references on table "public"."teams" to "service_role";

grant select on table "public"."teams" to "service_role";

grant trigger on table "public"."teams" to "service_role";

grant truncate on table "public"."teams" to "service_role";

grant update on table "public"."teams" to "service_role";

grant delete on table "public"."users" to "anon";

grant insert on table "public"."users" to "anon";

grant references on table "public"."users" to "anon";

grant select on table "public"."users" to "anon";

grant trigger on table "public"."users" to "anon";

grant truncate on table "public"."users" to "anon";

grant update on table "public"."users" to "anon";

grant delete on table "public"."users" to "authenticated";

grant insert on table "public"."users" to "authenticated";

grant references on table "public"."users" to "authenticated";

grant select on table "public"."users" to "authenticated";

grant trigger on table "public"."users" to "authenticated";

grant truncate on table "public"."users" to "authenticated";

grant update on table "public"."users" to "authenticated";

grant delete on table "public"."users" to "service_role";

grant insert on table "public"."users" to "service_role";

grant references on table "public"."users" to "service_role";

grant select on table "public"."users" to "service_role";

grant trigger on table "public"."users" to "service_role";

grant truncate on table "public"."users" to "service_role";

grant update on table "public"."users" to "service_role";


