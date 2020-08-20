connection: "postgres_dev"

include: "views/*/*.view.lkml"                # include all views in the views/ folder in this project

explore: borrower {
  join: user {
    sql_on: ${borrower.user_id} = ${user.user_id};;
    relationship: one_to_one
  }
}


explore: application {
  join: hardship {
    sql_on: ${application.application_id} = ${hardship.loan_application_id} ;;
    relationship: one_to_one
  }
  join: loan {
    sql_on: ${application.loan_id} = ${loan.loan_id} ;;
    relationship: many_to_one
  }
#   join: property {
#
#   }
}
