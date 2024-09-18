create policy "CRUD policy for boards"
on "public"."boards"
as permissive
for all
to anon, authenticated
using (true)
with check (true);


create policy "CRUD policy for comments"
on "public"."comments"
as permissive
for all
to anon, authenticated
using (true)
with check (true);


create policy "CRUD policy for teams"
on "public"."teams"
as permissive
for all
to anon, authenticated
using (true)
with check (true);


create policy "CRUD policy for users"
on "public"."users"
as permissive
for all
to anon, authenticated
using (true)
with check (true);



