connection: "mycu-prod"

include: "../base_brace_explore.lkml"

explore: +application {
  label: "myCU 📝"
}

explore: +servicer {
  hidden: yes
}
