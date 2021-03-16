connection: "brace_dev"
persist_for: "60 minutes"

include: "../base_brace_explore.lkml"

explore: +application {
  label: "Brace Dev 📝"
}

explore: +servicer {
  label: "Servicer Dev 📝"
}
