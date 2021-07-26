connection: "mycu-prod"

include: "../base_brace_explore.lkml"

explore: +application {
  sql_always_where: ${user.email} NOT LIKE '%@brace.ai';;
  label: "myCU 📝"
}


explore: +servicer {
  hidden: yes
}
